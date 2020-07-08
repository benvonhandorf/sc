EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BVH_NRF52_Modules:E73-2G4M08S1C-52840 U3
U 1 1 5CB695CE
P 5700 2250
F 0 "U3" H 5700 1050 50  0000 C CNN
F 1 "E73-2G4M08S1C-52840" V 5400 1000 50  0000 C CNN
F 2 "nrf52:E73(2G4M08S1C)-HandSoldered" H 5700 2250 50  0001 C CNN
F 3 "" H 5700 2250 50  0001 C CNN
	1    5700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4600 5450 4600
Wire Wire Line
	5450 4600 5550 4600
Connection ~ 5450 4600
$Comp
L power:GND #PWR023
U 1 1 5CB69648
P 5450 4800
F 0 "#PWR023" H 5450 4550 50  0001 C CNN
F 1 "GND" H 5455 4627 50  0000 C CNN
F 2 "" H 5450 4800 50  0001 C CNN
F 3 "" H 5450 4800 50  0001 C CNN
	1    5450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4600 5450 4800
Wire Wire Line
	5450 1100 5350 1100
$Comp
L power:+3.3V #PWR020
U 1 1 5CB6971D
P 5350 850
F 0 "#PWR020" H 5350 700 50  0001 C CNN
F 1 "+3.3V" H 5365 1023 50  0000 C CNN
F 2 "" H 5350 850 50  0001 C CNN
F 3 "" H 5350 850 50  0001 C CNN
	1    5350 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1100 5350 850 
$Comp
L Connector:USB_B_Micro J1
U 1 1 5CB69CBE
P 1600 1800
F 0 "J1" H 1655 2267 50  0000 C CNN
F 1 "USB_B_Micro" H 1655 2176 50  0000 C CNN
F 2 "Connectors_USB:USB_Micro-B_Molex-105017-0001" H 1750 1750 50  0001 C CNN
F 3 "~" H 1750 1750 50  0001 C CNN
	1    1600 1800
	1    0    0    -1  
$EndComp
Text GLabel 1900 1800 2    50   Input ~ 0
D+
Text GLabel 1900 1900 2    50   Input ~ 0
D-
Text GLabel 5000 1650 0    50   Input ~ 0
D+
Text GLabel 5000 1750 0    50   Input ~ 0
D-
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J3
U 1 1 5CB6A0E2
P 8850 1200
F 0 "J3" H 8900 1617 50  0000 C CNN
F 1 "SWD" H 8900 1526 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm" H 8850 1200 50  0001 C CNN
F 3 "~" H 8850 1200 50  0001 C CNN
	1    8850 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR036
U 1 1 5CB6A281
P 8450 1000
F 0 "#PWR036" H 8450 850 50  0001 C CNN
F 1 "+3.3V" H 8465 1173 50  0000 C CNN
F 2 "" H 8450 1000 50  0001 C CNN
F 3 "" H 8450 1000 50  0001 C CNN
	1    8450 1000
	1    0    0    -1  
$EndComp
NoConn ~ 1900 2000
$Comp
L power:GND #PWR03
U 1 1 5CB6A351
P 1600 2450
F 0 "#PWR03" H 1600 2200 50  0001 C CNN
F 1 "GND" H 1605 2277 50  0000 C CNN
F 2 "" H 1600 2450 50  0001 C CNN
F 3 "" H 1600 2450 50  0001 C CNN
	1    1600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2200 1600 2450
$Comp
L power:VBUS #PWR08
U 1 1 5CB6A4C6
P 2050 1600
F 0 "#PWR08" H 2050 1450 50  0001 C CNN
F 1 "VBUS" H 2065 1773 50  0000 C CNN
F 2 "" H 2050 1600 50  0001 C CNN
F 3 "" H 2050 1600 50  0001 C CNN
	1    2050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1600 1900 1600
$Comp
L power:VBUS #PWR024
U 1 1 5CB6A5B0
P 5650 850
F 0 "#PWR024" H 5650 700 50  0001 C CNN
F 1 "VBUS" H 5665 1023 50  0000 C CNN
F 2 "" H 5650 850 50  0001 C CNN
F 3 "" H 5650 850 50  0001 C CNN
	1    5650 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 850  5650 1100
