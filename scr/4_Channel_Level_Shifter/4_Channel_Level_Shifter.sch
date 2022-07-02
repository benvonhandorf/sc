EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "SC Voltage Supply & Level Shifter"
Date "2020-06-23"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5F0E1F04
P 1900 3000
F 0 "J1" H 2008 3381 50  0000 C CNN
F 1 "High Voltage" H 2008 3290 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical" H 1900 3000 50  0001 C CNN
F 3 "~" H 1900 3000 50  0001 C CNN
	1    1900 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 5F0E3CBC
P 10150 3250
F 0 "J2" H 10200 3700 50  0000 R CNN
F 1 "Target Voltage" H 10450 3600 50  0000 R CNN
F 2 "Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical" H 10150 3250 50  0001 C CNN
F 3 "~" H 10150 3250 50  0001 C CNN
	1    10150 3250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F0E5362
P 2600 2800
F 0 "#PWR06" H 2600 2550 50  0001 C CNN
F 1 "GND" H 2605 2627 50  0000 C CNN
F 2 "" H 2600 2800 50  0001 C CNN
F 3 "" H 2600 2800 50  0001 C CNN
	1    2600 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2800 2100 2800
$Comp
L power:VCC #PWR07
U 1 1 5F0E5BBB
P 2350 2950
F 0 "#PWR07" H 2350 2800 50  0001 C CNN
F 1 "VCC" H 2365 3123 50  0000 C CNN
F 2 "" H 2350 2950 50  0001 C CNN
F 3 "" H 2350 2950 50  0001 C CNN
	1    2350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2900 2200 2900
Wire Wire Line
	2200 2900 2200 2950
Wire Wire Line
	2200 2950 2350 2950
Text GLabel 2100 3000 2    50   Input ~ 0
1_H
Text GLabel 2100 3100 2    50   Input ~ 0
2_H
Text GLabel 2100 3200 2    50   Input ~ 0
3_H
Text GLabel 2100 3300 2    50   Input ~ 0
4_H
Text GLabel 9950 3250 0    50   Input ~ 0
1_L
Text GLabel 9950 3350 0    50   Input ~ 0
2_L
Text GLabel 9950 3450 0    50   Input ~ 0
3_L
Text GLabel 9950 3550 0    50   Input ~ 0
4_L
$Comp
L power:GND #PWR08
U 1 1 5F0E7508
P 9400 3050
F 0 "#PWR08" H 9400 2800 50  0001 C CNN
F 1 "GND" H 9405 2877 50  0000 C CNN
F 2 "" H 9400 3050 50  0001 C CNN
F 3 "" H 9400 3050 50  0001 C CNN
	1    9400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3050 9950 3050
$Comp
L power:VDD #PWR09
U 1 1 5F0E7A74
P 9550 3250
F 0 "#PWR09" H 9550 3100 50  0001 C CNN
F 1 "VDD" H 9565 3423 50  0000 C CNN
F 2 "" H 9550 3250 50  0001 C CNN
F 3 "" H 9550 3250 50  0001 C CNN
	1    9550 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3250 9700 3250
Wire Wire Line
	9700 3250 9700 3150
Wire Wire Line
	9700 3150 9950 3150
Text Notes 9650 6750 2    50   ~ 0
Voltage supply and level translation for an SC 6 pin peripheral
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F0EBC59
P 5300 2850
F 0 "Q1" V 5549 2850 50  0000 C CNN
F 1 "2N7002" V 5640 2850 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5500 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5300 2850 50  0001 L CNN
	1    5300 2850
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:TLV70018_SOT23-5 U1
U 1 1 5F0ECDD9
P 4000 1700
F 0 "U1" H 4000 2042 50  0000 C CNN
F 1 "TLV70018_SOT23-5" H 4000 1951 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4000 2025 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv700.pdf" H 4000 1750 50  0001 C CNN
	1    4000 1700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5F0EEB80
P 2750 1600
F 0 "#PWR01" H 2750 1450 50  0001 C CNN
F 1 "VCC" H 2765 1773 50  0000 C CNN
F 2 "" H 2750 1600 50  0001 C CNN
F 3 "" H 2750 1600 50  0001 C CNN
	1    2750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1600 3550 1700
Wire Wire Line
	3550 1700 3700 1700
Connection ~ 3550 1600
Wire Wire Line
	3550 1600 3700 1600
