EESchema Schematic File Version 4
LIBS:E73 SCR-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Regulator_Linear:AP2112K-3.3 U1
U 1 1 5CC5D45C
P 4350 3100
F 0 "U1" H 4350 3442 50  0000 C CNN
F 1 "AP2112K-3.3" H 4350 3351 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 4350 3425 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 4350 3200 50  0001 C CNN
	1    4350 3100
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0101
U 1 1 5CC5D463
P 1950 2600
F 0 "#PWR0101" H 1950 2450 50  0001 C CNN
F 1 "VBUS" H 1965 2773 50  0000 C CNN
F 2 "" H 1950 2600 50  0001 C CNN
F 3 "" H 1950 2600 50  0001 C CNN
	1    1950 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0102
U 1 1 5CC5D469
P 3150 2600
F 0 "#PWR0102" H 3150 2450 50  0001 C CNN
F 1 "+BATT" H 3165 2773 50  0000 C CNN
F 2 "" H 3150 2600 50  0001 C CNN
F 3 "" H 3150 2600 50  0001 C CNN
	1    3150 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CC5D46F
P 3150 3150
F 0 "C3" H 2950 3200 50  0000 L CNN
F 1 "10uF" V 3300 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3188 3000 50  0001 C CNN
F 3 "~" H 3150 3150 50  0001 C CNN
	1    3150 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CC5D476
P 3450 3150
F 0 "R2" H 3520 3196 50  0000 L CNN
F 1 "100K" V 3450 3050 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3380 3150 50  0001 C CNN
F 3 "~" H 3450 3150 50  0001 C CNN
	1    3450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3000 3150 3000
Connection ~ 3450 3000
Wire Wire Line
	3150 3000 3050 3000
Connection ~ 3150 3000
$Comp
L power:GND #PWR0103
U 1 1 5CC5D484
P 3150 3450
F 0 "#PWR0103" H 3150 3200 50  0001 C CNN
F 1 "GND" H 3155 3277 50  0000 C CNN
F 2 "" H 3150 3450 50  0001 C CNN
F 3 "" H 3150 3450 50  0001 C CNN
	1    3150 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5CC5D48A
P 4350 3450
F 0 "#PWR0104" H 4350 3200 50  0001 C CNN
F 1 "GND" H 4355 3277 50  0000 C CNN
F 2 "" H 4350 3450 50  0001 C CNN
F 3 "" H 4350 3450 50  0001 C CNN
	1    4350 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5CC5D490
P 1950 3150
F 0 "R1" H 2020 3196 50  0000 L CNN
F 1 "100K" V 1950 3050 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1880 3150 50  0001 C CNN
F 3 "~" H 1950 3150 50  0001 C CNN
	1    1950 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5CC5D497
P 1950 3450
F 0 "#PWR0105" H 1950 3200 50  0001 C CNN
F 1 "GND" H 1955 3277 50  0000 C CNN
F 2 "" H 1950 3450 50  0001 C CNN
F 3 "" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3300 1950 3450
Wire Wire Line
	3150 3450 3150 3300
Wire Wire Line
	4350 3400 4350 3450
Wire Wire Line
	1950 3000 1950 2800
$Comp
L power:+3.3V #PWR0106
U 1 1 5CC5D4A1
P 4900 3000
F 0 "#PWR0106" H 4900 2850 50  0001 C CNN
F 1 "+3.3V" H 4915 3173 50  0000 C CNN
F 2 "" H 4900 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5CC5D4A7
P 4900 3150
F 0 "C6" H 4700 3200 50  0000 L CNN
F 1 "10uF" V 5050 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 4938 3000 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5CC5D4AE
P 4900 3450
F 0 "#PWR0107" H 4900 3200 50  0001 C CNN
F 1 "GND" H 4905 3277 50  0000 C CNN
F 2 "" H 4900 3450 50  0001 C CNN
F 3 "" H 4900 3450 50  0001 C CNN
	1    4900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3450 4900 3300
Wire Wire Line
	4650 3000 4900 3000
Connection ~ 4900 3000
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 5CC5D4B7
P 3050 2800
F 0 "Q1" H 3256 2846 50  0000 L CNN
F 1 "AO3401" H 2800 2950 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3250 2900 50  0001 C CNN
F 3 "~" H 3050 2800 50  0001 C CNN
	1    3050 2800
	1    0    0    -1  
$EndComp
Connection ~ 1950 2800
Wire Wire Line
	1950 2800 1950 2600
$Comp
L Diode:BAT54S D1
U 1 1 5CC5D4C0
P 2750 3000
F 0 "D1" H 2750 3050 50  0000 C CNN
F 1 "BAT54S" H 2550 2900 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 2825 3125 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 2630 3000 50  0001 C CNN
	1    2750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3000 2300 3000
Wire Wire Line
	2300 3000 2300 3300
Wire Wire Line
	2300 3300 2750 3300
Wire Wire Line
	2750 3300 2750 3200
Connection ~ 1950 3000
NoConn ~ 2450 3000
Wire Wire Line
	1950 2800 2850 2800
Wire Notes Line
	5250 3850 2100 3850
Wire Notes Line
	1750 3850 1750 2250
Text Notes 4000 2550 0    50   ~ 0
Voltage Regulation\n
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5CC5E47E
P 8600 3650
AR Path="/5CC5E47E" Ref="J?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E47E" Ref="J2"  Part="1" 
F 0 "J2" H 8572 3530 50  0000 R CNN
F 1 "BAT" H 8572 3621 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_B2B-PH-K_02x2.00mm_Straight" H 8600 3650 50  0001 C CNN
F 3 "~" H 8600 3650 50  0001 C CNN
	1    8600 3650
	-1   0    0    1   