$Comp
L power:GND #PWR07
U 1 1 5CB6AA47
P 2000 4400
F 0 "#PWR07" H 2000 4150 50  0001 C CNN
F 1 "GND" H 2005 4227 50  0000 C CNN
F 2 "" H 2000 4400 50  0001 C CNN
F 3 "" H 2000 4400 50  0001 C CNN
	1    2000 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 5CB6AAC7
P 2000 4100
F 0 "#PWR06" H 2000 3950 50  0001 C CNN
F 1 "+3.3V" H 2015 4273 50  0000 C CNN
F 2 "" H 2000 4100 50  0001 C CNN
F 3 "" H 2000 4100 50  0001 C CNN
	1    2000 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CB6AB09
P 2000 4250
F 0 "C2" V 1850 4200 50  0000 L CNN
F 1 "0.1uF" V 2150 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2038 4100 50  0001 C CNN
F 3 "~" H 2000 4250 50  0001 C CNN
	1    2000 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5CB6AF47
P 1600 4400
F 0 "#PWR05" H 1600 4150 50  0001 C CNN
F 1 "GND" H 1605 4227 50  0000 C CNN
F 2 "" H 1600 4400 50  0001 C CNN
F 3 "" H 1600 4400 50  0001 C CNN
	1    1600 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR04
U 1 1 5CB6AF4D
P 1600 4100
F 0 "#PWR04" H 1600 3950 50  0001 C CNN
F 1 "+3.3V" H 1615 4273 50  0000 C CNN
F 2 "" H 1600 4100 50  0001 C CNN
F 3 "" H 1600 4100 50  0001 C CNN
	1    1600 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5CB6AF53
P 1600 4250
F 0 "C1" V 1450 4200 50  0000 L CNN
F 1 "10uF" V 1750 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1638 4100 50  0001 C CNN
F 3 "~" H 1600 4250 50  0001 C CNN
	1    1600 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5CB6B015
P 2400 4400
F 0 "#PWR012" H 2400 4150 50  0001 C CNN
F 1 "GND" H 2405 4227 50  0000 C CNN
F 2 "" H 2400 4400 50  0001 C CNN
F 3 "" H 2400 4400 50  0001 C CNN
	1    2400 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR011
U 1 1 5CB6B01B
P 2400 4100
F 0 "#PWR011" H 2400 3950 50  0001 C CNN
F 1 "+3.3V" H 2415 4273 50  0000 C CNN
F 2 "" H 2400 4100 50  0001 C CNN
F 3 "" H 2400 4100 50  0001 C CNN
	1    2400 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5CB6B021
P 2400 4250
F 0 "C4" V 2250 4200 50  0000 L CNN
F 1 "0.1uF" V 2550 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2438 4100 50  0001 C CNN
F 3 "~" H 2400 4250 50  0001 C CNN
	1    2400 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5CB6B118
P 2800 4400
F 0 "#PWR014" H 2800 4150 50  0001 C CNN
F 1 "GND" H 2805 4227 50  0000 C CNN
F 2 "" H 2800 4400 50  0001 C CNN
F 3 "" H 2800 4400 50  0001 C CNN
	1    2800 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5CB6B124
P 2800 4250
F 0 "C5" V 2650 4200 50  0000 L CNN
F 1 "10uF" V 2950 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2838 4100 50  0001 C CNN
F 3 "~" H 2800 4250 50  0001 C CNN
	1    2800 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR013
U 1 1 5CB6B1D4
P 2800 4100
F 0 "#PWR013" H 2800 3950 50  0001 C CNN
F 1 "VBUS" H 2815 4273 50  0000 C CNN
F 2 "" H 2800 4100 50  0001 C CNN
F 3 "" H 2800 4100 50  0001 C CNN
	1    2800 4100
	1    0    0    -1  
