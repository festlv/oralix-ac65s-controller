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
L Connector_Generic:Conn_01x03 J1
U 1 1 5F0B5C78
P 900 2550
F 0 "J1" H 818 2867 50  0000 C CNN
F 1 "MC000027" H 818 2776 50  0000 C CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBA_2,5_3-G-5,08_1x03_P5.08mm_Horizontal" H 900 2550 50  0001 C CNN
F 3 "~" H 900 2550 50  0001 C CNN
	1    900  2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1100 2650 1150 2650
Wire Wire Line
	1150 2650 1150 2850
$Comp
L power:Earth_Protective #PWR01
U 1 1 5F0B6CDC
P 1150 2850
F 0 "#PWR01" H 1400 2600 50  0001 C CNN
F 1 "Earth_Protective" H 1600 2700 50  0001 C CNN
F 2 "" H 1150 2750 50  0001 C CNN
F 3 "~" H 1150 2750 50  0001 C CNN
	1    1150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2450 1550 2450
Wire Wire Line
	1100 2550 1650 2550
Wire Wire Line
	1850 3450 1650 3450
Wire Wire Line
	1650 3450 1650 2550
Wire Wire Line
	1550 2450 1550 3650
$Comp
L Device:R_Small R1
U 1 1 5F0BECB8
P 1950 3450
F 0 "R1" V 1754 3450 50  0000 C CNN
F 1 "47K 2W" V 1845 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" H 1950 3450 50  0001 C CNN
F 3 "~" H 1950 3450 50  0001 C CNN
	1    1950 3450
	0    1    1    0   
$EndComp
$Comp
L Isolator:4N35 U1
U 1 1 5F0C1247
P 3250 3550
F 0 "U1" H 3250 3875 50  0000 C CNN
F 1 "4N35" H 3250 3784 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 3050 3350 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 3250 3550 50  0001 L CNN
	1    3250 3550
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:MOC3051M U4
U 1 1 5F0C75E8
P 8700 3300
F 0 "U4" H 8700 3625 50  0000 C CNN
F 1 "MOC3051M" H 8700 3534 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 8500 3100 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3052M.pdf" H 8700 3300 50  0001 L CNN
	1    8700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3400 8200 3400
Wire Wire Line
	8200 3400 8200 3700
$Comp
L Device:R_Small R7
U 1 1 5F0CA056
P 8200 3800
F 0 "R7" H 8259 3846 50  0000 L CNN
F 1 "560R" H 8259 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8200 3800 50  0001 C CNN
F 3 "~" H 8200 3800 50  0001 C CNN
	1    8200 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F0CA4FF
P 8200 3900
F 0 "#PWR014" H 8200 3650 50  0001 C CNN
F 1 "GND" H 8205 3727 50  0000 C CNN
F 2 "" H 8200 3900 50  0001 C CNN
F 3 "" H 8200 3900 50  0001 C CNN
	1    8200 3900
	1    0    0    -1  
$EndComp
$Comp
L Triac_Thyristor:BT138-600 Q2
U 1 1 5F0CB26F
P 9850 3350
F 0 "Q2" H 9978 3396 50  0000 L CNN
F 1 "BT138-600" H 9978 3305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 10050 3275 50  0001 L CIN
F 3 "https://assets.nexperia.com/documents/data-sheet/BT138_SER_D_E.pdf" H 9850 3350 50  0001 L CNN
	1    9850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3400 9150 3400
$Comp
L Device:R_Small R8
U 1 1 5F0CEDEB
P 9250 3400
F 0 "R8" V 9300 3250 50  0000 C CNN
F 1 "330R 2W" V 9100 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" H 9250 3400 50  0001 C CNN
F 3 "~" H 9250 3400 50  0001 C CNN
	1    9250 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 3500 9850 3650
Wire Wire Line
	9850 3200 9850 3100
Connection ~ 9850 3200
Wire Wire Line
	9850 2800 9600 2800
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5F0D3BF8
P 10550 3900
F 0 "J3" H 10630 3942 50  0000 L CNN
F 1 "MC000027" H 10630 3851 50  0000 L CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBA_2,5_3-G-5,08_1x03_P5.08mm_Horizontal" H 10550 3900 50  0001 C CNN
F 3 "~" H 10550 3900 50  0001 C CNN
	1    10550 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	10350 3900 10300 3900
