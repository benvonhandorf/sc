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
L BVH_Sensors:PMW3360_PWM3389 U2
U 1 1 5EC7DD15
P 5350 3050
F 0 "U2" H 5375 3565 50  0000 C CNN
F 1 "PMW3360" H 5375 3474 50  0000 C CNN
F 2 "BVH_Components_Misc:PMW3360" H 5350 3700 50  0001 C CNN
F 3 "" H 5350 2950 50  0001 C CNN
	1    5350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EC7E0E5
P 4200 3250
F 0 "#PWR0101" H 4200 3000 50  0001 C CNN
F 1 "GND" H 4205 3077 50  0000 C CNN
F 2 "" H 4200 3250 50  0001 C CNN
F 3 "" H 4200 3250 50  0001 C CNN
	1    4200 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5EC7E368
P 4050 3050
F 0 "#PWR0102" H 4050 2900 50  0001 C CNN
F 1 "+3V3" H 4065 3223 50  0000 C CNN
F 2 "" H 4050 3050 50  0001 C CNN
F 3 "" H 4050 3050 50  0001 C CNN
	1    4050 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0103
U 1 1 5EC47CAA
P 4400 2950
F 0 "#PWR0103" H 4400 2800 50  0001 C CNN
F 1 "+1V8" H 4415 3123 50  0000 C CNN
F 2 "" H 4400 2950 50  0001 C CNN
F 3 "" H 4400 2950 50  0001 C CNN
	1    4400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EC484E7
P 3650 2850
F 0 "#PWR0104" H 3650 2600 50  0001 C CNN
F 1 "GND" H 3655 2677 50  0000 C CNN
F 2 "" H 3650 2850 50  0001 C CNN
F 3 "" H 3650 2850 50  0001 C CNN
	1    3650 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5EC48B24
P 3650 2700
F 0 "C6" H 3742 2746 50  0000 L CNN
F 1 "100nF" H 3742 2655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3650 2700 50  0001 C CNN
F 3 "~" H 3650 2700 50  0001 C CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5EC48DDB
P 3200 2700
F 0 "C5" H 3292 2746 50  0000 L CNN
F 1 "4.7uF" H 3292 2655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3200 2700 50  0001 C CNN
F 3 "~" H 3200 2700 50  0001 C CNN
	1    3200 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2800 3650 2800
Wire Wire Line
	3650 2850 3650 2800
Connection ~ 3650 2800
Wire Wire Line
	3200 2600 3650 2600
Wire Wire Line
	3650 2600 4600 2600
Connection ~ 3650 2600
Wire Wire Line
	4400 2950 4700 2950
Wire Wire Line
	4050 3050 4700 3050
Wire Wire Line
	4200 3250 4700 3250
$Comp
L power:+1V8 #PWR0105
U 1 1 5EC4A0E3
P 6400 2850
F 0 "#PWR0105" H 6400 2700 50  0001 C CNN
F 1 "+1V8" H 6415 3023 50  0000 C CNN
F 2 "" H 6400 2850 50  0001 C CNN
F 3 "" H 6400 2850 50  0001 C CNN
	1    6400 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5EC4A686
P 6150 2850
F 0 "R1" V 5954 2850 50  0000 C CNN
F 1 "39R" V 6045 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6150 2850 50  0001 C CNN
F 3 "~" H 6150 2850 50  0001 C CNN
	1    6150 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 2850 6400 2850
Wire Wire Line
	6050 2850 5950 2850
Text GLabel 6100 3050 2    50   Input ~ 0
MISO
Text GLabel 6100 3150 2    50   Input ~ 0
MOSI
Text GLabel 6100 3250 2    50   Input ~ 0
SCLK
Text GLabel 6100 2950 2    50   Input ~ 0
~CS
Wire Wire Line
	6100 2950 5950 2950
Wire Wire Line
	5950 3050 6100 3050
Wire Wire Line
	5950 3150 6100 3150
Wire Wire Line
	5950 3250 6100 3250
Text GLabel 7900 3000 0    50   Input ~ 0
~CS
Text GLabel 7900 2900 0    50   Input ~ 0
MOSI
Text GLabel 8400 2900 2    50   Input ~ 0
MISO
Text GLabel 8400 2800 2    50   Input ~ 0
SCLK
$Comp
L power:+3V3 #PWR0106
U 1 1 5EC4D14F
P 7500 3100
F 0 "#PWR0106" H 7500 2950 50  0001 C CNN
F 1 "+3V3" H 7515 3273 50  0000 C CNN
F 2 "" H 7500 3100 50  0001 C CNN
F 3 "" H 7500 3100 50  0001 C CNN
	1    7500 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5EC4D4CB
