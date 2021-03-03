;Mini Start for Prusa Slicer
;Mini 154x154x158
;This G-Code has been generated specifically for the LulzBot Mini with standard extruder

M73 P0                                                      ; clear GLCD progress bar
M75                                                         ; Start GLCD Timer
G26                                                         ; clear potential 'probe fail' condition
M107                                                        ; disable fans
M420 S0                                                     ; disable leveling matrix
G90                                                         ; absolute positioning
M82                                                         ; set extruder to absolute mode
G92 E0                                                      ; set extruder position to 0
M140 S[first_layer_bed_temperature]                         ; *start bed heating up, 2-23-2020 BW
G28                                                         ; home all axes
G0 X0 Y187 Z156 F200                                        ; move away from endstops
M109 R{first_layer_temperature[0] - 60}                     ; *soften filament before retraction, PLA = 140, 3-15-2020 BW, used equation
G1 E-30 F75                                                 ; retract filament (Cold Pull)
M109 R{first_layer_temperature[0] - 60}                     ; *wait for extruder to reach wiping temp, PLA = 150, 3-15-2020 BW, used equation
G1 X45 Y173 F11520                                          ; move above wiper pad
G1 Z0 F1200                         ; push nozzle into wiper
G1 X42 Y173 Z-.5 F4000              ; wiping
G1 X52 Y171 Z-.5 F4000              ; wiping
G1 X42 Y173 Z0 F4000                ; wiping
G1 X52 Y171 F4000                   ; wiping
G1 X42 Y173 F4000                   ; wiping
G1 X52 Y171 F4000                   ; wiping
G1 X42 Y173 F4000                   ; wiping
G1 X52 Y171 F4000                   ; wiping
G1 X57 Y173 F4000                   ; wiping
G1 X77 Y171 F4000                   ; wiping
G1 X57 Y173 F4000                   ; wiping
G1 X77 Y171 F4000                   ; wiping
G1 X57 Y173 F4000                   ; wiping
G1 X87 Y171 F4000                   ; wiping
G1 X77 Y173 F4000                   ; wiping
G1 X97 Y171 F4000                   ; wiping
G1 X77 Y173 F4000                   ; wiping
G1 X97 Y171 F4000                   ; wiping
G1 X77 Y173 F4000                   ; wiping
G1 X97 Y171 F4000                   ; wiping
G1 X107 Y173 F4000                  ; wiping
G1 X97 Y171 F4000                   ; wiping
G1 X107 Y173 F4000                  ; wiping
G1 X97 Y171 F4000                   ; wiping
G1 X107 Y173 F4000                  ; wiping
G1 X112 Y171 Z-0.5 F1000            ; wiping
G1 Z10                                                          ; raise z-axis
G28 X0 Y0                                                       ; home X and Y
G0 X0 Y187 F200                                                 ; move away from endstops
M109 R{first_layer_temperature[0] - 60}                         ; *wait for extruder to reach probe temp, changed to equation, 3-15-2020 BW
M204 S300                                                       ; set probing acceleration
G29                                                             ; start auto-leveling sequence
M420 S1                                                         ; enable leveling matrix
M425 Z                                                          ; use measured Z backlash for compensation
M425 Z F0                                                       ; turn off measured Z backlash compensation. (if activated in the quality settings, this command will automatically be ignored)
M204 S2000                                                      ; restore standard acceleration
G28 X0 Y0                                                       ; re-home to account for build variance of earlier mini builds
G0 X0 Y187 F200                                                 ; move away from endstops
G0 Y152 F4000                                                   ; move in front of wiper pad
G4 S1                                                           ; pause
M400                                                            ; wait for moves to finish
M117 Heating...                                                 ; progress indicator message on LCD
M109 R{first_layer_temperature[0]}                              ; wait for extruder to reach printing temp
M190 R{first_layer_bed_temperature[0]}                          ; wait for bed to reach printing temp
G1 Z2 E0 F75                                                    ; prime tiny bit of filament into the nozzle
M117 Mini Printing...                                           ; progress indicator message on LCD