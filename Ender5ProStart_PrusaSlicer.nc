;Ender5Pro Start Sequnce for PrusaSlicer
;***************************************
G90                                     ; use absolute coordinates
M83                                     ; extruder relative mode
G28                                     ; home all
M420 S1                                 ; turn on mesh bed level
G1 Z25 F150                             ; backoff 25mm to enable nozzle cleaning
M104 S120                               ; set hot end temp to 120
M140 S[first_layer_bed_temperature]     ; set bed temp
M190 S[first_layer_bed_temperature]     ; wait for bed temp
M109 S{first_layer_temperature[0]-8}    ; wait for extruder temp
M104 S[first_layer_temperature]         ; set extruder temp
G1 Z2 F240                              ; move z close to bed
G1 X220 Y10 F3000                         ; move x y position for intro line print
G1 Z[first_layer_height] F240           ; move z to first layer height
G92 E0                                  ; set current position extruder 0
G1 Y190 E15 F1500                       ; intro line
G1 X220.3 F5000                         ; intro line
G92 E0                                  ; intro line
G1 Y10 E15 F1200                        ; intro line
G92 E0                                  ; set current position extruder 0