Wire Wire Line
	9850 3800 10350 3800
Wire Wire Line
	10350 4000 10350 4200
$Comp
L power:Earth_Protective #PWR016
U 1 1 5F0D775A
P 10350 4200
F 0 "#PWR016" H 10600 3950 50  0001 C CNN
F 1 "Earth_Protective" H 10800 4050 50  0001 C CNN
F 2 "" H 10350 4100 50  0001 C CNN
F 3 "~" H 10350 4100 50  0001 C CNN
	1    10350 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5F0D7FEE
P 10550 3200
F 0 "C4" H 10642 3246 50  0000 L CNN
F 1 "10nF" H 10642 3155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L16.5mm_W4.7mm_P15.00mm_MKT" H 10550 3200 50  0001 C CNN
F 3 "~" H 10550 3200 50  0001 C CNN
	1    10550 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5F0D8613
P 10550 3400
F 0 "R9" H 10609 3446 50  0000 L CNN
F 1 "39R" H 10609 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 10550 3400 50  0001 C CNN
F 3 "~" H 10550 3400 50  0001 C CNN
	1    10550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 3500 10550 3650
Wire Wire Line
	10550 3650 9850 3650
Connection ~ 9850 3650
Wire Wire Line
	9850 3650 9850 3800
Wire Wire Line
	10550 3100 9850 3100
Connection ~ 9850 3100
Wire Wire Line
	7850 3200 8400 3200
Text Label 7850 3200 0    50   ~ 0
MAINS_OUT
Text GLabel 9600 2800 0    50   Input ~ 0
MAINS_L
Text GLabel 10300 3900 0    50   Input ~ 0
MAINS_N
$Comp
L power:+5V #PWR07
U 1 1 5F0E0E9E
P 3900 3200
F 0 "#PWR07" H 3900 3050 50  0001 C CNN
F 1 "+5V" H 3915 3373 50  0000 C CNN
F 2 "" H 3900 3200 50  0001 C CNN
F 3 "" H 3900 3200 50  0001 C CNN
	1    3900 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F0E14D2
P 3900 3300
F 0 "R3" H 3959 3346 50  0000 L CNN
F 1 "10K" H 3959 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3900 3300 50  0001 C CNN
F 3 "~" H 3900 3300 50  0001 C CNN
	1    3900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3550 3900 3550
Wire Wire Line
	3900 3550 3900 3400
Wire Wire Line
	3550 3650 3650 3650
Wire Wire Line
	3650 3650 3650 3750
$Comp
L power:GND #PWR05
U 1 1 5F0E5562
P 3650 3750
F 0 "#PWR05" H 3650 3500 50  0001 C CNN
F 1 "GND" H 3655 3577 50  0000 C CNN
F 2 "" H 3650 3750 50  0001 C CNN
F 3 "" H 3650 3750 50  0001 C CNN
	1    3650 3750
	1    0    0    -1  
$EndComp
Connection ~ 3900 3550
Text Label 1850 5950 0    50   ~ 0
ZERO_CROSSING_POS
Wire Wire Line
	3900 3550 5050 3550
Wire Wire Line
	9000 3200 9850 3200
Wire Wire Line
	9350 3400 9350 3450
Wire Wire Line
	9350 3450 9700 3450
Wire Wire Line
	9850 2800 9850 3100
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
U 1 1 5F120B0C
P 3250 6250
F 0 "A1" H 3700 7250 50  0000 C CNN
F 1 "Arduino_Nano_v2.x" H 2600 5200 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3250 6250 50  0001 C CIN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 3250 6250 50  0001 C CNN
	1    3250 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F122687
P 3250 7400
F 0 "#PWR03" H 3250 7150 50  0001 C CNN
F 1 "GND" H 3255 7227 50  0000 C CNN
F 2 "" H 3250 7400 50  0001 C CNN
F 3 "" H 3250 7400 50  0001 C CNN
	1    3250 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7400 3250 7250
Wire Wire Line
	3250 7250 3350 7250
Connection ~ 3250 7250
Wire Wire Line
	1850 5850 2750 5850
Wire Wire Line
	2750 6150 1850 6150
Wire Wire Line
	2750 6250 1850 6250
