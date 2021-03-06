;Bed Level End Sequence
G92 E0
G1 E-4.0 F4000
M104 S140                                                                                   ; bank the hotend
M140 S45                                                                                    ; bank the heatbed
M107                                                                                        ; turn off fan
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+30, max_print_height)} F600{endif} ; Move print bed down
G1 X215 Y215 F3000                                                                            ; present print
;{if layer_z < max_print_height-10}G1 Z{z_offset+max_print_height-10} F600{endif}           ; Move print bed down
M84 X Y E                                                                                   ; disable motors