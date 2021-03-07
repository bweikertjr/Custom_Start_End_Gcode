; Custom Bed leveling sequence for Ender5 Pro using PrusaSlicer
; Uses .003" shim and .4mm nozzle, no zero-offset
; Check the bed level sequence
; Bed dimesions X = 229, Y = 223
;**************************************************************
G90                             ; use absolute coordinates
M83                             ; extruder relative mode
M104 S140                       ; set extruder temp
M140 S50                        ; set bed level temp
M190 S50                        ; wait for bed temp
M109 S140                       ; wait for extruder temp
G28                             ; home all

;Begin leveling routine
;back right
G1 Z2 F240
G1 X199 Y198 F3000
G1 Z0 F240
M0

;back left
G1 Z2 F240
G1 X29 Y198 F3000
G1 Z0 F240
M0

;front left
G1 Z2 F240
G1 X29 Y28 F3000
G1 Z0 F240
M0

;front right
G1 Z2 F240
G1 X199 Y28 F3000
G1 Z0 F240
M0

G1 Z5 F240
G1 X228 Y222 F3000
M400