Text Label 1850 5850 0    50   ~ 0
ENABLE_IN
Text Label 1850 6150 0    50   ~ 0
MAINS_OUT
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5F135BEE
P 5250 6300
F 0 "J2" H 5330 6342 50  0000 L CNN
F 1 "MC000027" H 5330 6251 50  0000 L CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBA_2,5_3-G-5,08_1x03_P5.08mm_Horizontal" H 5250 6300 50  0001 C CNN
F 3 "~" H 5250 6300 50  0001 C CNN
	1    5250 6300
	1    0    0    1   
$EndComp
Wire Wire Line
	5050 6200 4700 6200
Wire Wire Line
	4700 6200 4700 6000
$Comp
L power:+12V #PWR08
U 1 1 5F138798
P 4700 6000
F 0 "#PWR08" H 4700 5850 50  0001 C CNN
F 1 "+12V" H 4715 6173 50  0000 C CNN
F 2 "" H 4700 6000 50  0001 C CNN
F 3 "" H 4700 6000 50  0001 C CNN
	1    4700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6400 4700 6400
Wire Wire Line
	4700 6400 4700 6550
$Comp
L power:GND #PWR09
U 1 1 5F13B250
P 4700 6550
F 0 "#PWR09" H 4700 6300 50  0001 C CNN
F 1 "GND" H 4705 6377 50  0000 C CNN
F 2 "" H 4700 6550 50  0001 C CNN
F 3 "" H 4700 6550 50  0001 C CNN
	1    4700 6550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U3
U 1 1 5F13EB46
P 6250 5200
F 0 "U3" H 6250 5442 50  0000 C CNN
F 1 "LM7805_TO220" H 6250 5351 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6250 5425 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 6250 5150 50  0001 C CNN
	1    6250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5200 5550 5200
Wire Wire Line
	5550 5200 5550 4900
$Comp
L power:+12V #PWR012
U 1 1 5F14188C
P 5550 4900
F 0 "#PWR012" H 5550 4750 50  0001 C CNN
F 1 "+12V" H 5565 5073 50  0000 C CNN
F 2 "" H 5550 4900 50  0001 C CNN
F 3 "" H 5550 4900 50  0001 C CNN
	1    5550 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F141C1D
P 6250 5500
F 0 "#PWR013" H 6250 5250 50  0001 C CNN
F 1 "GND" H 6255 5327 50  0000 C CNN
F 2 "" H 6250 5500 50  0001 C CNN
F 3 "" H 6250 5500 50  0001 C CNN
	1    6250 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5F142614
P 5550 5400
F 0 "C1" H 5642 5446 50  0000 L CNN
F 1 "10uF" H 5642 5355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D8.0mm_W2.5mm_P5.00mm" H 5550 5400 50  0001 C CNN
F 3 "~" H 5550 5400 50  0001 C CNN
	1    5550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5300 5550 5200
Connection ~ 5550 5200
Wire Wire Line
	5550 5500 6250 5500
Connection ~ 6250 5500
$Comp
L Device:C_Small C2
U 1 1 5F1472EE
P 6800 5400
F 0 "C2" H 6892 5446 50  0000 L CNN
F 1 "10uF" H 6892 5355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D8.0mm_W2.5mm_P5.00mm" H 6800 5400 50  0001 C CNN
F 3 "~" H 6800 5400 50  0001 C CNN
	1    6800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5200 6800 5200
Wire Wire Line
	6800 5300 6800 5200
Connection ~ 6800 5200
Wire Wire Line
	6800 5200 7200 5200
Wire Wire Line
	6800 5500 6250 5500
$Comp
L Device:C_Small C3
U 1 1 5F14EAC5
P 7200 5400
F 0 "C3" H 7292 5446 50  0000 L CNN
F 1 "0.1uF" H 7292 5355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D8.0mm_W2.5mm_P5.00mm" H 7200 5400 50  0001 C CNN
F 3 "~" H 7200 5400 50  0001 C CNN
	1    7200 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5200 7200 5300
Wire Wire Line
	7200 5500 6800 5500
Connection ~ 6800 5500
Wire Wire Line
	7200 5200 7200 4950
Connection ~ 7200 5200
$Comp
L power:+5V #PWR015
U 1 1 5F156F96
P 7200 4950
F 0 "#PWR015" H 7200 4800 50  0001 C CNN
F 1 "+5V" H 7215 5123 50  0000 C CNN
F 2 "" H 7200 4950 50  0001 C CNN
F 3 "" H 7200 4950 50  0001 C CNN
	1    7200 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5F1574D5
