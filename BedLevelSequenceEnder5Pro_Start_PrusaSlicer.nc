; Custom Bed leveling sequence for Ender5 Pro using PrusaSlicer
; Uses .003" shim and .4mm nozzle, no zero-offset
; Check the bed level sequence
;**********************************************************
G90                             ; use absolute coordinates
M83                             ; extruder relative mode
M104 S140                       ; set extruder temp
M140 S50                        ; set bed level temp
M190 S50                        ; wait for bed temp
M109 S140                       ; wait for extruder temp
G28                             ; home all

;Begin probing routine
G1 Z2 F240
G1 X25 Y25 F3000
G1 Z0 F240
M0
G1 Z2 F240
G1 X195 Y25 F3000
G1 Z0 F240
M0
G1 Z2 F240
G1 X195 Y195 F3000
G1 Z0 F240
M0
G1 Z2 F240
G1 X25 Y195 F3000
G1 Z0 F240
M0
G1 Z2 F240
G1 X115 Y111.5 F3000
G1 Z0 F240
M0
G1 Z5 F240
G1 X1 Y1 F3000

;Begin Test 1st Layer
G28
G1 Z2 F240
G90                                 ; use absolute coordinates
M83                                 ; extruder relative mode
M104 S(first_layer_temperature-40)  ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature]     ; wait for extruder temp

G1 X2 Y10 F3000
G1 Z0.28 F240
G92 E0
G1 Y190 E15 F1500                   ; intro line
G1 X2.3 F5000
G92 E0
G1 Y10 E15 F1200                    ; intro line
G92 E0