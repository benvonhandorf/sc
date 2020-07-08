EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L BVH_Sensors:PAW3204 U2
U 1 1 5EF131FB
P 5850 3600
F 0 "U2" H 5800 3975 50  0000 C CNN
F 1 "PAW3204" H 5400 3150 50  0000 C CNN
F 2 "BVH_Components_Misc:PAW3204" H 5850 3600 50  0001 C CNN
F 3 "" H 5850 3600 50  0001 C CNN
	1    5850 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EF13D4D
P 4050 4950
F 0 "R1" H 4120 4996 50  0000 L CNN
F 1 "R" H 4120 4905 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 3980 4950 50  0001 C CNN
F 3 "~" H 4050 4950 50  0001 C CNN
	1    4050 4950
	1    0    0    -1  
$EndComp
Text GLabel 4050 5200 2    50   Input ~ 0
LED_A
Text GLabel 6450 3950 2    50   Input ~ 0
LED_A
Wire Wire Line
	4050 5100 4050 5200
Text GLabel 6450 3750 2    50   Input ~ 0
VDDA
Text GLabel 6450 3650 2    50   Input ~ 0
VDD
$Comp
L power:GND #PWR04
U 1 1 5EF1462C
P 6800 3550
F 0 "#PWR04" H 6800 3300 50  0001 C CNN
F 1 "GND" H 6805 3377 50  0000 C CNN
F 2 "" H 6800 3550 50  0001 C CNN
F 3 "" H 6800 3550 50  0001 C CNN
	1    6800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3550 6450 3550
Text GLabel 5050 4800 2    50   Input ~ 0
VDDA
$Comp
L BVH_Voltage_Regulators:C C3
U 1 1 5EF1C348
P 1550 3550
F 0 "C3" H 1665 3596 50  0000 L CNN
F 1 "10uF" H 1665 3505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1588 3400 50  0001 C CNN
F 3 "" H 1550 3550 50  0001 C CNN
	1    1550 3550
	1    0    0    -1  
$EndComp
Text GLabel 1550 3200 0    50   Input ~ 0
VDD
Wire Wire Line
	1550 3400 1550 3200
$Comp
L power:GND #PWR06
U 1 1 5EF1CB20
P 1550 3800
F 0 "#PWR06" H 1550 3550 50  0001 C CNN
F 1 "GND" H 1555 3627 50  0000 C CNN
F 2 "" H 1550 3800 50  0001 C CNN
F 3 "" H 1550 3800 50  0001 C CNN
	1    1550 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3800 1550 3700
$Comp
L BVH_Voltage_Regulators:C C4
U 1 1 5EF1DF8F
P 2050 3550
F 0 "C4" H 2165 3596 50  0000 L CNN
F 1 "0.1uF" H 2165 3505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2088 3400 50  0001 C CNN
F 3 "" H 2050 3550 50  0001 C CNN
	1    2050 3550
	1    0    0    -1  
$EndComp
Text GLabel 2050 3200 0    50   Input ~ 0
VDD
Wire Wire Line
	2050 3400 2050 3200
$Comp
L power:GND #PWR07
U 1 1 5EF1DF9B
P 2050 3800
F 0 "#PWR07" H 2050 3550 50  0001 C CNN
F 1 "GND" H 2055 3627 50  0000 C CNN
F 2 "" H 2050 3800 50  0001 C CNN
F 3 "" H 2050 3800 50  0001 C CNN
	1    2050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3800 2050 3700
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 5EF1F473
P 9200 1300
F 0 "J1" H 9280 1292 50  0000 L CNN
F 1 "Conn_01x06" H 9280 1201 50  0000 L CNN
F 2 "Connectors_JST:JST_PH_B6B-PH-K_06x2.00mm_Straight" H 9200 1300 50  0001 C CNN
F 3 "~" H 9200 1300 50  0001 C CNN
	1    9200 1300
	1    0    0    -1  
