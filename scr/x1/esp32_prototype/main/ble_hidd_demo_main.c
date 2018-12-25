/* This example code is in the Public Domain (or CC0 licensed, at your option.)
   Unless required by applicable law or agreed to in writing, this software is 
   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR  
   CONDITIONS OF ANY KIND, either express or implied.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_bt.h"

#include "esp_hidd_prf_api.h"
#include "esp_bt_defs.h"
#include "esp_gap_ble_api.h"
#include "esp_gatts_api.h"
#include "esp_gatt_defs.h"
#include "esp_bt_main.h"
#include "esp_bt_device.h"
#include "driver/gpio.h"
#include "hid_dev.h"
#include "driver/adc.h"

/**
 * Brief:
 * This test code shows how to configure gpio and how to use gpio interrupt.
 *
 * GPIO status:
 * GPIO18: output
 * GPIO19: output
 * GPIO4:  input, pulled up, interrupt from rising edge and falling edge
 * GPIO5:  input, pulled up, interrupt from rising edge.
 *
 * Test:
 * Connect GPIO18 with GPIO4
 * Connect GPIO19 with GPIO5
 * Generate pulses on GPIO18/19, that triggers interrupt on GPIO4/5
 *
 */

#define HID_DEMO_TAG "HID_DEMO"


#define GPIO_OUTPUT_DBG     23
#define GPIO_OUTPUT_PIN_BITMASK  ((1<<GPIO_OUTPUT_DBG))
//ADC1 CHANNEL 0
#define GPIO_INPUT_X_ANALOG 32
#define GPIO_INPUT_X_ADC1_CHANNEL ADC1_GPIO32_CHANNEL
//ADC2 CHANNEL 2
#define GPIO_INPUT_Y_ANALOG  33
#define GPIO_INPUT_Y_ADC1_CHANNEL ADC1_GPIO33_CHANNEL

//Button GPIOs
#define GPIO_INPUT_SWITCH_LCLICK    16
#define GPIO_INPUT_SWITCH_RCLICK    17

#define GPIO_INPUT_INT_BITMASK  ((1<<GPIO_INPUT_SWITCH_LCLICK)|(1<<GPIO_INPUT_SWITCH_RCLICK))
#define ESP_INTR_FLAG_DEFAULT 0

static xQueueHandle gpio_evt_queue = NULL;
static uint16_t hid_conn_id = 0;
static bool sec_conn = false;

#define CHAR_DECLARATION_SIZE   (sizeof(uint8_t))

static void hidd_event_callback(esp_hidd_cb_event_t event, esp_hidd_cb_param_t *param);

#define HIDD_DEVICE_NAME            "SCR-X1"
static uint8_t hidd_service_uuid128[] = {
    /* LSB <--------------------------------------------------------------------------------> MSB */
    //first uuid, 16bit, [12],[13] is the value
    0xfb, 0x34, 0x9b, 0x5f, 0x80, 0x00, 0x00, 0x80, 0x00, 0x10, 0x00, 0x00, 0x12, 0x18, 0x00, 0x00,
};

static esp_ble_adv_data_t hidd_adv_data = {
    .set_scan_rsp = false,
    .include_name = true,
    .include_txpower = true,
    .min_interval = 0x20,
    .max_interval = 0x30,
    .appearance = 0x03c0,       //HID Generic,
    .manufacturer_len = 0,
    .p_manufacturer_data =  NULL,
    .service_data_len = 0,
    .p_service_data = NULL,
    .service_uuid_len = sizeof(hidd_service_uuid128),
    .p_service_uuid = hidd_service_uuid128,
    .flag = 0x6,
};

static esp_ble_adv_params_t hidd_adv_params = {
    .adv_int_min        = 0x20,
    .adv_int_max        = 0x30,
    .adv_type           = ADV_TYPE_IND,
    .own_addr_type      = BLE_ADDR_TYPE_PUBLIC,
    //.peer_addr            =
    //.peer_addr_type       =
    .channel_map        = ADV_CHNL_ALL,
    .adv_filter_policy = ADV_FILTER_ALLOW_SCAN_ANY_CON_ANY,
};