$Comp
L power:VDD #PWR02
U 1 1 5F0F155A
P 4750 1600
F 0 "#PWR02" H 4750 1450 50  0001 C CNN
F 1 "VDD" H 4765 1773 50  0000 C CNN
F 2 "" H 4750 1600 50  0001 C CNN
F 3 "" H 4750 1600 50  0001 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1600 4500 1600
$Comp
L BVH_Voltage_Regulators:C C3
U 1 1 5F0F3584
P 4500 1750
F 0 "C3" H 4615 1796 50  0000 L CNN
F 1 "1uF" H 4615 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4538 1600 50  0001 C CNN
F 3 "" H 4500 1750 50  0001 C CNN
	1    4500 1750
	1    0    0    -1  
$EndComp
Connection ~ 4500 1600
Wire Wire Line
	4500 1600 4300 1600
$Comp
L BVH_Voltage_Regulators:C C2
U 1 1 5F0F4A56
P 3350 1750
F 0 "C2" H 3465 1796 50  0000 L CNN
F 1 "1uF" H 3465 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3388 1600 50  0001 C CNN
F 3 "" H 3350 1750 50  0001 C CNN
	1    3350 1750
	1    0    0    -1  
$EndComp
Connection ~ 3350 1600
Wire Wire Line
	3350 1600 3550 1600
$Comp
L BVH_Voltage_Regulators:C C1
U 1 1 5F0F4DA4
P 2950 1750
F 0 "C1" H 3065 1796 50  0000 L CNN
F 1 "10uF" H 3065 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2988 1600 50  0001 C CNN
F 3 "" H 2950 1750 50  0001 C CNN
	1    2950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1600 2950 1600
Connection ~ 2950 1600
Wire Wire Line
	2950 1600 3350 1600
Wire Wire Line
	2950 1900 3150 1900
Wire Wire Line
	3150 1900 3150 2050
Wire Wire Line
	3150 2050 4000 2050
Wire Wire Line
	4000 2050 4000 2000
Connection ~ 3150 1900
Wire Wire Line
	3150 1900 3350 1900
Wire Wire Line
	4000 2050 4500 2050
Wire Wire Line
	4500 2050 4500 1900
Connection ~ 4000 2050
$Comp
L power:GND #PWR03
U 1 1 5F0F6D2B
P 4000 2200
F 0 "#PWR03" H 4000 1950 50  0001 C CNN
F 1 "GND" H 4005 2027 50  0000 C CNN
F 2 "" H 4000 2200 50  0001 C CNN
F 3 "" H 4000 2200 50  0001 C CNN
	1    4000 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2200 4000 2050
Text Notes 2900 1250 0    50   ~ 0
Select appropriate TLV700 or equivalent for application
Text GLabel 5600 2950 2    50   Input ~ 0
1_H
Text GLabel 4750 2950 0    50   Input ~ 0
1_L
Wire Wire Line
	4750 2950 4950 2950
Wire Wire Line
	5500 2950 5600 2950
$Comp
L Device:R R1
U 1 1 5F103F9A
P 4950 2800
F 0 "R1" H 5020 2846 50  0000 L CNN
F 1 "1k" H 5020 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4880 2800 50  0001 C CNN
F 3 "~" H 4950 2800 50  0001 C CNN
	1    4950 2800
	1    0    0    -1  
$EndComp
Connection ~ 4950 2950
Wire Wire Line
	4950 2950 5100 2950
$Comp
L power:VDD #PWR04
U 1 1 5F104BA0
P 5300 2400
F 0 "#PWR04" H 5300 2250 50  0001 C CNN
F 1 "VDD" H 5315 2573 50  0000 C CNN
F 2 "" H 5300 2400 50  0001 C CNN
F 3 "" H 5300 2400 50  0001 C CNN
	1    5300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2400 5300 2500
Wire Wire Line
	5300 2500 4950 2500
Wire Wire Line
	4950 2500 4950 2650
Connection ~ 5300 2500
Wire Wire Line
	5300 2500 5300 2650
Text Notes 6850 4750 2    50   ~ 0
Populate resitors for channels requiring pull-up
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5F108C4B
P 6850 2850
F 0 "Q2" V 7099 2850 50  0000 C CNN
F 1 "2N7002" V 7190 2850 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7050 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6850 2850 50  0001 L CNN
	1    6850 2850
	0    1    1    0   
$EndComp
Text GLabel 7150 2950 2    50   Input ~ 0
2_H
Text GLabel 6300 2950 0    50   Input ~ 0
2_L
Wire Wire Line
	6300 2950 6500 2950