P 3150 5050
F 0 "#PWR02" H 3150 4900 50  0001 C CNN
F 1 "+5V" H 3165 5223 50  0000 C CNN
F 2 "" H 3150 5050 50  0001 C CNN
F 3 "" H 3150 5050 50  0001 C CNN
	1    3150 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5050 3150 5250
$Comp
L Relay:RT42xxxx K2
U 1 1 5F1437B4
P 2550 2350
F 0 "K2" V 1783 2350 50  0000 C CNN
F 1 "RT424012" V 1874 2350 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Schrack-RT2-FormC_RM5mm" H 2550 2350 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FRT2%7F1014%7Fpdf%7FEnglish%7FENG_DS_RT2_1014.pdf%7F6-1393243-3" H 2550 2350 50  0001 C CNN
	1    2550 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2450 2050 2450
Wire Wire Line
	2050 2450 2050 2350
Wire Wire Line
	2050 2350 2250 2350
Connection ~ 1550 2450
Wire Wire Line
	1650 2550 2050 2550
Wire Wire Line
	2050 2550 2050 2750
Wire Wire Line
	2050 2750 2250 2750
Connection ~ 1650 2550
Wire Wire Line
	2850 2450 3000 2450
Wire Wire Line
	2850 2850 3000 2850
$Comp
L power:+12V #PWR017
U 1 1 5F151EBE
P 2000 1250
F 0 "#PWR017" H 2000 1100 50  0001 C CNN
F 1 "+12V" H 2015 1423 50  0000 C CNN
F 2 "" H 2000 1250 50  0001 C CNN
F 3 "" H 2000 1250 50  0001 C CNN
	1    2000 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1250 2000 1950
Wire Wire Line
	2000 1950 2250 1950
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5F15631A
P 3100 1400
F 0 "J4" V 3100 1650 50  0000 C CNN
F 1 "MC000027" V 3250 1350 50  0000 C CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBA_2,5_3-G-5,08_1x03_P5.08mm_Horizontal" H 3100 1400 50  0001 C CNN
F 3 "~" H 3100 1400 50  0001 C CNN
	1    3100 1400
	0    1    -1   0   
$EndComp
Wire Wire Line
	2850 1950 3000 1950
Wire Wire Line
	3000 1950 3000 1600
Wire Wire Line
	3100 1600 3100 1950
$Comp
L Device:D_Small D6
U 1 1 5F17A398
P 3300 2100
F 0 "D6" V 3254 2170 50  0000 L CNN
F 1 "1N4005" V 3250 1700 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" V 3300 2100 50  0001 C CNN
F 3 "~" V 3300 2100 50  0001 C CNN
	1    3300 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1950 3300 2000
Wire Wire Line
	3100 1950 3300 1950
$Comp
L Device:R_Small R11
U 1 1 5F1817C6
P 4350 1750
F 0 "R11" V 4154 1750 50  0000 C CNN
F 1 "1K" V 4245 1750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4350 1750 50  0001 C CNN
F 3 "~" H 4350 1750 50  0001 C CNN
	1    4350 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5F181D47
P 4150 1900
F 0 "R10" H 4209 1946 50  0000 L CNN
F 1 "10K" H 4209 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4150 1900 50  0001 C CNN
F 3 "~" H 4150 1900 50  0001 C CNN
	1    4150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1750 4150 1750
Wire Wire Line
	4150 1800 4150 1750
Connection ~ 4150 1750
Wire Wire Line
	4150 1750 4250 1750
Wire Wire Line
	4150 2000 3800 2000
Wire Wire Line
	3800 2000 3800 1950
Wire Wire Line
	3300 2200 3800 2200
Wire Wire Line
	3800 2200 3800 2000
Connection ~ 3800 2000
Wire Wire Line
	3300 1950 3300 1550
Wire Wire Line
	3300 1550 3800 1550
Connection ~ 3300 1950
Wire Wire Line
	4450 1750 4800 1750
Text Label 4500 1750 0    50   ~ 0
ENABLE_IN
$Comp
L Transistor_BJT:BC548 Q1
U 1 1 5F1C172C
P 3900 1750
F 0 "Q1" H 4091 1796 50  0000 L CNN
F 1 "BC548" H 4091 1705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4100 1675 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 3900 1750 50  0001 L CNN
	1    3900 1750
	-1   0    0    -1  