void IRAM_ATTR gpio_switch_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
}

uint8_t lclick_debounced = 0;
int64_t lclick_time_changed = 0;
uint8_t rclick_debounced = 0;
int64_t rclick_time_changed = 0;

#define DEBOUNCE_LOCKOUT_US 100

void gpio_switch_task(void* arg)
{
    static uint8_t i = 0;
    uint32_t io_num;
    uint32_t io_level;
    int64_t time ;
    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            io_level = gpio_get_level(io_num);
            time = esp_timer_get_time();

            switch(io_num) {
                case GPIO_INPUT_SWITCH_LCLICK:
                    if((time - lclick_time_changed) > DEBOUNCE_LOCKOUT_US) {
                        lclick_debounced = io_level;
                        lclick_time_changed = time;
                    }
                    break;
                case GPIO_INPUT_SWITCH_RCLICK:
                    if((time - rclick_time_changed) > DEBOUNCE_LOCKOUT_US) {
                        rclick_debounced = io_level;
                        rclick_time_changed = time;
                    }
                    break;
            }

            ESP_LOGI(HID_DEMO_TAG, "GPIO[%d] intr, val: %d", io_num, gpio_get_level(io_num));

            gpio_set_level(GPIO_OUTPUT_DBG, io_level);

            if(i == 0) {
                ++i;
            }
        }
    }
}

static void gpio_mouse_init(void)
{
    gpio_config_t io_conf;
    //disable interrupt
    io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
    //set as output mode        
    io_conf.mode = GPIO_MODE_OUTPUT;
    //bit mask of the pins that you want to set,e.g.GPIO18/19
    io_conf.pin_bit_mask = GPIO_OUTPUT_PIN_BITMASK;
    //disable pull-down mode
    io_conf.pull_down_en = 0;
    //disable pull-up mode
    io_conf.pull_up_en = 0;
    //configure GPIO with the given settings
    gpio_config(&io_conf);


    //Configure analog pins
    // io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
    // io_conf.pin_bit_mask = GPIO_INPUT_ADC_BITMASK;
    // io_conf.mode = GPIO_MODE_INPUT;
    // io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
    // gpio_config(&io_conf);
    
    //switch pins
    io_conf.intr_type = GPIO_INTR_ANYEDGE;
    io_conf.pin_bit_mask = GPIO_INPUT_INT_BITMASK;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = GPIO_PULLUP_ENABLE;
    gpio_config(&io_conf);

    //create a queue to handle gpio event from isr
    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    //start gpio task
    xTaskCreate(gpio_switch_task, "gpio_switch_task", 2048, NULL, 10, NULL);

    //install gpio isr service to allow per-pin GPIO interrupts
    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);
    //hook isr handler for specific gpio pin
    gpio_isr_handler_add(GPIO_INPUT_SWITCH_LCLICK, gpio_switch_isr_handler, (void*) GPIO_INPUT_SWITCH_LCLICK);
    gpio_isr_handler_add(GPIO_INPUT_SWITCH_RCLICK, gpio_switch_isr_handler, (void*) GPIO_INPUT_SWITCH_RCLICK);

    adc1_config_width(ADC_WIDTH_BIT_12);
    adc1_config_channel_atten(GPIO_INPUT_X_ADC1_CHANNEL, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(GPIO_INPUT_Y_ADC1_CHANNEL, ADC_ATTEN_DB_11);
}