$EndComp
Text GLabel 9150 1000 2    50   Input ~ 10
SWDIO
Text GLabel 9150 1100 2    50   Input ~ 10
SWCLK
Text GLabel 5000 2300 0    50   Input ~ 10
SWDIO
Text GLabel 5000 2400 0    50   Input ~ 10
SWCLK
Text GLabel 5000 2800 0    50   Input ~ 10
RESET
Text GLabel 9150 1400 2    50   Input ~ 10
RESET
$Comp
L power:GND #PWR037
U 1 1 5CB6B4D9
P 8450 1300
F 0 "#PWR037" H 8450 1050 50  0001 C CNN
F 1 "GND" H 8455 1127 50  0000 C CNN
F 2 "" H 8450 1300 50  0001 C CNN
F 3 "" H 8450 1300 50  0001 C CNN
	1    8450 1300
	1    0    0    -1  
$EndComp
Text GLabel 9100 2350 0    50   Input ~ 0
Y
Text GLabel 9100 2450 0    50   Input ~ 0
X
Text GLabel 9050 3200 0    50   Input ~ 0
LCLK
Text GLabel 9050 3100 0    50   Input ~ 0
RCLK
Text GLabel 6500 1450 2    50   Input ~ 0
LED
Text GLabel 6500 1550 2    50   Input ~ 0
A1_P003
Text GLabel 6500 2250 2    50   Input ~ 0
XL1
Text GLabel 6500 2350 2    50   Input ~ 0
XL2
Text GLabel 8750 5750 0    50   Input ~ 0
XL1
Text GLabel 8750 6050 0    50   Input ~ 0
XL2
$Comp
L Device:Crystal Y1
U 1 1 5CB90240
P 9000 5900
F 0 "Y1" V 9000 5700 50  0000 L CNN
F 1 "32,768 Hz" H 8800 6100 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_5032-2pin_5.0x3.2mm_HandSoldering" H 9000 5900 50  0001 C CNN
F 3 "~" H 9000 5900 50  0001 C CNN
	1    9000 5900
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5CB9037D
P 9500 5700
F 0 "C7" V 9248 5700 50  0000 C CNN
F 1 "22pF" V 9339 5700 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9538 5550 50  0001 C CNN
F 3 "~" H 9500 5700 50  0001 C CNN
	1    9500 5700
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 5CB90446
P 9500 6100
F 0 "C8" V 9752 6100 50  0000 C CNN
F 1 "22pF" V 9661 6100 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9538 5950 50  0001 C CNN
F 3 "~" H 9500 6100 50  0001 C CNN
	1    9500 6100
	0    1    -1   0   
$EndComp
Wire Wire Line
	9350 6100 9000 6100
Wire Wire Line
	9000 6100 9000 6050
Wire Wire Line
	9000 6050 8750 6050
Connection ~ 9000 6050
Wire Wire Line
	8750 5750 9000 5750
Wire Wire Line
	9000 5750 9000 5700
Wire Wire Line
	9000 5700 9350 5700
Connection ~ 9000 5750
$Comp
L power:GND #PWR038
U 1 1 5CB93BD3
P 9900 5900
F 0 "#PWR038" H 9900 5650 50  0001 C CNN
F 1 "GND" H 9905 5727 50  0000 C CNN
F 2 "" H 9900 5900 50  0001 C CNN
F 3 "" H 9900 5900 50  0001 C CNN
	1    9900 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 5700 9650 5900
Wire Wire Line
	9650 5900 9900 5900
Connection ~ 9650 5900
Wire Wire Line
	9650 5900 9650 6100
Text Notes 8450 5500 0    50   ~ 0
Optional 32kHz crystal\n
Wire Notes Line
	10150 5300 10150 6300
Wire Notes Line
	10150 6300 8250 6300
Wire Notes Line
	8250 6300 8250 5300
Wire Notes Line
	8250 5300 10150 5300
Text Notes 2000 3750 0    50   ~ 0
Decoupling
Wire Notes Line
	3100 3650 3100 4700
Wire Notes Line
	3100 4700 1400 4700
Wire Notes Line
	1400 4700 1400 3650
