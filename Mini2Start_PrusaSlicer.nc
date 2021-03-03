;Mini2 Start for Prusa Slicer (MODIFIED WIPING Y POSITION ONLY). 3-2-21 BW.
;This G-Code has been generated specifically for the LulzBot Mini 2, includes leveling sequence
;**********************************************************************************************
M73 P0                                                  ; clear GLCD progress bar                 
M75                                                     ; start GLCD Print Timer
G26                                                     ; clear potential 'probe fail' condition
G21                                                     ; set units to millimetres
M107                                                    ; disable fans
M420 S0                                                 ; disable leveling matrix
G90                                                     ; absolute positioning
M82                                                     ; set extruder to absolute mode
G92 E0                                                  ; set extruder position to 0
M140 S{first_layer_bed_temperature[0]}                  ; start bed heating up, 3-15-2020 BW

;beginning of level x-axis
;**********************************************************************************************
M203 Z500                                               ; speed Z axis, 2-09-2020 BW
G28                                                     ; home all axis
G0 X160 F9999                                           ; move toolhead to right
G0 Z5 F4000                                             ; move to bottom of printer
G91                                                     ; set relative motion mode
M211 S0                                                 ; turn off software endstops
M400                                                    ; finish moves
M906 Z375                                               ; lower current to 375mA
G0 Z-12 F400                                            ; skip steppers against lower Z mounts
G90                                                     ; return to absolute mode
M400                                                    ; finish moves
M906 Z960                                               ; restore default current 960mA
M211 S1                                                 ; turn software endstops back on
M400                                                    ; finish moves
M203 X100 Y100 Z100                                     ; slow it down			
G28                                                     ; re-home
M203 X300 Y300 Z300                                     ; speed it up						
M117 X-Axis Leveled                                     ; X-Axis leveled and machine homed
G0 X0 Y187 Z156 F200                                    ; move away from endstops

;Wiping
;**********************************************************************************************
M117 Mini 2 Wiping...                                   ; progress indicator message on LCD
M109 R{first_layer_temperature[0] - 60}                 ; soften filament before retraction, replaced with equation, 3-15-2020 BW
G1 E-15 F75                                             ; retract filament
M109 R{first_layer_temperature[0] - 60}                 ; *wait for extruder to reach wiping temp, replaced with equation 3-15-2020 BW
G1 X45 Y174 F11520                                      ; move above wiper pad
G1 Z0 F1200                                             ; push nozzle into wiper
G1 X45 Y176 Z-.5 F4000          ; wiping
G1 X55 Y174 Z-.5 F4000          ; wiping
G1 X45 Y175 Z0 F4000            ; wiping
G1 X55 Y174 F4000               ; wiping
G1 X45 Y176 F4000               ; wiping
G1 X55 Y174 F4000               ; wiping
G1 X45 Y176 F4000               ; wiping
G1 X55 Y174 F4000               ; wiping
G1 X60 Y176 F4000               ; wiping
G1 X80 Y174 F4000               ; wiping
G1 X60 Y176 F4000               ; wiping
G1 X80 Y174 F4000               ; wiping
G1 X60 Y176 F4000               ; wiping
G1 X90 Y174 F4000               ; wiping
G1 X80 Y176 F4000               ; wiping
G1 X100 Y174 F4000              ; wiping
G1 X80 Y176 F4000               ; wiping
G1 X100 Y174 F4000              ; wiping
G1 X80 Y176 F4000               ; wiping
G1 X100 Y174 F4000              ; wiping
G1 X110 Y176 F4000              ; wiping
G1 X100 Y174 F4000              ; wiping
G1 X110 Y176 F4000              ; wiping
G1 X100 Y174 F4000              ; wiping
G1 X110 Y176 F4000              ; wiping
G1 X115 Y174 Z-0.5 F1000        ; wiping

;Last Steps
;**********************************************************************************************
G1 Z10                                                  ; raise extruder
G28 X0 Y0                                               ; home X and Y
G0 X0 Y187 F200                                         ; move away from endstops
M109 R{first_layer_temperature[0] - 60}                 ; *wait for extruder to reach probe temp, replaced with equation 3-15-2020 BW 
M204 S300                                               ; set probing acceleration
G29                                                     ; start auto-leveling sequence
M420 S1                                                 ; enable leveling matrix
M425 Z                                                  ; use measured Z backlash for compensation
M425 Z F0                                               ; turn off measured Z backlash compensation. (if activated in the quality settings, this command will automatically be ignored)
M204 S2000                                              ; restore standard acceleration
G1 X5 Y15 Z10 F5000                                     ; move up off last probe point
G4 S1                                                   ; pause
M400                                                    ; wait for moves to finish
M117 Heating...                                         ; progress indicator message on LCD
M109 R{first_layer_temperature[0]}                      ; *wait for extruder to reach initial printing temp, 2-09-2020 BW
M190 R{first_layer_bed_temperature[0]}                  ; *wait for bed to reach printing temp, 2-09-2020 BW
G1 Z2 E0 F75                                            ; prime tiny bit of filment into the nozzle
M203 Z{machine_max_feedrate_z[0]}                       ; *added this line, 3-15-2020
M117 Mini 2 Printing...                                 ; progress indicator message on LCD