static void hidd_event_callback(esp_hidd_cb_event_t event, esp_hidd_cb_param_t *param)
{
    switch(event) {
        case ESP_HIDD_EVENT_REG_FINISH: {
            if (param->init_finish.state == ESP_HIDD_INIT_OK) {
                //esp_bd_addr_t rand_addr = {0x04,0x11,0x11,0x11,0x11,0x05};
                esp_ble_gap_set_device_name(HIDD_DEVICE_NAME);
                esp_ble_gap_config_adv_data(&hidd_adv_data);
                
            }
            break;
        }
        case ESP_BAT_EVENT_REG: {
            break;
        }
        case ESP_HIDD_EVENT_DEINIT_FINISH:
        break;
        case ESP_HIDD_EVENT_BLE_CONNECT: {
            ESP_LOGI(HID_DEMO_TAG, "ESP_HIDD_EVENT_BLE_CONNECT");
            hid_conn_id = param->connect.conn_id;
            break;
        }
        case ESP_HIDD_EVENT_BLE_DISCONNECT: {
            sec_conn = false;
            ESP_LOGI(HID_DEMO_TAG, "ESP_HIDD_EVENT_BLE_DISCONNECT");
            esp_ble_gap_start_advertising(&hidd_adv_params);
            break;
        }
        case ESP_HIDD_EVENT_BLE_VENDOR_REPORT_WRITE_EVT: {
            ESP_LOGI(HID_DEMO_TAG, "%s, ESP_HIDD_EVENT_BLE_VENDOR_REPORT_WRITE_EVT", __func__);
            ESP_LOG_BUFFER_HEX(HID_DEMO_TAG, param->vendor_write.data, param->vendor_write.length);
        }    
        default:
        break;
    }
    return;
}

static void gap_event_handler(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param)
{
    switch (event) {
        case ESP_GAP_BLE_ADV_DATA_SET_COMPLETE_EVT:
            esp_ble_gap_start_advertising(&hidd_adv_params);
            break;
        case ESP_GAP_BLE_SEC_REQ_EVT:
            for(int i = 0; i < ESP_BD_ADDR_LEN; i++) {
                ESP_LOGD(HID_DEMO_TAG, "%x:",param->ble_security.ble_req.bd_addr[i]);
            }
            esp_ble_gap_security_rsp(param->ble_security.ble_req.bd_addr, true);
            break;
        case ESP_GAP_BLE_AUTH_CMPL_EVT:
            sec_conn = true;
            esp_bd_addr_t bd_addr;
            memcpy(bd_addr, param->ble_security.auth_cmpl.bd_addr, sizeof(esp_bd_addr_t));
            ESP_LOGI(HID_DEMO_TAG, "remote BD_ADDR: %08x%04x",\
               (bd_addr[0] << 24) + (bd_addr[1] << 16) + (bd_addr[2] << 8) + bd_addr[3],
               (bd_addr[4] << 8) + bd_addr[5]);
            ESP_LOGI(HID_DEMO_TAG, "address type = %d", param->ble_security.auth_cmpl.addr_type);
            ESP_LOGI(HID_DEMO_TAG, "pair status = %s",param->ble_security.auth_cmpl.success ? "success" : "fail");
            if(!param->ble_security.auth_cmpl.success) {
                ESP_LOGE(HID_DEMO_TAG, "fail reason = 0x%x",param->ble_security.auth_cmpl.fail_reason);
            }
            break;
        default:
            break;
    }
}

int readAvg(adc1_channel_t channel) {
    int total = 0;

    total += adc1_get_raw(channel);
    total += adc1_get_raw(channel);
    total += adc1_get_raw(channel);
    total += adc1_get_raw(channel);

    return total / 4;
}

#define MOUSE_CENTER 1955
#define DEAD_ZONE_SIDE 20
#define DEAD_ZONE_LOW (MOUSE_CENTER - DEAD_ZONE_SIDE)
#define DEAD_ZONE_HIGH (MOUSE_CENTER + DEAD_ZONE_SIDE)
#define MOUSE_SCALE 16

int readingToMouseDelta(int value) {
    if(value > DEAD_ZONE_LOW
        && value < DEAD_ZONE_HIGH) {
        return 0;
    }

    return ( value - MOUSE_CENTER ) / MOUSE_SCALE;
}