$EndComp
Text GLabel 3000 2450 2    50   Input ~ 0
MAINS_L
Text GLabel 3000 2850 2    50   Input ~ 0
MAINS_N
Wire Wire Line
	1550 3650 2750 3650
$Comp
L Isolator:4N35 U2
U 1 1 5F1EA722
P 3250 4250
F 0 "U2" H 3250 4575 50  0000 C CNN
F 1 "4N35" H 3250 4484 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 3050 4050 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 3250 4250 50  0001 L CNN
	1    3250 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5F1EB38D
P 3900 3900
F 0 "#PWR0101" H 3900 3750 50  0001 C CNN
F 1 "+5V" H 3915 4073 50  0000 C CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5F1EB397
P 3900 4000
F 0 "R4" H 3959 4046 50  0000 L CNN
F 1 "10K" H 3959 3955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3900 4000 50  0001 C CNN
F 3 "~" H 3900 4000 50  0001 C CNN
	1    3900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4250 3900 4250
Wire Wire Line
	3900 4250 3900 4100
Wire Wire Line
	3550 4350 3650 4350
Wire Wire Line
	3650 4350 3650 4450
$Comp
L power:GND #PWR0102
U 1 1 5F1EB3A5
P 3650 4450
F 0 "#PWR0102" H 3650 4200 50  0001 C CNN
F 1 "GND" H 3655 4277 50  0000 C CNN
F 2 "" H 3650 4450 50  0001 C CNN
F 3 "" H 3650 4450 50  0001 C CNN
	1    3650 4450
	1    0    0    -1  
$EndComp
Connection ~ 3900 4250
Text Label 1850 6050 0    50   ~ 0
ZERO_CROSSING_NEG
Wire Wire Line
	3900 4250 5050 4250
Wire Wire Line
	2050 3450 2750 3450
$Comp
L Device:D_Small D2
U 1 1 5F1F158A
P 2750 3550
F 0 "D2" V 2704 3620 50  0000 L CNN
F 1 "1N4005" V 2700 3150 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" V 2750 3550 50  0001 C CNN
F 3 "~" V 2750 3550 50  0001 C CNN
	1    2750 3550
	0    1    1    0   
$EndComp
Connection ~ 2750 3450
Wire Wire Line
	2750 3450 2950 3450
Connection ~ 2750 3650
Wire Wire Line
	2750 3650 2950 3650
$Comp
L Device:D_Small D1
U 1 1 5F1F1AA3
P 2700 4250
F 0 "D1" V 2654 4320 50  0000 L CNN
F 1 "1N4005" V 2650 3850 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" V 2700 4250 50  0001 C CNN
F 3 "~" V 2700 4250 50  0001 C CNN
	1    2700 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 4150 1850 4150
Wire Wire Line
	1550 3650 1550 4150
Connection ~ 1550 3650
Connection ~ 2700 4150
Wire Wire Line
	2700 4150 2950 4150
Wire Wire Line
	1650 4350 1650 3450
Wire Wire Line
	1650 4350 2700 4350
Connection ~ 2700 4350
Wire Wire Line
	2700 4350 2950 4350
Connection ~ 1650 3450
$Comp
L Device:R_Small R2
U 1 1 5F1F7A23
P 1950 4150
F 0 "R2" V 1754 4150 50  0000 C CNN
F 1 "47K 2W" V 1845 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" H 1950 4150 50  0001 C CNN
F 3 "~" H 1950 4150 50  0001 C CNN
	1    1950 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 4150 2700 4150
Wire Wire Line
	1850 5950 2750 5950
Wire Wire Line
	1850 6050 2750 6050
Text Label 4250 3550 0    50   ~ 0
ZERO_CROSSING_POS
Text Label 4250 4250 0    50   ~ 0
ZERO_CROSSING_NEG
$Comp
L power:GND #PWR0103
U 1 1 5F229725
P 3800 2200
F 0 "#PWR0103" H 3800 1950 50  0001 C CNN
F 1 "GND" H 3805 2027 50  0000 C CNN
F 2 "" H 3800 2200 50  0001 C CNN
F 3 "" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
Connection ~ 3800 2200
Text Label 1400 2450 0    50   ~ 0
L
Text Label 1400 2550 0    50   ~ 0
N
Text Label 1100 2650 0    50   ~ 0
PE
$EndSCHEMATC