Wire Notes Line
	1400 3650 3100 3650
$Comp
L power:GND #PWR033
U 1 1 5CBA0859
P 8650 3400
F 0 "#PWR033" H 8650 3150 50  0001 C CNN
F 1 "GND" H 8655 3227 50  0000 C CNN
F 2 "" H 8650 3400 50  0001 C CNN
F 3 "" H 8650 3400 50  0001 C CNN
	1    8650 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5CBA0911
P 8900 2650
F 0 "#PWR035" H 8900 2400 50  0001 C CNN
F 1 "GND" H 8905 2477 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2650 8900 2650
Wire Wire Line
	8650 3400 9050 3400
$Comp
L power:+3.3V #PWR034
U 1 1 5CBA3A08
P 8900 2550
F 0 "#PWR034" H 8900 2400 50  0001 C CNN
F 1 "+3.3V" H 8915 2723 50  0000 C CNN
F 2 "" H 8900 2550 50  0001 C CNN
F 3 "" H 8900 2550 50  0001 C CNN
	1    8900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2550 9100 2550
Text GLabel 9100 2250 0    50   Input ~ 0
SW
$Comp
L power:+BATT #PWR028
U 1 1 5CBA5D8D
P 7350 5000
F 0 "#PWR028" H 7350 4850 50  0001 C CNN
F 1 "+BATT" H 7365 5173 50  0000 C CNN
F 2 "" H 7350 5000 50  0001 C CNN
F 3 "" H 7350 5000 50  0001 C CNN
	1    7350 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5CBA5E01
P 7350 5600
F 0 "#PWR029" H 7350 5350 50  0001 C CNN
F 1 "GND" H 7355 5427 50  0000 C CNN
F 2 "" H 7350 5600 50  0001 C CNN
F 3 "" H 7350 5600 50  0001 C CNN
	1    7350 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5CBA5E75
P 7350 5150
F 0 "R5" H 7420 5196 50  0000 L CNN
F 1 "100K" V 7350 5050 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7280 5150 50  0001 C CNN
F 3 "~" H 7350 5150 50  0001 C CNN
	1    7350 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5CBA5F99
P 7350 5450
F 0 "R6" H 7420 5496 50  0000 L CNN
F 1 "100K" V 7350 5350 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7280 5450 50  0001 C CNN
F 3 "~" H 7350 5450 50  0001 C CNN
	1    7350 5450
	1    0    0    -1  
$EndComp
Text GLabel 7050 5300 0    50   Input ~ 0
BATSENSE
Wire Wire Line
	7050 5300 7350 5300
Connection ~ 7350 5300
Text GLabel 6500 1650 2    50   Input ~ 0
BATSENSE
Text GLabel 6500 2050 2    50   Input ~ 0
X
Text GLabel 6500 1950 2    50   Input ~ 0
Y
Text GLabel 6500 1850 2    50   Input ~ 0
SW
Text GLabel 6500 2650 2    50   Input ~ 0
RCLK
Text GLabel 6500 2150 2    50   Input ~ 0
LCLK
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 5CBA7BCF
P 9300 2450
F 0 "J6" H 9272 2330 50  0000 R CNN
F 1 "JOY" H 9272 2421 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_B6B-PH-K_06x2.00mm_Straight" H 9300 2450 50  0001 C CNN
F 3 "~" H 9300 2450 50  0001 C CNN
	1    9300 2450
	-1   0    0    1   
$EndComp
Text GLabel 9100 2150 0    50   Input ~ 0
A1_P003
$Comp
L Connector:Conn_01x06_Male J5
U 1 1 5CBAA933
P 9250 3200
F 0 "J5" H 9222 3080 50  0000 R CNN
F 1 "SWTCH" H 9222 3171 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_B6B-PH-K_06x2.00mm_Straight" H 9250 3200 50  0001 C CNN
F 3 "~" H 9250 3200 50  0001 C CNN
	1    9250 3200
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR032
U 1 1 5CBAC8D3
P 8650 3300
F 0 "#PWR032" H 8650 3150 50  0001 C CNN
F 1 "+3.3V" H 8665 3473 50  0000 C CNN
F 2 "" H 8650 3300 50  0001 C CNN
F 3 "" H 8650 3300 50  0001 C CNN
	1    8650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3300 9050 3300