void hid_demo_task(void *pvParameters)
{
    uint32_t newLevel = 0;
    int rawX = 0;
    int mouseX = 0;
    int rawY = 0;
    int mouseY = 0;

    uint8_t buttonState = 0;

    while(1) {
        vTaskDelay(50 / portTICK_PERIOD_MS);
        if (sec_conn) {
            rawX = readAvg(GPIO_INPUT_X_ADC1_CHANNEL);
            mouseX = readingToMouseDelta(rawX);

            rawY = readAvg(GPIO_INPUT_Y_ADC1_CHANNEL);
            mouseY = -readingToMouseDelta(rawY);

            buttonState = (lclick_debounced << 0) | (rclick_debounced << 1);

            ESP_LOGI(HID_DEMO_TAG, "x: %d\t%d\ty: %d\t%d\tbuttons: %x", rawX, mouseX, rawY, mouseY, buttonState);

            esp_hidd_send_mouse_value(hid_conn_id, buttonState, mouseX, mouseY);

            //Toggle the output LED
            newLevel = !newLevel;

            gpio_set_level(GPIO_OUTPUT_DBG, newLevel);
        }
    }
}


void app_main()
{
    esp_err_t ret;

    // Initialize NVS.
    ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK( ret );

    ESP_ERROR_CHECK(esp_bt_controller_mem_release(ESP_BT_MODE_CLASSIC_BT));

    esp_bt_controller_config_t bt_cfg = BT_CONTROLLER_INIT_CONFIG_DEFAULT();
    ret = esp_bt_controller_init(&bt_cfg);
    if (ret) {
        ESP_LOGE(HID_DEMO_TAG, "%s initialize controller failed\n", __func__);
        return;
    }

    ret = esp_bt_controller_enable(ESP_BT_MODE_BLE);
    if (ret) {
        ESP_LOGE(HID_DEMO_TAG, "%s enable controller failed\n", __func__);
        return;
    }

    ret = esp_bluedroid_init();
    if (ret) {
        ESP_LOGE(HID_DEMO_TAG, "%s init bluedroid failed\n", __func__);
        return;
    }

    ret = esp_bluedroid_enable();
    if (ret) {
        ESP_LOGE(HID_DEMO_TAG, "%s init bluedroid failed\n", __func__);
        return;
    }

    if((ret = esp_hidd_profile_init()) != ESP_OK) {
        ESP_LOGE(HID_DEMO_TAG, "%s init bluedroid failed\n", __func__);
    }

    ///register the callback function to the gap module
    esp_ble_gap_register_callback(gap_event_handler);
    esp_hidd_register_callbacks(hidd_event_callback);

    /* set the security iocap & auth_req & key size & init key response key parameters to the stack*/
    esp_ble_auth_req_t auth_req = ESP_LE_AUTH_BOND;     //bonding with peer device after authentication
    esp_ble_io_cap_t iocap = ESP_IO_CAP_NONE;           //set the IO capability to No output No input
    uint8_t key_size = 16;      //the key size should be 7~16 bytes
    uint8_t init_key = ESP_BLE_ENC_KEY_MASK | ESP_BLE_ID_KEY_MASK;
    uint8_t rsp_key = ESP_BLE_ENC_KEY_MASK | ESP_BLE_ID_KEY_MASK;
    esp_ble_gap_set_security_param(ESP_BLE_SM_AUTHEN_REQ_MODE, &auth_req, sizeof(uint8_t));
    esp_ble_gap_set_security_param(ESP_BLE_SM_IOCAP_MODE, &iocap, sizeof(uint8_t));
    esp_ble_gap_set_security_param(ESP_BLE_SM_MAX_KEY_SIZE, &key_size, sizeof(uint8_t));
    /* If your BLE device act as a Slave, the init_key means you hope which types of key of the master should distribut to you,
    and the response key means which key you can distribut to the Master;
    If your BLE device act as a master, the response key means you hope which types of key of the slave should distribut to you, 
    and the init key means which key you can distribut to the slave. */
    esp_ble_gap_set_security_param(ESP_BLE_SM_SET_INIT_KEY, &init_key, sizeof(uint8_t));
    esp_ble_gap_set_security_param(ESP_BLE_SM_SET_RSP_KEY, &rsp_key, sizeof(uint8_t));

    //init the gpio pins and handler
    gpio_mouse_init();

    xTaskCreate(&hid_demo_task, "hid_task", 2048, NULL, 5, NULL);
}