$EndComp
$Comp
L Battery_Management:MCP73831-2-OT U?
U 1 1 5CC5E485
P 6950 3000
AR Path="/5CC5E485" Ref="U?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E485" Ref="U2"  Part="1" 
F 0 "U2" H 7050 2700 50  0000 C CNN
F 1 "MCP73831-2-OT" H 7300 2600 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 7000 2750 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 6800 2950 50  0001 C CNN
	1    6950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC5E48C
P 6950 3500
AR Path="/5CC5E48C" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E48C" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 6950 3250 50  0001 C CNN
F 1 "GND" H 6955 3327 50  0000 C CNN
F 2 "" H 6950 3500 50  0001 C CNN
F 3 "" H 6950 3500 50  0001 C CNN
	1    6950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R RPROG?
U 1 1 5CC5E492
P 6450 3350
AR Path="/5CC5E492" Ref="RPROG?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E492" Ref="RPROG1"  Part="1" 
F 0 "RPROG1" H 6520 3396 50  0000 L CNN
F 1 "4.7K" V 6450 3250 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6380 3350 50  0001 C CNN
F 3 "~" H 6450 3350 50  0001 C CNN
	1    6450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3500 6950 3500
Wire Wire Line
	6950 3500 6950 3300
Connection ~ 6950 3500
Wire Wire Line
	6450 3200 6450 3100
Wire Wire Line
	6450 3100 6550 3100
$Comp
L power:+BATT #PWR?
U 1 1 5CC5E49E
P 7450 2800
AR Path="/5CC5E49E" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E49E" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 7450 2650 50  0001 C CNN
F 1 "+BATT" H 7465 2973 50  0000 C CNN
F 2 "" H 7450 2800 50  0001 C CNN
F 3 "" H 7450 2800 50  0001 C CNN
	1    7450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2900 7450 2900
Wire Wire Line
	7450 2900 7450 2800
$Comp
L power:+BATT #PWR?
U 1 1 5CC5E4A6
P 8150 3550
AR Path="/5CC5E4A6" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4A6" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 8150 3400 50  0001 C CNN
F 1 "+BATT" H 8165 3723 50  0000 C CNN
F 2 "" H 8150 3550 50  0001 C CNN
F 3 "" H 8150 3550 50  0001 C CNN
	1    8150 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC5E4AC
P 8250 3650
AR Path="/5CC5E4AC" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4AC" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 8250 3400 50  0001 C CNN
F 1 "GND" H 8255 3477 50  0000 C CNN
F 2 "" H 8250 3650 50  0001 C CNN
F 3 "" H 8250 3650 50  0001 C CNN
	1    8250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3650 8400 3650
$Comp
L power:VBUS #PWR?
U 1 1 5CC5E4B3
P 6950 2550
AR Path="/5CC5E4B3" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4B3" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 6950 2400 50  0001 C CNN
F 1 "VBUS" H 6965 2723 50  0000 C CNN
F 2 "" H 6950 2550 50  0001 C CNN
F 3 "" H 6950 2550 50  0001 C CNN
	1    6950 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2550 6950 2700
$Comp
L power:VBUS #PWR?
U 1 1 5CC5E4BA
P 8000 3100
AR Path="/5CC5E4BA" Ref="#PWR?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4BA" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 8000 2950 50  0001 C CNN
F 1 "VBUS" H 8015 3273 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5CC5E4C0
P 7500 3100
AR Path="/5CC5E4C0" Ref="R?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4C0" Ref="R4"  Part="1" 
F 0 "R4" V 7600 3050 50  0000 L CNN
F 1 "1K" V 7500 3050 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7430 3100 50  0001 C CNN
F 3 "~" H 7500 3100 50  0001 C CNN
	1    7500 3100
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5CC5E4C7
P 7800 3100
AR Path="/5CC5E4C7" Ref="D?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4C7" Ref="D3"  Part="1" 
F 0 "D3" H 7800 3000 50  0000 C CNN
F 1 "CHG" H 7791 3225 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7800 3100 50  0001 C CNN
F 3 "~" H 7800 3100 50  0001 C CNN
	1    7800 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3100 8000 3100
Text Notes 6150 3700 0    50   ~ 0
RPROG\n10K = 100mA\n5.0K = 200mA
Wire Notes Line
	8850 2150 8850 3900
Wire Notes Line
	8850 3900 6050 3900
Wire Notes Line
	6050 3900 6050 2150
Wire Notes Line
	6050 2150 8850 2150
Text Notes 7350 2400 0    50   ~ 0
Charge Management & Battery
$Comp
L Switch:SW_SPDT SW?
U 1 1 5CC5E4D5
P 3700 3500
AR Path="/5CC5E4D5" Ref="SW?"  Part="1" 
AR Path="/5CC5C4D3/5CC5E4D5" Ref="SW1"  Part="1" 
F 0 "SW1" H 3650 3600 50  0000 C CNN
F 1 "SW_BAT" H 3600 3350 50  0000 C CNN
F 2 "Switches:OS102011MA1QN1" H 3700 3500 50  0001 C CNN
F 3 "" H 3700 3500 50  0001 C CNN
	1    3700 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 3550 8150 3550
Wire Wire Line
	3900 3500 3900 3100
Wire Wire Line
	3900 3100 4050 3100
Wire Wire Line
	3450 3300 3450 3400
Wire Wire Line
	3450 3400 3500 3400
Wire Wire Line
	3500 3600 3300 3600
Wire Wire Line
	3300 3600 3300 3450
Wire Wire Line
	3300 3450 3150 3450
Connection ~ 3150 3450
Wire Wire Line
	3450 3000 4050 3000
$EndSCHEMATC