Text GLabel 6500 2850 2    50   Input ~ 0
P1_09
Text GLabel 9050 2900 0    50   Input ~ 0
P1_09
NoConn ~ 6500 2450
NoConn ~ 6500 2550
NoConn ~ 6500 2750
NoConn ~ 6500 2950
NoConn ~ 6500 3050
NoConn ~ 6500 3150
NoConn ~ 6500 3250
NoConn ~ 6500 3350
NoConn ~ 6500 3450
NoConn ~ 6500 3650
NoConn ~ 6500 3850
NoConn ~ 6500 3950
NoConn ~ 6500 4050
NoConn ~ 6500 4350
Text GLabel 6500 1350 2    50   Input ~ 0
P1_11
Text GLabel 9050 3000 0    50   Input ~ 0
P1_11
NoConn ~ 1500 2200
NoConn ~ 5550 1100
NoConn ~ 6500 1750
Text GLabel 5050 5200 2    50   Input ~ 0
LED
$Comp
L power:GND #PWR021
U 1 1 5CBC9BC3
P 5350 5500
F 0 "#PWR021" H 5350 5250 50  0001 C CNN
F 1 "GND" H 5355 5327 50  0000 C CNN
F 2 "" H 5350 5500 50  0001 C CNN
F 3 "" H 5350 5500 50  0001 C CNN
	1    5350 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5CBC9C04
P 5050 5350
F 0 "D2" H 5050 5250 50  0000 C CNN
F 1 "LED" H 5041 5475 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 5050 5350 50  0001 C CNN
F 3 "~" H 5050 5350 50  0001 C CNN
	1    5050 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5CBC9D66
P 5200 5500
F 0 "R3" V 5300 5450 50  0000 L CNN
F 1 "1K" V 5200 5450 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5130 5500 50  0001 C CNN
F 3 "~" H 5200 5500 50  0001 C CNN
	1    5200 5500
	0    1    1    0   
$EndComp
NoConn ~ 6500 4250
NoConn ~ 6500 4150
NoConn ~ 6500 3750
NoConn ~ 6500 3550
$Sheet
S 1650 6050 700  550 
U 5CC5C4D3
F0 "USB/LiPo Power Management 3.3V" 50
F1 "UsbBat33vPower.sch" 50
$EndSheet
$Comp
L Switch:SW_SPST RST1
U 1 1 5CC61396
P 2500 5200
F 0 "RST1" H 2500 5435 50  0000 C CNN
F 1 "SW_SPST" H 2500 5344 50  0000 C CNN
F 2 "Switches:Tac_SPST_RightAngle_SideActuated_THT" H 2500 5200 50  0001 C CNN
F 3 "" H 2500 5200 50  0001 C CNN
	1    2500 5200
	1    0    0    -1  
$EndComp
Text GLabel 2700 5200 2    50   Input ~ 0
RESET
$Comp
L power:GND #PWR0114
U 1 1 5CC61507
P 2300 5200
F 0 "#PWR0114" H 2300 4950 50  0001 C CNN
F 1 "GND" H 2305 5027 50  0000 C CNN
F 2 "" H 2300 5200 50  0001 C CNN
F 3 "" H 2300 5200 50  0001 C CNN
	1    2300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1000 8650 1000
Wire Wire Line
	8650 1100 8650 1200
Wire Wire Line
	8650 1200 8450 1200
Wire Wire Line
	8450 1200 8450 1300
Connection ~ 8650 1200
Wire Wire Line
	8650 1400 8550 1400
Wire Wire Line
	8550 1400 8550 1300
Wire Wire Line
	8550 1300 8450 1300
Connection ~ 8450 1300
NoConn ~ 9150 1300
NoConn ~ 8650 1300
NoConn ~ 9150 1200
$EndSCHEMATC