Wire Wire Line
	7050 2950 7150 2950
$Comp
L Device:R R2
U 1 1 5F108C59
P 6500 2800
F 0 "R2" H 6570 2846 50  0000 L CNN
F 1 "1k" H 6570 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6430 2800 50  0001 C CNN
F 3 "~" H 6500 2800 50  0001 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
Connection ~ 6500 2950
Wire Wire Line
	6500 2950 6650 2950
$Comp
L power:VDD #PWR05
U 1 1 5F108C65
P 6850 2400
F 0 "#PWR05" H 6850 2250 50  0001 C CNN
F 1 "VDD" H 6865 2573 50  0000 C CNN
F 2 "" H 6850 2400 50  0001 C CNN
F 3 "" H 6850 2400 50  0001 C CNN
	1    6850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2400 6850 2500
Wire Wire Line
	6850 2500 6500 2500
Wire Wire Line
	6500 2500 6500 2650
Connection ~ 6850 2500
Wire Wire Line
	6850 2500 6850 2650
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 5F10DE62
P 5300 4050
F 0 "Q3" V 5549 4050 50  0000 C CNN
F 1 "2N7002" V 5640 4050 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5500 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5300 4050 50  0001 L CNN
	1    5300 4050
	0    1    1    0   
$EndComp
Text GLabel 5600 4150 2    50   Input ~ 0
3_H
Text GLabel 4750 4150 0    50   Input ~ 0
3_L
Wire Wire Line
	4750 4150 4950 4150
Wire Wire Line
	5500 4150 5600 4150
$Comp
L Device:R R3
U 1 1 5F10DE70
P 4950 4000
F 0 "R3" H 5020 4046 50  0000 L CNN
F 1 "1k" H 5020 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4880 4000 50  0001 C CNN
F 3 "~" H 4950 4000 50  0001 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
Connection ~ 4950 4150
Wire Wire Line
	4950 4150 5100 4150
$Comp
L power:VDD #PWR010
U 1 1 5F10DE7C
P 5300 3600
F 0 "#PWR010" H 5300 3450 50  0001 C CNN
F 1 "VDD" H 5315 3773 50  0000 C CNN
F 2 "" H 5300 3600 50  0001 C CNN
F 3 "" H 5300 3600 50  0001 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3600 5300 3700
Wire Wire Line
	5300 3700 4950 3700
Wire Wire Line
	4950 3700 4950 3850
Connection ~ 5300 3700
Wire Wire Line
	5300 3700 5300 3850
$Comp
L Transistor_FET:2N7002 Q4
U 1 1 5F10DE8B
P 6850 4050
F 0 "Q4" V 7099 4050 50  0000 C CNN
F 1 "2N7002" V 7190 4050 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7050 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6850 4050 50  0001 L CNN
	1    6850 4050
	0    1    1    0   
$EndComp
Text GLabel 7150 4150 2    50   Input ~ 0
4_H
Text GLabel 6300 4150 0    50   Input ~ 0
4_L
Wire Wire Line
	6300 4150 6500 4150
Wire Wire Line
	7050 4150 7150 4150
$Comp
L Device:R R4
U 1 1 5F10DE99
P 6500 4000
F 0 "R4" H 6570 4046 50  0000 L CNN
F 1 "1k" H 6570 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6430 4000 50  0001 C CNN
F 3 "~" H 6500 4000 50  0001 C CNN
	1    6500 4000
	1    0    0    -1  
$EndComp
Connection ~ 6500 4150
Wire Wire Line
	6500 4150 6650 4150
$Comp
L power:VDD #PWR011
U 1 1 5F10DEA5
P 6850 3600
F 0 "#PWR011" H 6850 3450 50  0001 C CNN
F 1 "VDD" H 6865 3773 50  0000 C CNN
F 2 "" H 6850 3600 50  0001 C CNN
F 3 "" H 6850 3600 50  0001 C CNN
	1    6850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3600 6850 3700
Wire Wire Line
	6850 3700 6500 3700
Wire Wire Line
	6500 3700 6500 3850
Connection ~ 6850 3700
Wire Wire Line
	6850 3700 6850 3850
Text Notes 6850 4600 2    50   ~ 0
Level shifting
Text Notes 4800 5050 0    50   ~ 0
This design implies pull-up resistors on the high side already, \neither internal to the MCU pins or elsewhere.
$EndSCHEMATC