P 8700 3100
F 0 "#PWR0107" H 8700 2850 50  0001 C CNN
F 1 "GND" H 8705 2927 50  0000 C CNN
F 2 "" H 8700 3100 50  0001 C CNN
F 3 "" H 8700 3100 50  0001 C CNN
	1    8700 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 5EC4E892
P 3700 1250
F 0 "#PWR0108" H 3700 1100 50  0001 C CNN
F 1 "+3V3" H 3715 1423 50  0000 C CNN
F 2 "" H 3700 1250 50  0001 C CNN
F 3 "" H 3700 1250 50  0001 C CNN
	1    3700 1250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:TLV70019_SOT23-5 U1
U 1 1 5EC4ED65
P 4300 1350
F 0 "U1" H 4300 1692 50  0000 C CNN
F 1 "TLV70019_SOT23-5" H 4300 1601 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 4300 1675 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv700.pdf" H 4300 1400 50  0001 C CNN
	1    4300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1250 4000 1250
Wire Wire Line
	4000 1350 3700 1350
Wire Wire Line
	3700 1350 3700 1250
Connection ~ 3700 1250
$Comp
L Device:C_Small C2
U 1 1 5EC50ED7
P 3700 1450
F 0 "C2" H 3792 1496 50  0000 L CNN
F 1 "100nF" H 3792 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3700 1450 50  0001 C CNN
F 3 "~" H 3700 1450 50  0001 C CNN
	1    3700 1450
	1    0    0    -1  
$EndComp
Connection ~ 3700 1350
$Comp
L power:GND #PWR0109
U 1 1 5EC51558
P 4300 1700
F 0 "#PWR0109" H 4300 1450 50  0001 C CNN
F 1 "GND" H 4305 1527 50  0000 C CNN
F 2 "" H 4300 1700 50  0001 C CNN
F 3 "" H 4300 1700 50  0001 C CNN
	1    4300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1700 4300 1650
Wire Wire Line
	4300 1650 3700 1650
Wire Wire Line
	3700 1650 3700 1550
Connection ~ 4300 1650
$Comp
L Device:C_Small C3
U 1 1 5EC52551
P 4750 1450
F 0 "C3" H 4842 1496 50  0000 L CNN
F 1 "100nF" H 4842 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4750 1450 50  0001 C CNN
F 3 "~" H 4750 1450 50  0001 C CNN
	1    4750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1550 4750 1650
Wire Wire Line
	4750 1650 4300 1650
Wire Wire Line
	4750 1350 4750 1250
Wire Wire Line
	4750 1250 4600 1250
$Comp
L power:+1V8 #PWR0110
U 1 1 5EC53694
P 4950 1250
F 0 "#PWR0110" H 4950 1100 50  0001 C CNN
F 1 "+1V8" H 4965 1423 50  0000 C CNN
F 2 "" H 4950 1250 50  0001 C CNN
F 3 "" H 4950 1250 50  0001 C CNN
	1    4950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1250 4950 1250
Connection ~ 4750 1250
$Comp
L Device:C_Small C1
U 1 1 5EC5AFFF
P 3450 1450
F 0 "C1" H 3542 1496 50  0000 L CNN
F 1 "10uF" H 3542 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3450 1450 50  0001 C CNN
F 3 "~" H 3450 1450 50  0001 C CNN
	1    3450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1350 3700 1350
Wire Wire Line
	3450 1550 3700 1550
Connection ~ 3700 1550
$Comp
L Device:C_Small C4
U 1 1 5EC5C546
P 5150 1450
F 0 "C4" H 5242 1496 50  0000 L CNN
F 1 "10uF" H 5242 1405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5150 1450 50  0001 C CNN
F 3 "~" H 5150 1450 50  0001 C CNN
	1    5150 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1250 5150 1250
Wire Wire Line
	5150 1250 5150 1350
Connection ~ 4950 1250
Wire Wire Line
	5150 1550 5150 1650
Wire Wire Line
	5150 1650 4750 1650
Connection ~ 4750 1650
Text GLabel 7900 2800 0    50   Input ~ 0
MOTION
Text GLabel 6100 3350 2    50   Input ~ 0
MOTION
Wire Wire Line
	6100 3350 5950 3350
Text GLabel 4600 3150 0    50   Input ~ 0
~RST
Text GLabel 8400 3000 2    50   Input ~ 0
~RST
Wire Wire Line
	4600 2600 4600 2850
Wire Wire Line
	4600 2850 4700 2850
Wire Wire Line
	4600 3150 4700 3150
NoConn ~ 4700 3350
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 5ED771E3
P 8200 2900
F 0 "J1" H 8250 2475 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 8250 2566 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 8200 2900 50  0001 C CNN
F 3 "~" H 8200 2900 50  0001 C CNN
	1    8200 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7500 3100 7900 3100
Wire Wire Line
	8400 3100 8700 3100
NoConn ~ 8400 2700
NoConn ~ 7900 2700
$EndSCHEMATC
