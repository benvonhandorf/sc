deps_config := \
	/home/benvh/tools/esp/esp-idf/components/app_trace/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/aws_iot/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/bt/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/driver/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/esp32/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/esp_adc_cal/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/esp_http_client/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/ethernet/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/fatfs/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/freertos/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/heap/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/libsodium/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/log/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/lwip/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/mbedtls/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/nvs_flash/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/openssl/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/pthread/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/spi_flash/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/spiffs/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/tcpip_adapter/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/vfs/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/wear_levelling/Kconfig \
	/home/benvh/tools/esp/esp-idf/components/bootloader/Kconfig.projbuild \
	/home/benvh/tools/esp/esp-idf/components/esptool_py/Kconfig.projbuild \
	/home/benvh/tools/esp/esp-idf/components/partition_table/Kconfig.projbuild \
	/home/benvh/tools/esp/esp-idf/Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(IDF_CMAKE)" "n"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