$EndComp
Text GLabel 6450 4050 2    50   Input ~ 0
LED_C
Text GLabel 6450 3450 2    50   Input ~ 0
LED_C
$Comp
L power:GND #PWR03
U 1 1 5EF22A05
P 8450 850
F 0 "#PWR03" H 8450 600 50  0001 C CNN
F 1 "GND" H 8455 677 50  0000 C CNN
F 2 "" H 8450 850 50  0001 C CNN
F 3 "" H 8450 850 50  0001 C CNN
	1    8450 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 850  8850 850 
Wire Wire Line
	8850 850  8850 1100
Wire Wire Line
	8850 1100 9000 1100
Text GLabel 9000 1300 0    50   Input ~ 0
SDIO
Text GLabel 5150 3650 0    50   Input ~ 0
SDIO
Text GLabel 5150 3750 0    50   Input ~ 0
SCLK
Text GLabel 9000 1400 0    50   Input ~ 0
SCLK
Text GLabel 9000 1500 0    50   Input ~ 0
RST
Text GLabel 5150 3450 0    50   Input ~ 0
RST
Text GLabel 5150 3550 0    50   Input ~ 0
MOTSWK
Text GLabel 9000 1600 0    50   Input ~ 0
MOTSWK
Text Notes 1650 4150 0    50   ~ 0
Decoupling
Wire Notes Line
	1200 3050 2500 3050
Wire Notes Line
	2500 3050 2500 4300
Wire Notes Line
	2500 4300 1200 4300
Wire Notes Line
	1200 4300 1200 3050
Text Notes 5600 3000 0    50   ~ 0
VDD - 2.8V
$Comp
L BVH_Voltage_Regulators:C C5
U 1 1 5EF74ECE
P 5050 5100
F 0 "C5" H 5165 5146 50  0000 L CNN
F 1 "1uF" H 5165 5055 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5088 4950 50  0001 C CNN
F 3 "" H 5050 5100 50  0001 C CNN
	1    5050 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EF7573E
P 5050 5650
F 0 "#PWR09" H 5050 5400 50  0001 C CNN
F 1 "GND" H 5055 5477 50  0000 C CNN
F 2 "" H 5050 5650 50  0001 C CNN
F 3 "" H 5050 5650 50  0001 C CNN
	1    5050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5350 5050 5250
Wire Wire Line
	5050 4950 5050 4800
Text GLabel 4050 4600 0    50   Input ~ 0
VDD
Wire Wire Line
	4050 4600 4050 4800
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 5F05D260
P 5050 5500
F 0 "JP2" V 5004 5568 50  0000 L CNN
F 1 "VDDA_GND" V 5095 5568 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5050 5500 50  0001 C CNN
F 3 "~" H 5050 5500 50  0001 C CNN
	1    5050 5500
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5F05DB12
P 5800 4950
F 0 "JP1" H 5800 5155 50  0000 C CNN
F 1 "VDDA_VDD" H 5800 5064 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5800 4950 50  0001 C CNN
F 3 "~" H 5800 4950 50  0001 C CNN
	1    5800 4950
	1    0    0    -1  
$EndComp
Text GLabel 5950 4950 2    50   Input ~ 0
VDD
Text GLabel 5650 4950 0    50   Input ~ 0
VDDA
Text Notes 5250 5900 0    50   ~ 0
Voltage Selection\nVDDA -> GND for 2.5-2.9V, Pop C5\nVDDA -> VDD for 1.73-1.87V, DNP C5
Wire Notes Line
	4800 4550 6850 4550
Wire Notes Line
	6850 4550 6850 6050
Wire Notes Line
	6850 6050 4800 6050
Wire Notes Line
	4800 6050 4800 4550
Text GLabel 9000 1200 0    50   Input ~ 0
VDD
Text Notes 3800 2400 0    50   ~ 0
Board is NOT 3.3V tolerant.  \nRelies on external voltage supply and level shifting circuitry appropriate for selected operating voltage.  \nAs made, configured for 2.8V, see voltage selection for different options.
$EndSCHEMATC
