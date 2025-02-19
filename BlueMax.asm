; ---------------------------------------------------------------------------

DCB_STRUCT      struc ; (sizeof=0xC)    ; XREF: LOWMEM:DCB/r
                                        ; TAPE_LOADER:LOAD_DCB/r
DDEVICE:        .BYTE ?                 ; XREF: READ_BLOCK:loc_757/r
                                        ; READ_BLOCK+5/w
DUNIT:          .BYTE ?                 ; base 10
DCOMMAND:       .BYTE ?                 ; enum DCB_COMMANDS
DSTATS:         .BYTE ?
DBUF:           .WORD ?                 ; XREF: BOOT_CONTINUE+1E/r
                                        ; BOOT_CONTINUE+24/w ... ; offset (00000000)
DTIMLO:         .BYTE ?                 ; base 10
                .BYTE ? ; undefined
DBYTE:          .WORD ?                 ; XREF: BOOT_CONTINUE+32/w
DSECTOR:        .WORD ?
DCB_STRUCT      ends

; ---------------------------------------------------------------------------

IOCB_STRUCT     struc ; (sizeof=0x10)
ICHID:          .BYTE ?
ICDNO:          .BYTE ?
ICCOM:          .BYTE ?
ICSTA:          .BYTE ?
ICBADR:         .WORD ?
ICPUT:          .WORD ?
ICBLEN:         .WORD ?
ICAX1:          .BYTE ?
ICAX2:          .BYTE ?
ICAX3:          .BYTE ?
ICAX4:          .BYTE ?
ICAX5:          .BYTE ?
ICAX6:          .BYTE ?
IOCB_STRUCT     ends

; ---------------------------------------------------------------------------

HATABS_STRUCT   struc ; (sizeof=0x3)
DEVICE:         .BYTE ?
ADR:            .WORD ?                 ; offset (00000000)
HATABS_STRUCT   ends

; ---------------------------------------------------------------------------

DIFF_STRUCT     struc ; (sizeof=0x7)    ; XREF: VARS:DIFF/r
                                        ; DATA:EAS0/r ...
wind_probability:.BYTE ?                ; XREF: EB:_5/r EB+39/w ... ; Wind triggered, if RANDOM < value
wind_minimum_duration:.BYTE ?           ; XREF: WIND+18/r ; Minimum duration during which wind is active
field_2:        .BYTE ?                 ; XREF: TRIGB+14/r TRIGF+E/r
field_3:        .BYTE ?                 ; XREF: COLM30+15/r CLG20+1F/r
field_4:        .BYTE ?                 ; XREF: COLM30+1B/r CLG20:J5/r
field_5:        .BYTE ?                 ; XREF: COLM20+E/r
field_6:        .BYTE ?                 ; XREF: COLM20+1B/r
DIFF_STRUCT     ends

; ---------------------------------------------------------------------------

CONTROL_DISPLAY struc ; (sizeof=0x48)   ; XREF: SCREENRAM:SC_STATUS_LINE/r
line_0:         CONTROL_DISPLAY_LINE_0 ? ; XREF: RESET+155/w JOYST/r ...
line_1:         CONTROL_DISPLAY_LINE_1 ? ; XREF: EB+C8/w EB+CB/w ...
line_2:         CONTROL_DISPLAY_LINE_2 ? ; XREF: TURN+F3/w CKLAND+D/w ...
CONTROL_DISPLAY ends

; ---------------------------------------------------------------------------

CONTROL_DISPLAY_LINE_0 struc ; (sizeof=0x18) ; XREF: CONTROL_DISPLAY/r
empty_0:        .BYTE ?
empty_1:        .BYTE ?
empty_2:        .BYTE ?                 ; XREF: RESET+155/w
fuel_F:         .BYTE ?                 ; XREF: REFUEL+A3/w INCBMB+2/w ...
fuel_colon:     .BYTE ?
fuel_digit_100: .BYTE ?                 ; XREF: FUEL+30/r FUEL+59/w ...
fuel_digit_10:  .BYTE ?                 ; XREF: FUEL:MR/r FUEL+49/w ...
fuel_digit_1:   .BYTE ?                 ; XREF: FUEL+1E/w FUEL+21/r ...
field_8:        .BYTE ?
bomb_B:         .BYTE ?                 ; XREF: REFUEL+F/w INCBMB+7/w
bomb_colon:     .BYTE ?
bomb_digit_10:  .BYTE ?                 ; XREF: BOMB+35/r BOMB+4B/w ...
bomb_digit_1:   .BYTE ?                 ; XREF: BOMB+2E/r BOMB:PB/w ...
field_D:        .BYTE ?
field_E:        .BYTE ?
fuel_leak:      .BYTE ?                 ; XREF: FUEL+5/r COLM20:RW/r ... ; "F" character
bomb_gear_damaged:.BYTE ?               ; XREF: BOMB+C/r COLM20:RX/r ... ; "B" character
decreased_maneuverability:.BYTE ?       ; XREF: JOYST/r COLM20:RY/r ... ; "M" character
machine_gun_damaged:.BYTE ?             ; XREF: TRIG__TRIGGER_MACHINE_GUN+8/r
                                        ; COLM20+59/r ... ; "G" character
field_13:       .BYTE ?
enemy_above_warning:.BYTE ?             ; XREF: ASTRSK+11/w AEL+2/w ... ; red "*" character
field_15:       .BYTE ?
field_16:       .BYTE ?
field_17:       .BYTE ?
CONTROL_DISPLAY_LINE_0 ends

; ---------------------------------------------------------------------------

CONTROL_DISPLAY_LINE_1 struc ; (sizeof=0x18) ; XREF: CONTROL_DISPLAY/r
empty_0:        .BYTE ?
empty_1:        .BYTE ?
empty_2:        .BYTE ?
field_3:        .BYTE ?
field_4:        .BYTE ?                 ; XREF: BLMX__PRINT_BLUE_MAX+13/w
                                        ; SQLD__PRINT_SQUADRON_LEADER+5/w ...
field_5:        .BYTE ?                 ; XREF: BLMX__PRINT_BLUE_MAX+10/w
                                        ; RNKX__PRINT_RANK_CLASS+AD/w
field_6:        .BYTE ?                 ; XREF: BLMX__PRINT_BLUE_MAX+7/w
                                        ; BLMX__PRINT_BLUE_MAX+D/w
speed_digit_100:.BYTE ?                 ; XREF: EB+C8/w TURN:_20/r ...
speed_digit_10: .BYTE ?                 ; XREF: EB+CB/w TURN+EB/w ...
speed_digit_1:  .BYTE ?                 ; XREF: EB+CE/w TURN+EE/w ...
field_A:        .BYTE ?
field_B:        .BYTE ?
field_C:        .BYTE ?
field_D:        .BYTE ?
field_E:        .BYTE ?
altitude_digit_100:.BYTE ?              ; XREF: ALT__ALTITUDE_DISPLAY_FIXUP+23/w
                                        ; ALT__ALTITUDE_DISPLAY_FIXUP+3F/w
altitude_digit_10:.BYTE ?               ; XREF: ALT__ALTITUDE_DISPLAY_FIXUP+11/w
                                        ; ALT__ALTITUDE_DISPLAY_FIXUP+14/r ...
altitude_digit_1:.BYTE ?                ; XREF: KK/w UP+6/w ...
field_12:       .BYTE ?
field_13:       .BYTE ?
enemy_plane_warning:.BYTE ?             ; XREF: PLFWD+184/w
                                        ; PLFWD+18D/w ... ; "P" character
wind_factor_warning:.BYTE ?             ; XREF: CKLAND+45/w WIND+1F/w ... ; "W" character
field_16:       .BYTE ?
field_17:       .BYTE ?
CONTROL_DISPLAY_LINE_1 ends

; ---------------------------------------------------------------------------

CONTROL_DISPLAY_LINE_2 struc ; (sizeof=0x18) ; XREF: CONTROL_DISPLAY/r
empty_0:        .BYTE ?
empty_1:        .BYTE ?
empty_2:        .BYTE ?
field_3:        .BYTE ?
field_4:        .BYTE ?
field_5:        .BYTE ?
field_6:        .BYTE ?
field_7:        .BYTE ?
field_8:        .BYTE ?
score_digit_1000:.BYTE ?                ; XREF: S100__SCORE_ADD_100+20/r
                                        ; S100__SCORE_ADD_100+27/w ...
score_digit_100:.BYTE ?                 ; XREF: S100__SCORE_ADD_100:S1000__SCORE_ADD_1000/w
                                        ; S100__SCORE_ADD_100+13/r ...
score_digit_10: .BYTE ?                 ; XREF: S100__SCORE_ADD_100/w
                                        ; S100__SCORE_ADD_100+3/r ...
score_digit_1:  .BYTE ?                 ; XREF: S10__SCORE_ADD_10/w
                                        ; S10__SCORE_ADD_10+3/r ...
field_D:        .BYTE ?
field_E:        .BYTE ?
field_F:        .BYTE ?
field_10:       .BYTE ?
landing_flag:   .BYTE ?                 ; XREF: CKLAND+D/w CKLAND+2E/r ... ; "L" character
field_12:       .BYTE ?
field_13:       .BYTE ?
field_14:       .BYTE ?                 ; XREF: TURN+F3/w ASTRSK:_1/w ... ; "*" character
field_15:       .BYTE ?
field_16:       .BYTE ?
field_17:       .BYTE ?
CONTROL_DISPLAY_LINE_2 ends

; ---------------------------------------------------------------------------

NOTE            struc ; (sizeof=0x2)    ; XREF: DATA:VOICE_1/r
                                        ; DATA:VOICE_2/r ...
freq:           .BYTE ?                 ; frequency
dur:            .BYTE ?                 ; duration
NOTE            ends

; ---------------------------------------------------------------------------

; enum DCB_COMMANDS
DCB_COMMANDS_FORMAT: = $21
DCB_COMMANDS_FORMAT_MD: = $22
DCB_COMMANDS_INTO: = $4E
DCB_COMMANDS_OUT: = $4F
DCB_COMMANDS_PUT: = $50
DCB_COMMANDS_READ: = $52                ; XREF: TAPE_LOADER:LOAD_DCB/s
DCB_COMMANDS_STATUS: = $53
DCB_COMMANDS_WRITE: = $57

; ---------------------------------------------------------------------------

; enum COLOR, bitfield
COLOR_INTENSITY_0: = 0                  ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; SHCOL:CS__/s ...
COLOR_INTENSITY_1: = 1
COLOR_INTENSITY_2: = 2                  ; XREF: RESET+DB/s SHCOL:CR/s ...
COLOR_INTENSITY_3: = 3
COLOR_INTENSITY_4: = 4                  ; XREF: RESET+CF/s RESET+D6/s ...
COLOR_INTENSITY_5: = 5
COLOR_INTENSITY_6: = 6                  ; XREF: XP2:UW/s
                                        ; VDSLST_ROUTINE+1C/s ...
COLOR_INTENSITY_7: = 7
COLOR_INTENSITY_8: = 8                  ; XREF: COLM02+1C/s
                                        ; VDSLST_ROUTINE+11/s ...
COLOR_INTENSITY_9: = 9
COLOR_INTENSITY_10: = $A                ; XREF: CKCOL+1C/s DRP23+FC/s ...
COLOR_INTENSITY_11: = $B
COLOR_INTENSITY_12: = $C                ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; CRSH:_3/s ...
COLOR_INTENSITY_13: = $D
COLOR_INTENSITY_14: = $E                ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; REFUEL+5D/s ...
COLOR_INTENSITY_15: = $F
COLOR_GRAY:      = 0                    ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; SHCOL:CR/s ...
COLOR_GOLD:      = $10                  ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; DRP23:IT/s ...
COLOR_ORANGE:    = $20                  ; XREF: CKCOL+1C/s CRSH:_3/s ...
COLOR_RED_ORANGE: = $30                 ; XREF: CRSH+27/s XP2+11/s ...
COLOR_RED_PINK:  = $40
COLOR_RED_PINK_PURPLE: = $50            ; XREF: CNSL__CONSOLE+79/s
COLOR_PURPLE_BLUE: = $60                ; XREF: CPTL+2E/s BMCPTL+20/s ...
COLOR_DARK_PURPLE: = $70                ; XREF: DRP23+33/s PLFWD+23/s ...
COLOR_BLUE:      = $80                  ; XREF: TAPE_LOADER:COLOR_TABLE/s
COLOR_LIGHT_BLUE: = $90                 ; XREF: RESET+D6/s TURN+168/s ...
COLOR_TURQUOISE: = $A0                  ; XREF: COLM02+1C/s TRGTP2+7/s ...
COLOR_GREEN_BLUE: = $B0
COLOR_GREEN:     = $C0                  ; XREF: TAPE_LOADER:COLOR_TABLE/s
                                        ; RESET+CF/s ...
COLOR_YELLOW_GREEN: = $D0               ; XREF: RESET+DB/s B7+3C/s
COLOR_ORANGE_GREEN: = $E0               ; XREF: VDSLST_ROUTINE+3/s
COLOR_LIGHT_ORANGE: = $F0

; ---------------------------------------------------------------------------

; enum AUDIO_CONTROL, bitfield
AUDIO_CONTROL_VOL_1: = 1                ; XREF: EB+8F/s
AUDIO_CONTROL_VOL_2: = 2                ; XREF: PC+25/s REFUEL+42/s ...
AUDIO_CONTROL_VOL_3: = 3                ; XREF: Y8+D/s PBMB:_2/s
AUDIO_CONTROL_VOL_4: = 4                ; XREF: ROAR+13/s RUNSND+1B/s
AUDIO_CONTROL_VOL_5: = 5                ; XREF: GUNSND+24/s
                                        ; GUNSND:QC/s ...
AUDIO_CONTROL_VOL_6: = 6                ; XREF: LOW+53/s
AUDIO_CONTROL_VOL_7: = 7                ; XREF: FTNKGN-C23/s
                                        ; FM2GN+9F/s ...
AUDIO_CONTROL_VOL_8: = 8                ; XREF: ROAR+30/s
AUDIO_CONTROL_VOL_9: = 9
AUDIO_CONTROL_VOL_10: = $A
AUDIO_CONTROL_VOL_11: = $B
AUDIO_CONTROL_VOL_12: = $C              ; XREF: XPLSN+89/s COLM02+65/s ...
AUDIO_CONTROL_VOL_13: = $D
AUDIO_CONTROL_VOL_14: = $E              ; XREF: BMCPTL+5F/s
AUDIO_CONTROL_VOL_15: = $F              ; XREF: TURN+7A/s FLSH+48/s
VOLUME_ONLY:     = $10
AUDIO_CONTROL_DIST_0: = $20             ; XREF: WARN+9/s
AUDIO_CONTROL_DIST_1: = $40             ; XREF: TURN+7A/s XPLSN+89/s ...
AUDIO_CONTROL_DIST_2: = $60             ; XREF: GUNSND+24/s
                                        ; GUNSND:QB/s ...
AUDIO_CONTROL_DIST_3: = $80             ; XREF: Y8+D/s
AUDIO_CONTROL_DIST_4: = $A0             ; XREF: PC+25/s REFUEL+42/s ...
AUDIO_CONTROL_DIST_6: = $C0             ; XREF: EB+8F/s KMKZ+D/s ...

; ---------------------------------------------------------------------------

; enum SND_FREQ
SND_FREQ_0:      = 0
SND_FREQ_1:      = 1
SND_FREQ_2:      = 2
SND_FREQ_3:      = 3
SND_FREQ_4:      = 4
SND_FREQ_5:      = 5
SND_FREQ_6:      = 6
SND_FREQ_7:      = 7
SND_FREQ_8:      = 8
SND_FREQ_9:      = 9
SND_FREQ_10:     = 10                   ; XREF: RUNSND+10/s LOW+4B/s
SND_FREQ_11:     = 11
SND_FREQ_12:     = 12
SND_FREQ_13:     = 13                   ; XREF: EB+80/s
SND_FREQ_14:     = 14
SND_FREQ_15:     = 15                   ; XREF: LINE+3D/s
                                        ; DATA:VOICE_1/s ...
SND_FREQ_16:     = 16
SND_FREQ_17:     = 17
SND_FREQ_18:     = 18
SND_FREQ_19:     = 19
SND_FREQ_20:     = 20                   ; XREF: PC+1D/s
SND_FREQ_21:     = 21                   ; XREF: REFUEL+3D/s
SND_FREQ_22:     = 22
SND_FREQ_23:     = 23
SND_FREQ_24:     = 24
SND_FREQ_25:     = 25                   ; XREF: RUNSND:QG/s
SND_FREQ_26:     = 26
SND_FREQ_27:     = 27
SND_FREQ_28:     = 28
SND_FREQ_29:     = 29
SND_FREQ_30:     = 30
SND_FREQ_31:     = 31
SND_FREQ_32:     = 32
SND_FREQ_33:     = 33
SND_FREQ_34:     = 34
SND_FREQ_35:     = 35
SND_FREQ_36:     = 36                   ; XREF: DATA:VOICE_1/s
SND_FREQ_37:     = 37                   ; XREF: DATA:VOICE_1/s
SND_FREQ_38:     = 38                   ; XREF: DATA:VOICE_1/s
SND_FREQ_39:     = 39                   ; XREF: DATA:VOICE_1/s
SND_FREQ_40:     = 40
SND_FREQ_41:     = 41                   ; XREF: DATA:VOICE_1/s
                                        ; DATA:VOICE_2/s
SND_FREQ_42:     = 42
SND_FREQ_43:     = 43                   ; XREF: DATA:VOICE_1/s
                                        ; DATA:VOICE_2/s
SND_FREQ_44:     = 44
SND_FREQ_45:     = 45
SND_FREQ_46:     = 46
SND_FREQ_47:     = 47
SND_FREQ_48:     = 48                   ; XREF: DATA:VOICE_1/s
                                        ; DATA:VOICE_2/s
SND_FREQ_49:     = 49
SND_FREQ_50:     = 50                   ; XREF: GUNSND+E/s
                                        ; DATA:VOICE_1/s ...
SND_FREQ_51:     = 51
SND_FREQ_52:     = 52                   ; XREF: DATA:VOICE_1/s
                                        ; DATA:VOICE_2/s
SND_FREQ_53:     = 53                   ; XREF: DATA:VOICE_2/s
SND_FREQ_54:     = 54                   ; XREF: DATA:VOICE_1/s
                                        ; DATA:VOICE_2/s
SND_FREQ_55:     = 55                   ; XREF: DATA:VOICE_2/s
SND_FREQ_56:     = 56
SND_FREQ_57:     = 57
SND_FREQ_58:     = 58
SND_FREQ_59:     = 59                   ; XREF: DATA:VOICE_2/s
                                        ; DATA:VOICE_3/s
SND_FREQ_60:     = 60                   ; XREF: GGNSND:_4/s
SND_FREQ_61:     = 61
SND_FREQ_62:     = 62
SND_FREQ_63:     = 63
SND_FREQ_64:     = 64                   ; XREF: DATA:VOICE_2/s
                                        ; DATA:VOICE_3/s
SND_FREQ_65:     = 65
SND_FREQ_66:     = 66                   ; XREF: DATA:VOICE_3/s
SND_FREQ_67:     = 67
SND_FREQ_68:     = 68                   ; XREF: DATA:VOICE_3/s
SND_FREQ_69:     = 69                   ; XREF: DATA:VOICE_3/s
SND_FREQ_70:     = 70                   ; XREF: DATA:VOICE_3/s
SND_FREQ_71:     = 71                   ; XREF: DATA:VOICE_3/s
SND_FREQ_72:     = 72
SND_FREQ_73:     = 73                   ; XREF: DATA:VOICE_3/s
SND_FREQ_74:     = 74
SND_FREQ_75:     = 75                   ; XREF: DATA:VOICE_3/s
SND_FREQ_76:     = 76
SND_FREQ_77:     = 77
SND_FREQ_78:     = 78
SND_FREQ_79:     = 79
SND_FREQ_80:     = 80                   ; XREF: DATA:VOICE_3/s
SND_FREQ_81:     = 81
SND_FREQ_82:     = 82                   ; XREF: DATA:VOICE_3/s
SND_FREQ_83:     = 83
SND_FREQ_84:     = 84                   ; XREF: DATA:VOICE_3/s
SND_FREQ_85:     = 85                   ; XREF: DATA:VOICE_3/s
SND_FREQ_86:     = 86                   ; XREF: DATA:VOICE_3/s
SND_FREQ_87:     = 87                   ; XREF: DATA:VOICE_3/s
SND_FREQ_88:     = 88
SND_FREQ_89:     = 89                   ; XREF: DATA:VOICE_3/s
SND_FREQ_90:     = 90
SND_FREQ_91:     = 91                   ; XREF: DATA:VOICE_3/s
SND_FREQ_92:     = 92
SND_FREQ_93:     = 93
SND_FREQ_94:     = 94
SND_FREQ_95:     = 95
SND_FREQ_96:     = 96
SND_FREQ_97:     = 97
SND_FREQ_98:     = 98
SND_FREQ_99:     = 99
SND_FREQ_100:    = 100
SND_FREQ_101:    = 101
SND_FREQ_102:    = 102
SND_FREQ_103:    = 103
SND_FREQ_104:    = 104
SND_FREQ_105:    = 105
SND_FREQ_106:    = 106
SND_FREQ_107:    = 107
SND_FREQ_108:    = 108
SND_FREQ_109:    = 109
SND_FREQ_110:    = 110
SND_FREQ_111:    = 111
SND_FREQ_112:    = 112
SND_FREQ_113:    = 113
SND_FREQ_114:    = 114
SND_FREQ_115:    = 115
SND_FREQ_116:    = 116
SND_FREQ_117:    = 117
SND_FREQ_118:    = 118
SND_FREQ_119:    = 119
SND_FREQ_120:    = 120
SND_FREQ_121:    = 121
SND_FREQ_122:    = 122
SND_FREQ_123:    = 123
SND_FREQ_124:    = 124
SND_FREQ_125:    = 125
SND_FREQ_126:    = 126
SND_FREQ_127:    = 127
SND_FREQ_128:    = 128
SND_FREQ_129:    = 129
SND_FREQ_130:    = 130
SND_FREQ_131:    = 131
SND_FREQ_132:    = 132
SND_FREQ_133:    = 133
SND_FREQ_134:    = 134
SND_FREQ_135:    = 135
SND_FREQ_136:    = 136
SND_FREQ_137:    = 137
SND_FREQ_138:    = 138
SND_FREQ_139:    = 139
SND_FREQ_140:    = 140
SND_FREQ_141:    = 141
SND_FREQ_142:    = 142
SND_FREQ_143:    = 143
SND_FREQ_144:    = 144
SND_FREQ_145:    = 145
SND_FREQ_146:    = 146
SND_FREQ_147:    = 147
SND_FREQ_148:    = 148
SND_FREQ_149:    = 149
SND_FREQ_150:    = 150
SND_FREQ_151:    = 151
SND_FREQ_152:    = 152
SND_FREQ_153:    = 153
SND_FREQ_154:    = 154
SND_FREQ_155:    = 155
SND_FREQ_156:    = 156
SND_FREQ_157:    = 157
SND_FREQ_158:    = 158
SND_FREQ_159:    = 159
SND_FREQ_160:    = 160
SND_FREQ_161:    = 161
SND_FREQ_162:    = 162
SND_FREQ_163:    = 163
SND_FREQ_164:    = 164
SND_FREQ_165:    = 165
SND_FREQ_166:    = 166
SND_FREQ_167:    = 167
SND_FREQ_168:    = 168
SND_FREQ_169:    = 169
SND_FREQ_170:    = 170
SND_FREQ_171:    = 171
SND_FREQ_172:    = 172
SND_FREQ_173:    = 173
SND_FREQ_174:    = 174
SND_FREQ_175:    = 175
SND_FREQ_176:    = 176
SND_FREQ_177:    = 177
SND_FREQ_178:    = 178
SND_FREQ_179:    = 179
SND_FREQ_180:    = 180
SND_FREQ_181:    = 181
SND_FREQ_182:    = 182
SND_FREQ_183:    = 183
SND_FREQ_184:    = 184
SND_FREQ_185:    = 185
SND_FREQ_186:    = 186
SND_FREQ_187:    = 187
SND_FREQ_188:    = 188
SND_FREQ_189:    = 189
SND_FREQ_190:    = 190
SND_FREQ_191:    = 191
SND_FREQ_192:    = 192
SND_FREQ_193:    = 193
SND_FREQ_194:    = 194
SND_FREQ_195:    = 195
SND_FREQ_196:    = 196
SND_FREQ_197:    = 197
SND_FREQ_198:    = 198
SND_FREQ_199:    = 199
SND_FREQ_200:    = 200
SND_FREQ_201:    = 201
SND_FREQ_202:    = 202
SND_FREQ_203:    = 203
SND_FREQ_204:    = 204
SND_FREQ_205:    = 205
SND_FREQ_206:    = 206
SND_FREQ_207:    = 207
SND_FREQ_208:    = 208
SND_FREQ_209:    = 209
SND_FREQ_210:    = 210
SND_FREQ_211:    = 211
SND_FREQ_212:    = 212
SND_FREQ_213:    = 213
SND_FREQ_214:    = 214
SND_FREQ_215:    = 215
SND_FREQ_216:    = 216
SND_FREQ_217:    = 217
SND_FREQ_218:    = 218
SND_FREQ_219:    = 219
SND_FREQ_220:    = 220
SND_FREQ_221:    = 221
SND_FREQ_222:    = 222
SND_FREQ_223:    = 223
SND_FREQ_224:    = 224
SND_FREQ_225:    = 225
SND_FREQ_226:    = 226
SND_FREQ_227:    = 227
SND_FREQ_228:    = 228
SND_FREQ_229:    = 229
SND_FREQ_230:    = 230
SND_FREQ_231:    = 231
SND_FREQ_232:    = 232
SND_FREQ_233:    = 233
SND_FREQ_234:    = 234
SND_FREQ_235:    = 235
SND_FREQ_236:    = 236
SND_FREQ_237:    = 237
SND_FREQ_238:    = 238
SND_FREQ_239:    = 239
SND_FREQ_240:    = 240
SND_FREQ_241:    = 241
SND_FREQ_242:    = 242
SND_FREQ_243:    = 243
SND_FREQ_244:    = 244
SND_FREQ_245:    = 245
SND_FREQ_246:    = 246
SND_FREQ_247:    = 247
SND_FREQ_248:    = 248
SND_FREQ_249:    = 249
SND_FREQ_250:    = 250
SND_FREQ_251:    = 251                  ; XREF: RESET+183/s EB:AFX/s
SND_FREQ_252:    = 252
SND_FREQ_253:    = 253
SND_FREQ_254:    = 254
SND_FREQ_255:    = 255

; ---------------------------------------------------------------------------

; enum KEYCODE, bitfield
KEYCODE_SPACE:   = $21                  ; XREF: PAUSE+3/s PAUSE+2F/s
KEYCODE_9:       = $30                  ; XREF: S10__SCORE_ADD_10+6/t
                                        ; S100__SCORE_ADD_100+6/t ...
KEYCODE_SHIFT:   = $40
KEYCODE_CONTROL: = $80

; ---------------------------------------------------------------------------

; enum ATASCI, bitfield, width 1 byte
_SPACE:          = 0                    ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; TURN+F1/s ...
_EXCLAMATION:    = 1
_OPEN_BRACKET:   = 8                    ; XREF: DATA:DEMI/s
_CLOSE_BRACKET:  = 9                    ; XREF: DATA:DEMI/s
_ASTERIX:        = $A                   ; XREF: ASTRSK+7/s
                                        ; CNSL__CONSOLE:_12/s ...
_MINUS:          = $D
_QUESTIONMARK:   = $F                   ; XREF: READ_BLOCK+17/s
                                        ; ALT__ALTITUDE_DISPLAY_FIXUP+33/s ...
_0:              = $10                  ; XREF: EB+C6/s TURN+71/s ...
_1:              = $11                  ; XREF: ALT__ALTITUDE_DISPLAY_FIXUP+21/s
                                        ; SPD__SPEED_CHANGE+1A/s ...
_2:              = $12                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; TURN+CB/s ...
_3:              = $13                  ; XREF: SPD__SPEED_CHANGE+13/s
                                        ; SPD__SPEED_CHANGE+29/s ...
_4:              = $14                  ; XREF: RNK__DISPLAY_RANK:_8/s
                                        ; RNK__DISPLAY_RANK:_4/s ...
_5:              = $15
_6:              = $16
_7:              = $17
_8:              = $18                  ; XREF: DATA:DEMI/s
_9:              = $19                  ; XREF: READ_BLOCK+1E/s
                                        ; BOMB+46/s ...
_COLON:          = $1A                  ; XREF: ALT__ALTITUDE_DISPLAY_FIXUP+3/s
                                        ; ALT__ALTITUDE_DISPLAY_FIXUP+17/s ...
_A:              = $21                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_B:              = $22                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; REFUEL+D/s ...
_C:              = $23                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_D:              = $24                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; TAKOF__TAKEOFF_LOOP+21/s ...
_E:              = $25                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_F:              = $26                  ; XREF: REFUEL+A1/s INCBMB/s ...
_G:              = $27                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; COLM20+5E/s ...
_H:              = $28
_I:              = $29                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:NOVI/s ...
_J:              = $2A
_K:              = $2B                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:RNKI/s ...
_L:              = $2C                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; CKLAND:MG/s ...
_M:              = $2D                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; COLM20+7F/s ...
_N:              = $2E                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:NOVI/s ...
_O:              = $2F                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_P:              = $30                  ; XREF: PLFWD:loc_220E/s
                                        ; L6:OF/s ...
_Q:              = $31                  ; XREF: DATA:SQLDI/s
_R:              = $32                  ; XREF: DRUN__DRAW_RUNWAY+5D/s
                                        ; DATA:53F6/s ...
_S:              = $33                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_T:              = $34                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:53F6/s ...
_U:              = $35                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:DEMI/s ...
_V:              = $36                  ; XREF: DATA:NOVI/s
                                        ; DATA:VETI/s ...
_W:              = $37                  ; XREF: WIND+1D/s DATA:RSWI/s
_X:              = $38                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; DATA:DEMI/s
_Y:              = $39                  ; XREF: DATA:NGRVI/s
                                        ; DATA:DEMI/s ...
_Z:              = $3A                  ; XREF: DATA:KMKZI/s
_C_BLACK:        = 0                    ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; TURN+F1/s ...
_C_BLUE:         = $40                  ; XREF: TAPE_LOADER:TEXT_LINE/s
                                        ; TURN+71/s ...
_C_ORANGE:       = $80                  ; XREF: READ_BLOCK+17/s
                                        ; READ_BLOCK+1E/s ...
_C_LBLUE:        = $C0                  ; XREF: REFUEL+D/s CKLAND:MG/s ...

; ---------------------------------------------------------------------------

; enum SETVBV_VECTORS, width 1 byte
SETVBV_CDTMV1:   = 1
SETVBV_CDTMV2:   = 2
SETVBV_CDTMV3:   = 3
SETVBV_CDTMV4:   = 4
SETVBV_CDTMV5:   = 5
SETVBV_VVBLKI:   = 6
SETVBV_VVBLKD:   = 7                    ; XREF: EB:MZ/s PAUSE:IF/s ...

; ---------------------------------------------------------------------------

; enum LEVEL, bitfield
L_GRAS:          = 0                    ; XREF: DRAW+7/s
                                        ; DRTR__DRAW_TREE+82/s ...
L_WATER_GRAS_A:  = 1                    ; XREF: DRAW+8C/s
L_WATER:         = 2                    ; XREF: DRAW+93/s DRAW+EF/s ...
L_CLIFF_WATER_A: = 3                    ; XREF: DRAW+A7/s XPLSN+46/s
L_CLIFF_GRAS_A:  = 4                    ; XREF: DRAW+B7/s DRAW+152/s ...
L_WATER_GRAS_B1: = 5                    ; XREF: DRAW+198/s XPLSN+4A/s
L_WATER_GRAS_B2: = 6                    ; XREF: DRAW+18D/s
L_CLIFF_WATER_B1: = 7                   ; XREF: DRAW+1BE/s XPLSN+5A/s
L_CLIFF_WATER_B2: = 8                   ; XREF: DRAW+1B3/s XPLSN+42/s
L_CLIFF_GRAS_B1: = 9                    ; XREF: DRAW+C3/s DRAW+1E7/s
L_CLIFF_GRAS_B2: = $A                   ; XREF: DRAW:BN/s DRAW:AP/s ...
L_WATER_GRAS_C1: = $B                   ; XREF: DRAW+125/s
L_WATER_GRAS_C2: = $C                   ; XREF: DRAW+E8/s XPLSN+4E/s
L_CLIFF_WATER_C: = $D                   ; XREF: DRAW+140/s XPLSN+3E/s
L_GRAS_CLIFF_WATER_A: = $E              ; XREF: DRAW+10A/s XPLSN+66/s ...
L_GRASS_CLIFF_D: = $F                   ; XREF: DRAW:Y_/s XPLSN+62/s
L_GRAS_CLIFF_WATER_B: = $10             ; XREF: DRAW:AZ/s XPLSN+5E/s
L_RUNWAY_RIGHT_11: = $11                ; XREF: DRUN__DRAW_RUNWAY+C0/s
L_RUNWAY_CENTER_12: = $12               ; XREF: QN:RA/s ZE+37/s ...
L_RUNWAY_LEFT_13: = $13                 ; XREF: DRUN__DRAW_RUNWAY+F2/s
                                        ; RNK__DISPLAY_RANK-D/s
L_RUNWAY_MARKER_14: = $14               ; XREF: DRUN__DRAW_RUNWAY+EA/s
                                        ; RNK__DISPLAY_RANK-6/s
L_HANGAR_A:      = $15                  ; XREF: DATA:HNGR1/s
                                        ; DATA:AAF/s
L_HANGAR_B:      = $16                  ; XREF: DATA:HNGR2/s
                                        ; DATA:AAF/s
L_HANGAR_C:      = $17                  ; XREF: DATA:HNGR2/s
                                        ; DATA:AAF/s
L_HANGAR_D:      = $18                  ; XREF: DATA:HNGR2/s
                                        ; DATA:AAF/s
L_HANGAR_E:      = $19                  ; XREF: DATA:HNGR2/s
                                        ; DATA:AAF/s
L_HANGAR_F:      = $1A                  ; XREF: DATA:HNGR1/s
                                        ; DATA:HNGR2/s ...
L_HANGAR_G:      = $1B                  ; XREF: DATA:HNGR2/s
                                        ; DATA:HNGR3/s ...
L_HANGAR_H:      = $1C                  ; XREF: DATA:HNGR3/s
                                        ; DATA:AAA/s ...
L_HANGAR_I:      = $1D                  ; XREF: DATA:HNGR5/s
                                        ; DATA:AAF/s
L_HANGAR_J:      = $1E                  ; XREF: DATA:HNGR5/s
                                        ; DATA:AAF/s
L_HANGAR_K:      = $1F                  ; XREF: DATA:HNGR5/s
                                        ; DATA:AAF/s
L_HANGAR_L:      = $20                  ; XREF: DATA:HNGR5/s
                                        ; DATA:AAF/s
L_TREE_TOP_LEFT_A: = $21                ; XREF: DRTR__DRAW_TREE:ES/s
L_TREE_TOP_LEFT_B: = $22                ; XREF: DRTR__DRAW_TREE+2B/s
L_TREE_TOP_RIGHT_B: = $23               ; XREF: DRTR__DRAW_TREE:EQ/s
L_TREE_TOP_RIGHT_A: = $24               ; XREF: DRTR__DRAW_TREE+19/s
L_TREE_BOTTOM_LEFT_A: = $25             ; XREF: DRTR__DRAW_TREE+AA/s
L_TREE_BOTTOM_LEFT_B: = $26             ; XREF: DRTR__DRAW_TREE:EJ/s
L_TREE_BOTTOM_RIGHT_A: = $27            ; XREF: DRTR__DRAW_TREE+98/s
L_TREE_BOTTOM_RIGHT_B: = $28            ; XREF: DRTR__DRAW_TREE:EH/s
L_BRIDGE_A:      = $29                  ; XREF: DATA:BR2/s DATA:AAC/s
L_BRIDGE_B:      = $2A                  ; XREF: DATA:BR3/s DATA:AAD/s
L_BRIDGE_C:      = $2B                  ; XREF: DATA:BR2/s DATA:AAC/s
L_BRIDGE_D:      = $2C                  ; XREF: DATA:BR2/s DATA:AAC/s
L_BRIDGE_E:      = $2D
L_BRIDGE_F:      = $2E                  ; XREF: DATA:BR2/s DATA:AAC/s
L_BRIDGE_G:      = $2F                  ; XREF: XPLSN+3A/s DATA:BR1/s
L_BRIDGE_H:      = $30                  ; XREF: DATA:BR1/s
L_ANTI_AIRCRAFT_BATTERY_A: = $31        ; XREF: QN+7B/s ENRUN+F6/s ...
L_BRIDGE_J:      = $32                  ; XREF: DATA:BR1/s DATA:AAC/s
L_BRIDGE_K:      = $33                  ; XREF: DRBR__DRAW_BRIDGE+115/s
                                        ; DRBR__DRAW_BRIDGE+143/s
L_BRIDGE_L:      = $34                  ; XREF: DRBR__DRAW_BRIDGE+124/s
                                        ; DRBR__DRAW_BRIDGE+14D/s
L_BRIDGE_M:      = $35                  ; XREF: DRBR__DRAW_BRIDGE+C6/s
                                        ; DRBR__DRAW_BRIDGE+FD/s ...
L_BRIDGE_N:      = $36                  ; XREF: DRBR__DRAW_BRIDGE+D2/s
                                        ; DRBR__DRAW_BRIDGE+107/s ...
L_BRIDGE_O:      = $37                  ; XREF: DATA:BR3/s DATA:AAD/s
L_BRIDGE_P:      = $38                  ; XREF: DATA:BR3/s DATA:AAD/s
L_BRIDGE_Q:      = $39                  ; XREF: DATA:BR1/s DATA:AAC/s
L_FIXED_BOAT_TOP_LEFT: = $3A            ; XREF: DRBT__DRAW_BOAT+4E/s
                                        ; CKCHAR+10/s
L_FIXED_BOAT_TOP_RIGHT: = $3B           ; XREF: DRBT__DRAW_BOAT:HB/s
                                        ; CKCHAR+14/s
L_FIXED_BOAT_BOTTOM_LEFT: = $3C         ; XREF: DRBT__DRAW_BOAT+3A/s
                                        ; CKCHAR+18/s ...
L_FIXED_BOAT_BOTTOM_RIGHT: = $3D        ; XREF: DRBT__DRAW_BOAT+35/s
                                        ; CKCHAR+1C/s ...
L_EXPLOSION_GRAS_4: = $3E               ; XREF: ID:HO/s
L_BUILDING_ROOF_CENTER: = $3F           ; XREF: QN+9F/s DATA:AAA/s
L_EXPLOSION_GRAS_1: = $40               ; XREF: XPLSN:HY/s ID:HP/s
L_EXPLOSION_GRAS_2: = $41               ; XREF: ID+6A/s
L_EXPLOSION_GRAS_3: = $42               ; XREF: ID+7D/s
L_EXPLOSION_WATER_1: = $43              ; XREF: XPLSN:HW/s HV:IB/s ...
L_EXPLOSION_WATER_2: = $44              ; XREF: HV:IA/s Y6:loc_43A2/s
L_BUILDING_WINDOW: = $45                ; XREF: QN+5A/s DATA:AAA/s
L_TANK_LEFT_A:   = $46                  ; XREF: QN+2A/s TNKC1-25/s ...
L_TANK_RIGHT_A:  = $47                  ; XREF: QN+2F/s TNKC1-29/s ...
L_GRAS_BEFORE_BUILDING: = $48           ; XREF: QN+37/s TNKC1:E6/s ...
L_BUILDING_ROOF_TOP_RIGHT: = $49        ; XREF: QN+A7/s DATA:AAA/s
L_BUILDING_WALL_A: = $4A                ; XREF: QN+6B/s DATA:AAA/s
L_RUNWAY_LEFT:   = $4B                  ; XREF: DATA:ROADS/s
                                        ; DATA:ENRNIM/s ...
L_ROAD_DIAG_RIGHT_B: = $4C              ; XREF: DATA:ROADR/s
                                        ; DATA:AAE/s
L_ROAD_DIAG_RIGHT_A: = $4D              ; XREF: DATA:ROADR/s
                                        ; DATA:AAE/s
L_ROAD_DIAG_LEFT_B: = $4E               ; XREF: DATA:ROADR/s
                                        ; DATA:AAE/s
L_ROAD_E:        = $4F
L_RUNWAY_PLANE_TOP_RIGHT: = $50         ; XREF: ENRUN+57/s CKCHAR/s
L_RUNWAY_PLANE_TOP_LEFT: = $51          ; XREF: ENRUN+52/s CKCHAR+4/s
L_RUNWAY_PLANE_BOTTOM_RIGHT: = $52      ; XREF: ENRUN+7B/s CKCHAR+8/s
L_RUNWAY_PLANE_BOTTOM_LEFT: = $53       ; XREF: ENRUN+76/s CKCHAR+C/s
L_SKYSCRAPER_54: = $54                  ; XREF: BLDG+AA/s DATA:AAB/s
L_SKYSCRAPER_55: = $55                  ; XREF: BLDG+16B/s DATA:AAB/s
L_SKYSCRAPER_56: = $56                  ; XREF: BLDG+131/s BLDG+154/s ...
L_SKYSCRAPER_57: = $57                  ; XREF: BLDG+C7/s DATA:AAB/s
L_SKYSCRAPER_58: = $58                  ; XREF: BLDG:loc_3109/s
                                        ; DATA:AAB/s
L_SKYSCRAPER_59: = $59                  ; XREF: BLDG+173/s DATA:AAB/s
L_SKYSCRAPER_B_5A: = $5A                ; XREF: DATA:AAB/s
L_SKYSCRAPER_B_5B: = $5B                ; XREF: DRBR__DRAW_BRIDGE+163/s
                                        ; DATA:AAC/s
L_SKYSCRAPER_B_C: = $5C                 ; XREF: DATA:AAB/s
L_SKYSCRAPER_B_5D: = $5D                ; XREF: DATA:AAB/s
L_SKYSCRAPER_B_5E: = $5E                ; XREF: DATA:AAB/s
L_EXPLOSION_5F:  = $5F                  ; XREF: AEI:loc_4922/s
L_WATER_60:      = $60                  ; XREF: ZE+A5/s XI+7/s
L_61:            = $61                  ; XREF: ZE+AD/s
L_62:            = $62                  ; XREF: ZE:loc_34B1/s
L_63:            = $63
L_64:            = $64                  ; XREF: ZE+FD/s XYZ/s
L_65:            = $65                  ; XREF: ZE:loc_3487/s
L_66:            = $66
L_67:            = $67
L_68:            = $68
L_69:            = $69
L_6A:            = $6A
L_6B:            = $6B
L_STREET_CAR_LEFT_COLOR_A: = $6C        ; XREF: DRCAR+26/s SHBT+1F/s ...
L_STREET_CAR_RIGHT_COLOR_A: = $6D       ; XREF: DRCAR+21/s SHBT+27/s ...
L_STREET_CAR_LEFT_COLOR_B: = $6E        ; XREF: DRCAR+30/s SHBT+23/s ...
L_STREET_CAR_RIGHT_COLOR_B: = $6F       ; XREF: DRCAR:J7/s SHBT+2B/s ...
L_ANTI_AIRCRAFT_BATTERY_B: = $70        ; XREF: GUNC+34/s GUNC+46/s ...
L_TANK_LEFT_B:   = $71                  ; XREF: GUNC+6D/s DATA:AAG/s
L_TANK_RIGHT_B:  = $72                  ; XREF: GUNC+72/s DATA:AAG/s
L_FLASHING_MARKER: = $73                ; XREF: GUNC-5DD/s GUNC-5CB/s
L_RUNWAY_RIGHT:  = $74                  ; XREF: DATA:ROADS/s
                                        ; DATA:ENRNIM/s
L_EXPLOSION_WATER_3: = $75              ; XREF: V8:_1/s V8+2B/s ...
L_EXPLOSION_WATER_4: = $76              ; XREF: V8+20/s Y6+C/s
L_EXPLOSION_WATER_5: = $77              ; XREF: V8+8/s V8+17/s
L_EXPLOSION_WATER_6: = $78              ; XREF: V8+C/s
L_EXPLOSION_STREET_2: = $79             ; XREF: Y6+1B/s Y6:loc_43BC/s ...
L_EXPLOSION_STREET_3: = $7A             ; XREF: Y6+3F/s
L_EXPLOSION_STREET_1: = $7B             ; XREF: Y6+32/s Y6+4C/s
L_RUNWAY_CENTER: = $7C                  ; XREF: DRBR__DRAW_BRIDGE+B8/s
                                        ; DRBR__DRAW_BRIDGE+EF/s ...
L_ROAD_DIAG_LEFT_A: = $7D               ; XREF: DATA:ROADR/s
                                        ; DATA:AAE/s
L_SOLID_WALL:    = $7E                  ; XREF: CLEAR+10/s AEI+7/s ...
L_BUILDING_ROOF_TOP_LEFT: = $7F         ; XREF: QN+98/s DATA:AAA/s
L_C_0:           = 0                    ; XREF: DRAW+7/s DRAW+8C/s ...
L_C_1:           = $80                  ; XREF: DRBT__DRAW_BOAT+35/s
                                        ; DRBT__DRAW_BOAT+3A/s ...

; ---------------------------------------------------------------------------

; enum DIR_RIVER
DIR_RIVER_STRAIGHT: = 1                 ; XREF: DRAW+11/s DRAW+29/s ...
DIR_RIVER_LEFT:  = 2                    ; XREF: RESET+26C/s DRAW:BA/s
DIR_RIVER_RIGHT: = 3                    ; XREF: DRAW+15/s DRAW:AV/s

; ---------------------------------------------------------------------------

; enum TURN_MODE, width 1 byte
TURN_MODE_OFF:   = 0
TURN_MODE_LEFT:  = 1                    ; XREF: LD-F/s L6+19A/s ...
TURN_MODE_RIGHT: = 2                    ; XREF: PLFWD+A3/s PLFWD+133/s ...

; ---------------------------------------------------------------------------

; enum FINAL_TARGETS_STATE, bitfield, width 1 byte
FINAL_TARGET_1:  = 1                    ; XREF: CPTL:_8/s BMCPTL:_3/s
FINAL_TARGET_2:  = 2                    ; XREF: CPTL:_9/s BMCPTL:_4/s
FINAL_TARGET_3:  = 4                    ; XREF: CPTL+2A/s BMCPTL+24/s
FINAL_TARGET_ALL: = 7                   ; XREF: STOPL+2D/s FLSH+1B/s ...

; ---------------------------------------------------------------------------

; enum JOYSTICK, width 1 byte
JOYSTICK_0:      = 0
JOYSTICK_1:      = 1
JOYSTICK_2:      = 2
JOYSTICK_3:      = 3
JOYSTICK_4:      = 4
JOYSTICK_DOWN_RIGHT: = 5                ; XREF: PROP+28/s PROP+45/s ...
JOYSTICK_UP_RIGHT: = 6                  ; XREF: JOYST+1E/s
                                        ; SPD__SPEED_CHANGE+8/s ...
JOYSTICK_RIGHT:  = 7                    ; XREF: PROP+24/s PROP+41/s ...
JOYSTICK_8:      = 8
JOYSTICK_DOWN_LEFT: = 9                 ; XREF: JOYST+22/s
JOYSTICK_UP_LEFT: = $A                  ; XREF: PROP+20/s PROP+3D/s ...
JOYSTICK_LEFT:   = $B                   ; XREF: PROP+1C/s PROP+39/s ...
JOYSTICK_c:      = $C
JOYSTICK_DOWN:   = $D                   ; XREF: RESET+8/s
                                        ; MENU__CHECK_KEYS+A6/s
JOYSTICK_UP:     = $E                   ; XREF: RESET+D/s
JOYSTICK_NOTHING: = $F                  ; XREF: TAKOF__TAKEOFF_LOOP+49/s
                                        ; DJOY__DEMO_JOYSTICK_INPUT+17/s ...

; ---------------------------------------------------------------------------

; enum GAME_LEVEL
GAME_LEVEL_NOVICE: = 0
GAME_LEVEL_INTERMEDIATE: = 1            ; XREF: EB+30/s
                                        ; RNK__DISPLAY_RANK+7D/s ...
GAME_LEVEL_ADVANCED: = 2                ; XREF: CKSC+3/s

; ---------------------------------------------------------------------------

; enum ENEMY_BULLET_MOVEMENT_TYPES, width 1 byte
ENEMY_BULLET_MOVEMENT_TYPES_LEFT: = 0   ; XREF: ZZ/s FTNKGN-1EE/s ...
ENEMY_BULLET_MOVEMENT_TYPES_LEFT2: = 1  ; XREF: FTNKGN-C5B/s
                                        ; FTNKGN:A9/s ...
ENEMY_BULLET_MOVEMENT_TYPES_NOTHING: = 2 ; XREF: FTNKGN:ZX/s
                                        ; FTNKGN-1DA/s ...
ENEMY_BULLET_MOVEMENT_TYPES_LEFT_RANDOM: = 3
ENEMY_BULLET_MOVEMENT_TYPES_RIGHT: = 4  ; XREF: FTNKGN-C44/s
                                        ; FTNKGN:G1/s ...

; ---------------------------------------------------------------------------

; enum HORIZONTAL_POSITIONS, width 1 byte
PLANE_MIN_XorY_POSITION: = 60           ; XREF: UP+2/s CE+2/s ... ; min. allowed X position for the plane
PLANE_MAX_X_POSITION: = 184             ; XREF: CD+2/s JOYST+125/s ... ; max. allowed X position for the plane

; ---------------------------------------------------------------------------

; enum GAME_PHASE, width 1 byte
GAME_PHASE_RIVER_PHASE_0: = 0           ; XREF: B7:XC/s
GAME_PHASE_DIAGNOAL_ROAD_1: = 1         ; XREF: B7+2F/s
GAME_PHASE_DIAGNOAL_ROAD_2: = 2         ; XREF: ENRUN+12/s BLDG+77/s ...
GAME_PHASE_ROAD_HARD_RIGHT_3: = 3       ; XREF: L6+4B/s TNKC+10/s ...
GAME_PHASE_4:    = 4                    ; XREF: B7+18/s TNKC1+10/s ...
GAME_PHASE_5:    = 5                    ; XREF: AREA+13/s CLEAR+8/s ...
GAME_PHASE_6:    = 6                    ; XREF: B7+28/s END+39/s ...
GAME_PHASE_7:    = 7                    ; XREF: B7+20/s YI+11/s ...
GAME_PHASE_8:    = 8                    ; XREF: AREA+17/s CLEAR+C/s ...

; ---------------------------------------------------------------------------

; enum EXPLOSITION_TARGET, width 1 byte
EXPLOSITION_TARGET_WATER: = 0           ; XREF: Y8/s BMBSHP+D/s
EXPLOSITION_TARGET_GRAS: = 1            ; XREF: XPLSN:U3/s SHBT+71/s
EXPLOSITION_TARGET_2: = 2               ; XREF: HU:HX/s ID+63/s ...
EXPLOSITION_TARGET_BRIDGE: = 3          ; XREF: ID+D/s CKCHAR:W0/s
EXPLOSITION_TARGET_BUILDING: = 4        ; XREF: ID+11/s CKCHAR+6D/s
EXPLOSITION_TARGET_SKYSCRAPER: = 5      ; XREF: ID+15/s CKCHAR+8D/s
EXPLOSITION_TARGET_EMPTY_ROAD: = 6      ; XREF: ID+19/s X5/s
EXPLOSITION_TARGET_BOAT: = 7            ; XREF: ID+1D/s
                                        ; X8__HIT_BOAT_TR+17/s ...
EXPLOSITION_TARGET_RUNWAY_PLANE: = 8    ; XREF: ID+21/s
                                        ; Y7__HIT_RW_PLANE_TR+11/s
EXPLOSITION_TARGET_AIRPORT_HANGAR: = 9  ; XREF: ID+25/s Z3+63/s
EXPLOSITION_TARGET_10: = 10             ; XREF: ID+29/s Z3:_4/s
EXPLOSITION_TARGET_11: = 11
EXPLOSITION_TARGET_12: = 12
EXPLOSITION_TARGET_13: = 13
EXPLOSITION_TARGET_14: = 14
EXPLOSITION_TARGET_15: = 15             ; XREF: ID+2D/s Z3+3D/s

; ---------------------------------------------------------------------------

; enum PRIMARY_TARGET_SUBTYPE, width 1 byte
PRIMARY_TARGET_SUBTYPE_0: = 0
PRIMARY_TARGET_SUBTYPE_BUILDING: = 1    ; XREF: QN+C7/s CKCHAR+58/s
PRIMARY_TARGET_SUBTYPE_SKYSCRAPER: = 2  ; XREF: BLDG+18E/s CKCHAR+78/s
PRIMARY_TARGET_SUBTYPE_BRIDGE: = 3      ; XREF: DRBR__DRAW_BRIDGE+7B/s
                                        ; CKCHAR+A0/s

; ---------------------------------------------------------------------------

; enum UNKNOWNS_STATE, width 1 byte
UNKNOWNS_STATE_0: = 0
UNKNOWNS_STATE_1: = 1
UNKNOWNS_STATE_2: = 2                   ; XREF: L6+3/s L6+42/s
UNKNOWNS_STATE_3: = 3                   ; XREF: DRP23+13/s DRP23+72/s ...
UNKNOWNS_STATE_4: = 4                   ; XREF: DRP23+17/s DRP23+99/s ...
UNKNOWNS_STATE_5: = 5                   ; XREF: PLBCK+1C/s L6+F/s ...
UNKNOWNS_STATE_6: = 6                   ; XREF: DRP23+F/s
                                        ; DRBR__DRAW_BRIDGE+177/s
UNKNOWNS_STATE_7: = 7                   ; XREF: PLFWD+11/s KV/s
UNKNOWNS_STATE_8: = 8                   ; XREF: PLFWD+15/s
UNKNOWNS_STATE_9: = 9
UNKNOWNS_STATE_10: = 10                 ; XREF: PLFWD+9/s
UNKNOWNS_STATE_11: = 11                 ; XREF: PLFWD+D/s PLFWD+DA/s

;
; +-------------------------------------------------------------------------+
; |      This file was generated by The Interactive Disassembler (IDA)      |
; |           Copyright (c) 2021 Hex-Rays, <support@hex-rays.com>           |
; |                      License info: 48-3051-7314-20                      |
; |                       Markus Fritze, personal use                       |
; +-------------------------------------------------------------------------+
;
; Input SHA256 : 8568B6B1AF5F74D6DB88B1FCFB576B06F31FE1F930646E7A65D41C0313CF620D
; Input MD5    : 1D772C7FDBD42E633EA7805A065EC2C8
; Input CRC32  : 37B533A8


; ; Processor:        M6502
; ; Target assembler: SVENSON ELECTRONICS 6502/65C02 ASSEMBLER - V.1.0 - MAY, 1988

; ===========================================================================

; Segment type: Regular
                ;.segment ZEROPAGE
                .BYTE 0,0 ; (uninited)
CASINI:         .BYTE 0,0 ; (uninited)  ; DATA XREF: RESET+2↓w
                                        ; RESET+6↓w
                                        ; CASSETTE INIT LOCATION
                .BYTE 0,0,0,0,0 ; (uninited)
BOOT?:          .BYTE 0 ; (uninited)    ; DATA XREF: RESET+32↓w
                                        ; SUCCESSFUL BOOT FLAG
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
RTCLOK:         .BYTE 0,0,0 ; (uninited) ; DATA XREF: RESET+1AB↓w
                                        ; PAUSE+19↓r ...
                                        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
ATRACT:         .BYTE 0 ; (uninited)    ; DATA XREF: EB+29↓w SRT+36↓w ...
                                        ; ATRACT FLAG
byte_4E:        .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0 ; (uninited)
VV1:            .BYTE 0,0 ; (uninited)  ; DATA XREF: PLAY_IT+F↓w
                                        ; PLAY_NOTE+12↓r ...
                                        ; Sound: Voice 1 Music Playback Note Ptr
VV2:            .BYTE 0,0 ; (uninited)  ; DATA XREF: PLAY_IT+17↓w
                                        ; PLAY_NOTE+7E↓r ...
                                        ; Sound: Voice 2 Music Playback Note Ptr
VV3:            .BYTE 0,0 ; (uninited)  ; DATA XREF: PLAY_IT+1F↓w
                                        ; PLAY_NOTE+E8↓r ...
                                        ; Sound: Voice 3 Music Playback Note Ptr
ADR1:           .BYTE 0,0 ; (uninited)  ; DATA XREF: GET_AUDF+A↓w
                                        ; GET_AUDF+1D↓r ...
                                        ; Sound: temp addr for sound frequency calculation
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
; end of 'ZEROPAGE'

; Zero-page variables for Blue Max
; ===========================================================================

; Segment type: Uninitialized
                ;.segment VARS_ZP
                * =  $B0
TEMP_B0:        .BYTE 0 ; (uninited)    ; DATA XREF: TURN+157↓w
                                        ; TURN+15C↓w ...
byte_B1:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+D1↓w
                                        ; COLM02+40↓w ...
byte_B2:        .BYTE 0 ; (uninited)    ; DATA XREF: EB+14C↓w BLDG↓r ...
                .BYTE 0 ; (uninited)
byte_B4:        .BYTE 0 ; (uninited)    ; DATA XREF: BLDG+8C↓w
                                        ; BLDG:loc_3048↓w ...
SKYSCRAPER_TILE_OFFSET:.BYTE 0 ; (uninited) ; DATA XREF: BLDG:loc_3032↓w
                                        ; BLDG+AD↓r ...
byte_B6:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1E7↓w
                                        ; EB+1D↓w ...
CURRENT_GAME_PHASE:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1C8↓w
                                        ; EB+14E↓w ...
GAME_PHASE_ROWS:.BYTE 0 ; (uninited)    ; DATA XREF: EB+145↓w B7↓r ...
                                        ; Length of a game phase in remaining rows
byte_B9:        .BYTE 0 ; (uninited)    ; DATA XREF: BLDGL:ZF↓r
                                        ; BLDGL+4B↓w ...
byte_BA:        .BYTE 0 ; (uninited)    ; DATA XREF: B7+86↓w ZE:YG↓r ...
byte_BB:        .BYTE 0 ; (uninited)    ; DATA XREF: ZE+3A↓r ZE+CB↓r ...
byte_BC:        .BYTE 0 ; (uninited)    ; DATA XREF: XYZ+5↓r END+10↓r ...
byte_BD:        .BYTE 0 ; (uninited)    ; DATA XREF: ZE+C3↓r END+6↓r ...
WIND_DURATION:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1A3↓w
                                        ; CKLAND+48↓w ...
                                        ; Duration during which Wind is in effect
byte_BF:        .BYTE 0 ; (uninited)    ; DATA XREF: DRBT__DRAW_BOAT+41↓w
                                        ; DRBR__DRAW_BRIDGE+98↓w ...
ENEMY_X_POS:    .BYTE 0 ; (uninited)    ; DATA XREF: DRP23+58↓w
                                        ; DRP23+7F↓w ...
                                        ; Enemy X position
ENEMY_Y_POS:    .BYTE 0 ; (uninited)    ; DATA XREF: DG+2↓r DRP23+2D↓w ...
                                        ; Enemy Y position
byte_C2:        .BYTE 0 ; (uninited)    ; DATA XREF: COLP02+16↓r
                                        ; PLFWD+43↓w ...
                .BYTE 0 ; (uninited)
byte_C4:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+125↓w
                                        ; DRP23+2F↓r ...
byte_C5:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+239↓w
                                        ; CKCOL↓r ...
                ; 0 .BYTE uninited & unexplored
PREVIOUS_TILE_ROW_PTR:.BYTE 0,0 ; (uninited) ; DATA XREF: V8+14↓w
                                        ; V8+19↓w ...
                .BYTE 0 ; (uninited)
PLANE_HIT_FLASH_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1B1↓w
                                        ; COLM20+2F↓w ...
                                        ; !=0 => counter to signal damage via flashing
byte_CB:        .BYTE 0,0,0,0,0,0,0,0,0 ; (uninited)
TEMP_ADR:       .BYTE 0,0 ; (uninited)  ; DATA XREF: AFP+24↓w
                                        ; XPLSN:ADB↓r ...
                ; 0 .BYTE uninited & unexplored
STICK0_COPY:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+179↓w
                                        ; COMMON+3↓w ...
                                        ; JOYSTICK 0 copy
STRIG0_COPY:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+237↓w
                                        ; COMMON+8↓w ...
                                        ; 0=: joystick button is pressed, !=0: button is not pressed
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0 ; (uninited)
DISABLE_MAP_GENERATION:.BYTE 0 ; (uninited) ; DATA XREF: RESET+61↓w
                                        ; RESET:B↓r ...
                                        ; !=0 Disable generation of new map data. Reset during VBL scrolling
SCROLL_OFFSET_F1:.BYTE 0 ; (uninited)   ; DATA XREF: RESET+65↓w
                                        ; RESET+73↓r ...
                                        ; HSCROL and VSCROL shadow during gameplay
VBL_NEXT_ROW_PTR:.BYTE 0,0 ; (uninited) ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+64↓w
                                        ; DRAW:N↓w ...
                                        ; new row to be draw. Set inside the VBL.
PLANE_HORI_POS: .BYTE 0 ; (uninited)    ; DATA XREF: RESET+226↓w CE↓r ...
                                        ; Horizontal Position of the Plane
PLANE_VERT_POS: .BYTE 0 ; (uninited)    ; DATA XREF: RESET+230↓w
                                        ; DRP1↓r ...
                                        ; Vertical Position of the Plane
PLANE_VERT_SHADOW_POS:.BYTE 0 ; (uninited) ; DATA XREF: RESET+246↓w
                                        ; SHDW_SUB+2↓r ...
                                        ; Vertical Position of the Plane Shadow
CRASH_EXPLOSION_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: TURN+11C↓w
                                        ; TURN+133↓w ...
                                        ; Duration counter for the plane explosion
RIVER_BRIDGE_ROW:.BYTE 0 ; (uninited)   ; DATA XREF: RESET+289↓w
                                        ; EB+9↓w ...
PLANE_BULLET_Y_POS:.BYTE 0 ; (uninited) ; DATA XREF: RESET+119↓w
                                        ; TURN+8A↓r ...
                                        ; Y-Position of the current bullet from the plane
byte_FA:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+11B↓w
                                        ; TURN+DC↓w ...
CURRENT_TILE_ROW_PTR:.BYTE 0,0 ; (uninited) ; DATA XREF: XPLSN+15↓w
                                        ; XPLSN+33↓r ...
byte_FD:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1E2↓w
                                        ; TURN+145↓r ...
byte_FE:        .BYTE 0 ; (uninited)    ; DATA XREF: RESET+129↓w
                                        ; VBIR__DEFERRED_VBL_DRAW:J↓r ...
RIVER_RIGHT_X_POS:.BYTE 0 ; (uninited)  ; DATA XREF: RESET+205↓w
                                        ; DRAW:P↓r ...
; end of 'VARS_ZP'                      ; Right position of the river

; ===========================================================================

; Segment type: Regular
                ;.segment STACK
                * =  $100
STACK:          .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; PAGE 1 - STACK
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
; end of 'STACK'

; ===========================================================================

; Segment type: Regular
                ;.segment LOWMEM
                * =  $200
VDSLST:         .BYTE 0,0 ; (uninited)  ; DATA XREF: RESET+EA↓w
                                        ; CNSL__CONSOLE+71↓w ...
                                        ; DISPLAY LIST NMI VECTOR
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0 ; (uninited)
CDTMV1:         .BYTE 0,0 ; (uninited)  ; DATA XREF: CNSL__CONSOLE+13↓w
                                        ; CNSL__CONSOLE+29↓w ...
                                        ; COUNT DOWN TIMER 1 - used for music playback
                .BYTE 0,0 ; (uninited)
CDTMV3:         .BYTE 0,0 ; (uninited)  ; DATA XREF: TIMER:L↓r
                                        ; COUNT DOWN TIMER 3
                .BYTE 0,0,0,0 ; (uninited)
VVBLKI:         .BYTE 0,0 ; (uninited)  ; IMMEDIATE VERTICAL BLANK NMI VECTOR
VVBLKD:         .BYTE 0,0 ; (uninited)  ; DATA XREF: PBMB+E↓r
                                        ; PBMB+8A↓r ...
                                        ; DEFERRED VERTICAL BLANK NMI VECTOR
CDTMA1:         .BYTE 0,0 ; (uninited)  ; DATA XREF: EB+87↓w
                                        ; PLAY_IT+27↓w ...
                                        ; COUNT DOWN TIMER 1 JSR ADDRESS
                .BYTE 0,0,0,0,0,0,0 ; (uninited)
SDMCTL:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+27↓w
                                        ; RESET+45↓w ...
                                        ; SAVE DMACTL REGISTER
SDLSTL:         .BYTE 0 ; (uninited)    ; DATA XREF: BOOT_CONTINUE+D↓w
                                        ; RESET+BF↓w ...
                                        ; SAVE DISPLAY LIST LOW BYTE
SDLSTH:         .BYTE 0 ; (uninited)    ; DATA XREF: BOOT_CONTINUE+12↓w
                                        ; RESET+C7↓w ...
                                        ; SAVE DISPLAY LIST HI BYTE
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0 ; (uninited)
COLDST:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1E↓w
                                        ; COLDSTART FLAG (1=IN MIDDLE OF COLDSTART)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0 ; (uninited)
GPRIOR:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+23B↓w
                                        ; PRIOR__+2E↓w ...
                                        ; GLOBAL PRIORITY CELL
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
STICK0:         .BYTE 0 ; (uninited)    ; DATA XREF: COMMON↓r
                                        ; SPD__SPEED_CHANGE+5↓r ...
                                        ; JOYSTICK 0 RAM CELL
                .BYTE 0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
STRIG0:         .BYTE 0 ; (uninited)    ; DATA XREF: COMMON+5↓r
                                        ; TRIGC__TRIGGER_COUNT↓r
                                        ; JOYSTICK TRIGGER 0
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
PCOLR0:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+217↓w
                                        ; TURN+13C↓w ...
                                        ; P0 COLOR
PCOLR1:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1F5↓w
                                        ; SHCOL+10↓w ...
                                        ; P1 COLOR
PCOLR2:         .BYTE 0 ; (uninited)    ; DATA XREF: TURN+14B↓w SK+5↓w ...
                                        ; P2 COLOR
PCOLP3:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1F2↓w
                                        ; P3 COLOR
COLOR0:         .BYTE 0 ; (uninited)    ; DATA XREF: BOOT_CONTINUE+5↓w
                                        ; RESET+D3↓w ...
                                        ; COLOR 0
COLOR1:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+D8↓w
                                        ; CKCOL:L3↓r ...
COLOR2:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+E0↓w
                                        ; B7+3E↓w ...
COLOR3:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+25E↓w
                                        ; B7+B9↓w ...
COLOR4:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1F8↓w
                                        ; B7+39↓w ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
CHBAS:          .BYTE 0 ; (uninited)    ; DATA XREF: RESET+CC↓w
                                        ; CNSL__CONSOLE+31↓w
                                        ; CHBAS REGISTER RAM
                .BYTE 0,0,0,0,0,0,0 ; (uninited)
CH:             .BYTE 0 ; (uninited)    ; DATA XREF: RESET+137↓w
                                        ; EB+EB↓w ...
                                        ; GLOBAL VARIABLE FOR KEYBOARD
                .BYTE 0,0,0 ; (uninited)
DCB:            DCB_STRUCT <?>          ; DATA XREF: READ_BLOCK+5↓w
                                        ; DEVICE CONTROL BLOCK
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0 ; (uninited)
; end of 'LOWMEM'

; Variables for Blue Max
; ===========================================================================

; Segment type: Uninitialized
                ;.segment VARS
                * =  $600
MAP_RIVER_DIR:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+271↓w
                                        ; DRAW:AY↓r ...
                                        ; Direction of the river
MAP_RIVER_LENGTH:.BYTE 0 ; (uninited)   ; DATA XREF: RESET+20F↓w
                                        ; DRAW+26↓w ...
                                        ; Length of a certain river feature to continue (straight, turn left/right)
byte_602:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1FD↓w
                                        ; DRAW+46↓r ...
byte_603:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+269↓w
                                        ; DRAW+43↓w ...
VBL_DOWN_COUNTER:.BYTE 0 ; (uninited)   ; DATA XREF: VBIR__DEFERRED_VBL_DRAW↓w
                                        ; VBIR__DEFERRED_VBL_DRAW+3↓r ...
                                        ; VBL down counter, running countinously during the game
PROPELLER_PHASE:.BYTE 0 ; (uninited)    ; DATA XREF: RESET+16F↓w
                                        ; PROP↓w ...
                                        ; Propeller phase (typically 0-4)
byte_606:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+23E↓w
                                        ; DRAW+B2↓r ...
TURN_STICK0:    .BYTE 0 ; (uninited)    ; DATA XREF: TURN+2↓r
                                        ; TURN:BC↓w ...
                                        ; STICK0 copy for the TURN routine
byte_608:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+261↓w
                                        ; JOYST:PN↓w ...
CAN_LAND_FLAG:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+207↓w
                                        ; CKLAND↓r ...
                                        ; =0 => plane can land (runway reached)
TREE_POS_BUF:   .BYTE 0,0,0,0,0,0 ; (uninited) ; DATA XREF: RESET:EU↓t
                                        ; DRTR__DRAW_TREE:EO↓t ...
                                        ; Position of trees
byte_610:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+241↓w
                                        ; DRAW+51↓r ...
TREE_PLANT_MIN_X:.BYTE 0 ; (uninited)   ; DATA XREF: DRTR__DRAW_TREE:ET↓w
                                        ; DRTR__DRAW_TREE+79↓r
                                        ; min. X position for planing trees in a row
TREE_PLANT_MAX_X:.BYTE 0 ; (uninited)   ; DATA XREF: DRTR__DRAW_TREE+54↓w
                                        ; DRTR__DRAW_TREE+74↓r
                                        ; max. X position for planing trees in a row
RUNWAY_POS_Y_INDEX:.BYTE 0 ; (uninited) ; DATA XREF: RESET+122↓w
                                        ; DRUN__DRAW_RUNWAY:LY↓r ...
                                        ; Runway is 45 characters long, this is an index used for drawing the correct line
                .BYTE 0,0 ; (uninited)
TREE_PLANT_TRY_COUNT:.BYTE 0 ; (uninited)
                                        ; DATA XREF: DRTR__DRAW_TREE+63↓w
                                        ; DRTR__DRAW_TREE:EF↓w
                                        ; Try up to 25 times to find a position for a tree in a row
byte_617:       .BYTE 0 ; (uninited)    ; DATA XREF: DRBR__DRAW_BRIDGE+B5↓w
                                        ; DRBR__DRAW_BRIDGE+111↓r
byte_618:       .BYTE 0 ; (uninited)    ; DATA XREF: DRBR__DRAW_BRIDGE+C3↓w
                                        ; DRBR__DRAW_BRIDGE+117↓r
byte_619:       .BYTE 0 ; (uninited)    ; DATA XREF: DRBR__DRAW_BRIDGE+EC↓w
                                        ; DRBR__DRAW_BRIDGE+13C↓r
byte_61A:       .BYTE 0 ; (uninited)    ; DATA XREF: DRBR__DRAW_BRIDGE+FA↓w
                                        ; DRBR__DRAW_BRIDGE+140↓r
byte_61B:       .BYTE 0 ; (uninited)    ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+38↓w
                                        ; DRBR__DRAW_BRIDGE+29↓r
RIVER_BOAT_ROW_FLAG:.BYTE 0 ; (uninited) ; DATA XREF: RESET+116↓w
                                        ; DRBT__DRAW_BOAT:GV↓r ...
                                        ; !=0 boat top row drawn, ==0 boat bottom row drawn
RIVER_BOAT_NEXT_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+132↓w
                                        ; DRBT__DRAW_BOAT+A↓r ...
                                        ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
PLANE_BULLET_X_POS:.BYTE 0 ; (uninited) ; DATA XREF: TRIG__TRIGGER_MACHINE_GUN+26↓w
                                        ; TRIG__TRIGGER_MACHINE_GUN+3F↓r ...
                                        ; X-Position of the current bullet from the plane
byte_61F:       .BYTE 0 ; (uninited)    ; DATA XREF: PC+15↓w BOMB:TJ↓r ...
byte_620:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+DD↓w
                                        ; TRIG__TRIGGER_MACHINE_GUN+1C↓r ...
VAR_EXPLOSION_X_POS:.BYTE 0 ; (uninited) ; DATA XREF: XPLSN+10↓w
                                        ; ID+5↓r ...
EXPLOSION_TILE_ANIMATION:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1A0↓w
                                        ; AFP+17↓w ...
byte_623:       .BYTE 0 ; (uninited)    ; DATA XREF: TURN+D7↓w PC+7↓w ...
VAR_EXPLOSION_TARGET:.BYTE 0 ; (uninited) ; DATA XREF: XPLSN+70↓w
                                        ; Y8+2↓w ...
                .BYTE 0,0,0,0,0 ; (uninited)
VBL_DRAW_DOWN_COUNTER:.BYTE 0 ; (uninited)
                                        ; DATA XREF: VBIR__DEFERRED_VBL_DRAW:SCROL↓r
                                        ; VBIR__DEFERRED_VBL_DRAW+11↓w ...
                                        ; VBL: 30Hz down counter whenever the level scrolls a pixel
MSHIP_VAR_62B:  .BYTE 0 ; (uninited)    ; DATA XREF: SHIP+68↓w
                                        ; SHIP:I6↓w ...
byte_62C:       .BYTE 0 ; (uninited)    ; DATA XREF: DRUN__DRAW_RUNWAY+A↓w
                                        ; DRUN__DRAW_RUNWAY+D↓r
GRAVITY_COUNT:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1E4↓w
                                        ; RESET+214↓w ...
                                        ; When enabled, this counter pulls the plane down every 40 ticks
                ; 0 .BYTE uninited & unexplored
byte_62F:       .BYTE 0 ; (uninited)    ; DATA XREF: PLFWD+5F↓w
                                        ; PLFWD:LN↓w ...
                .BYTE 0,0,0,0,0 ; (uninited)
SPEED_DELAY_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+264↓w
                                        ; SPD__SPEED_CHANGE:KM↓w ...
                                        ; Limit speed increment/decrement changes with this counter
byte_636:       .BYTE 0 ; (uninited)    ; DATA XREF: PLFWD:loc_21F2↓w
                                        ; PLFWD:loc_21FB↓r ...
byte_637:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+26E↓w
                                        ; PLFWD+C2↓w ...
byte_638:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+21↓w
                                        ; DRTNK+13↓r ...
byte_639:       .BYTE 0 ; (uninited)    ; DATA XREF: TURN+E3↓w
                                        ; BOMB:AFV↓w ...
FUEL_TIMER:     .BYTE 0 ; (uninited)    ; DATA XREF: RESET+20A↓w
                                        ; KMKZ:NC↓w ...
                .BYTE 0,0,0,0 ; (uninited)
IS_DEMO_MODE:   .BYTE 0 ; (uninited)    ; DATA XREF: RESET+145↓w
                                        ; EB+E8↓w ...
                                        ; 0=Demo Mode active
VAR_UNKNOWN_STATE:.BYTE 0 ; (uninited)  ; DATA XREF: DRP23+C↓r
                                        ; DRP23+74↓w ...
AUDC1_SHADOW:   .BYTE 0 ; (uninited)    ; DATA XREF: EB+91↓w KMKZ+A↓r ...
AUDIO2_DROPSND_FREQ:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1B3↓w
                                        ; PC+22↓w ...
byte_643:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+274↓w
                                        ; KMKZ↓w ...
AUDIO3_SOUND_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1EC↓w
                                        ; XSND↓r ...
AUDIO3_COUNTER_TRIGGER:.BYTE 0 ; (uninited) ; DATA XREF: XSND+18↓r
                                        ; XXX↓w
AUDIO3_CONTROL: .BYTE 0 ; (uninited)    ; DATA XREF: XSND+1D↓r
                                        ; XSND+2E↓w ...
AUDIO3_CONTROL_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: XSND+24↓w
                                        ; XSND+2B↓w ...
PLANE_GUN_SOUND_TIMER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1EF↓w
                                        ; TRIG__TRIGGER_MACHINE_GUN+37↓w ...
                                        ; Timer for the repeating gun sound from the plane
AUDIO2_DROPSND_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: DRPSND↓w
                                        ; DRPSND+3↓r
PLANE_GUN_SOUND_TIMER_2:.BYTE 0 ; (uninited) ; DATA XREF: GUNSND+5↓w
                                        ; GUNSND+8↓r
                                        ; Timer 2 for the repeating gun sound from the plane
PLANE_GUN_SOUND_TIMER_3:.BYTE 0 ; (uninited) ; DATA XREF: GUNSND+1B↓w
                                        ; GUNSND+1E↓r
                                        ; Timer 3 for the repeating gun sound from the plane
RUN_SOUND_COUNTER:.BYTE 0 ; (uninited)  ; DATA XREF: RUNSND↓r
                                        ; RUNSND+5↓w ...
                                        ; 0=Run sound off, otherwise a count down timer for the effect
AUDIO2_DURATION_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+200↓w
                                        ; PC+2C↓w ...
AUDIO2_FREQ_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: Y8+7↓w
                                        ; SPLASH+1A↓w ...
AUDIO2_EFFECT_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: Y8+F↓w
                                        ; SPLASH:QI↓w ...
byte_650:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+16A↓w
                                        ; DRTNK:QL↓r ...
BUILDING_ROW_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+109↓w
                                        ; DRTNK:QM↓r ...
BUILDING_COLOR_OFFSET:.BYTE 0 ; (uninited) ; DATA XREF: QS+12↓w
                                        ; QS+18↓w ...
BUILDING_X_START_POS:.BYTE 0 ; (uninited) ; DATA XREF: QN+54↓w QN+7D↓r ...
byte_654:       .BYTE 0 ; (uninited)    ; DATA XREF: CKCOL+38↓w
                                        ; TURN+9D↓r ...
byte_655:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+142↓w
                                        ; TURN+B7↓r ...
byte_656:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1DC↓w
                                        ; TRIGB↓r ...
byte_657:       .BYTE 0 ; (uninited)    ; DATA XREF: TRIGB+25↓w
                                        ; TRIGB+3F↓r ...
byte_658:       .BYTE 0 ; (uninited)    ; DATA XREF: COLM20+11↓w
                                        ; COLM20+18↓r
WORKING_PARTS:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+25B↓w
                                        ; REFUEL:SB↓r ...
                                        ; # of working part (4): fuel, bomb, maneuverabiity, gun
byte_65A:       .BYTE 0 ; (uninited)    ; DATA XREF: JOYST+5↓w
                                        ; JOYST+8↓r
RUNWAY_POS_X_INDEX:.BYTE 0 ; (uninited) ; DATA XREF: RESET+14A↓w
                                        ; DRUN__DRAW_RUNWAY+96↓w ...
                                        ; Right position where the runway starts
MISSLE_3_X_POS2:.BYTE 0 ; (uninited)    ; DATA XREF: A2+2↓w
                                        ; BRGPOS+28↓w ...
byte_65D:       .BYTE 0 ; (uninited)    ; DATA XREF: A2+F↓w
                                        ; BRGPOS:loc_2AE4↓w ...
byte_65E:       .BYTE 0 ; (uninited)    ; DATA XREF: BRGPOS+1F↓w
                                        ; BRGPOS+22↓r ...
byte_65F:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1D0↓w
                                        ; FBRGN+4↓r ...
byte_660:       .BYTE 0 ; (uninited)    ; DATA XREF: ZZ+1D↓w
                                        ; FTNKGN:SW↓r ...
byte_661:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1CA↓w
                                        ; DRBT__DRAW_BOAT+43↓w ...
byte_662:       .BYTE 0 ; (uninited)    ; DATA XREF: FTNKGN-C1C↓w
                                        ; FTNKGN:SN↓w
MISSLE_3_X_POS: .BYTE 0 ; (uninited)    ; DATA XREF: ZZ+8↓w
                                        ; FTNKGN-C57↓w ...
byte_664:       .BYTE 0 ; (uninited)    ; DATA XREF: A2+A↓w
                                        ; BRGPOS:loc_2ADB↓r ...
                .BYTE 0 ; (uninited)
byte_666:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+175↓w
                                        ; EB+119↓w ...
byte_667:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+180↓w
                                        ; EB+111↓w ...
byte_668:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+12B↓w DROAD↓r ...
byte_669:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+11C↓w
                                        ; DROAD:TM↓r ...
ROAD_RIGHT_X_POS:.BYTE 0 ; (uninited)   ; DATA XREF: EB+126↓w
                                        ; ENRUN:WH↓r ...
                                        ; right X position where the road starts
ENEMY_RUNWAY_START:.BYTE 0 ; (uninited) ; DATA XREF: EB+12E↓w
                                        ; ENRUN-4↓w ...
                                        ; How many lines till the enemy runway will appear
ENEMY_RUNWAY_LENGTH:.BYTE 0 ; (uninited) ; DATA XREF: EB+133↓w
                                        ; ENRUN-19↓w ...
                                        ; Length/current line of the enemy runway (default length=36)
ENEMY_RUNWAY_PLANE_FLAG:.BYTE 0 ; (uninited) ; DATA XREF: EB+13B↓w
                                        ; ENRUN+4D↓r ...
DL_IRQ_BACKGROUND_COLOR:.BYTE 0 ; (uninited) ; DATA XREF: RESET+11D↓w
                                        ; TURN+139↓w ...
                                        ; Background color set in the DL IRQ
PCOLR2_FLASH_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: COLM02+52↓w
                                        ; XP2:US↓w ...
                                        ; Duration for PCOLR2 flash (enemy got hit)
byte_670:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDG:loc_2FF2↓w
                                        ; BLDG+62↓r ...
byte_671:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDG+1E↓w
                                        ; BLDG+3A↓r ...
byte_672:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDG:loc_2FFE↓w
                                        ; BLDG+A2↓r ...
byte_673:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDG+5F↓w
                                        ; BLDG+128↓r
byte_674:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+136↓w
                                        ; BLDG:loc_2FB6↓r ...
byte_675:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDG+93↓w
                                        ; BLDG:loc_30EA↓w ...
byte_676:       .BYTE 0 ; (uninited)    ; DATA XREF: QS+9↓w QN+18↓r ...
byte_677:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+13E↓w B7:WY↓w ...
                ; 0 .BYTE uninited & unexplored
DIRECTION_A:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+A↓w
                                        ; JOYST+26↓r ...
byte_67A:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDGL:ZH↓r
                                        ; BLDGL+6C↓w ...
byte_67B:       .BYTE 0 ; (uninited)    ; DATA XREF: ZE+12↓w YI↓r ...
byte_67C:       .BYTE 0 ; (uninited)    ; DATA XREF: ZE+9F↓r ZE+F6↓r ...
byte_67D:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+67↓w ZE↓r ...
                .BYTE 0,0 ; (uninited)
DIRECTION_B:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+F↓w
                                        ; JOYST+11↓r ...
byte_681:       .BYTE 0,0,0 ; (uninited) ; DATA XREF: BLDGL:ZG↓r
                                        ; BLDGL+5B↓w ...
byte_684:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+64↓w ZE+1F↓r ...
byte_685:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+114↓w
                                        ; PRIOR__↓r ...
byte_686:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+141↓w
                                        ; BLDGL+15↓r ...
byte_687:       .BYTE 0,0,0 ; (uninited) ; DATA XREF: BLDGL+68↓w
byte_68A:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+6D↓w
                                        ; BLDGL+24↓r
byte_68B:       .BYTE 0,0,0 ; (uninited) ; DATA XREF: BLDGL+57↓w
byte_68E:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+70↓w
                                        ; BLDGL+32↓r
byte_68F:       .BYTE 0 ; (uninited)    ; DATA XREF: BLDGL+47↓w
byte_690:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+88↓w
                .BYTE 0,0,0 ; (uninited)
byte_694:       .BYTE 0 ; (uninited)    ; DATA XREF: B7+6A↓w
                                        ; BLDGL+3A↓w ...
WIND_ENABLED:   .BYTE 0 ; (uninited)    ; DATA XREF: WIND+2A↓w
                                        ; WIND:ZR↓w ...
                                        ; 50% chance that wind is in effect
VAR_MISSLE_3_STATE:.BYTE 0 ; (uninited) ; DATA XREF: ZZ:A1↓w
                                        ; FTNKGN:SM↓r ...
MSHIP_BULLET_X_POS:.BYTE 0 ; (uninited) ; DATA XREF: B3+2↓w
                                        ; M2GPOS+1F↓r ...
byte_698:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1C2↓w
                                        ; B3+5↓w ...
byte_699:       .BYTE 0 ; (uninited)    ; DATA XREF: B3+A↓w
                                        ; M2GPOS:B6↓r ...
byte_69A:       .BYTE 0 ; (uninited)    ; DATA XREF: B3+F↓w
                                        ; M2GPOS:B9↓w ...
byte_69B:       .BYTE 0 ; (uninited)    ; DATA XREF: M2GPOS+26↓w
                                        ; M2GPOS+29↓r
ENEMY_BULLET_Y_POS:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1C5↓w
                                        ; FM2GN↓r ...
                                        ; Y position of an enemy bullet (0=none)
ENEMY_BULLET_MOVEMENT:.BYTE 0 ; (uninited) ; DATA XREF: FM2GN:C5↓w
                                        ; FM2GN:C2↓r
                                        ; Movement pattern (state machine) for the bullet
ENEMY_BULLET_X_POS:.BYTE 0 ; (uninited) ; DATA XREF: FM2GN+44↓w
                                        ; FM2GN+6B↓w ...
                                        ; X position of an enemy bullet (0=none)
byte_69F:       .BYTE 0 ; (uninited)    ; DATA XREF: FM2GN+59↓w
                                        ; FM2GN:C9↓r ...
byte_6A0:       .BYTE 0 ; (uninited)    ; DATA XREF: FM2GN+A6↓w
                                        ; FM2GN:D0↓w
byte_6A1:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+14D↓w
                                        ; TNK:E1↓r ...
byte_6A2:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1A8↓w
                                        ; TNK:E9↓r ...
byte_6A3:       .BYTE 0 ; (uninited)    ; DATA XREF: QN+75↓w
                                        ; ENRUN+101↓w ...
byte_6A4:       .BYTE 0 ; (uninited)    ; DATA XREF: LINE+33↓w
                                        ; LINE+36↓r ...
ENEMY_TURN_MODE:.BYTE 0 ; (uninited)    ; DATA XREF: PLFWD:loc_2123↓r
                                        ; PLFWD+BD↓r ...
                                        ; 0=none, 1=left, 2=right, >2=any
byte_6A6:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1B6↓w
                                        ; L6+32↓r ...
byte_6A7:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1BC↓w
                                        ; EB+3F↓w ...
byte_6A8:       .BYTE 0 ; (uninited)    ; DATA XREF: PLBCK+8↓r L6+2C↓w ...
SIZEM_SHADOW:   .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1A5↓w
                                        ; SR+16↓r ...
                                        ; Shadow Register for SIZEM
byte_6AA:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+160↓w
                                        ; TRGT+2C↓r ...
byte_6AB:       .BYTE 0 ; (uninited)    ; DATA XREF: CKCHAR+5F↓r
                                        ; CKCHAR+7F↓r ...
PRIMARY_TARGETS_HIT:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1BF↓w
                                        ; EB+F3↓r ...
                                        ; Number of primary targets hit
VAR_PRIMARY_TARGET_SUBTYPE:.BYTE 0 ; (uninited) ; DATA XREF: RESET+1D9↓w
                                        ; DRBR__DRAW_BRIDGE+7D↓w ...
byte_6AE:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1E9↓w
                                        ; EB:V0↓w ...
AUDIO4_GUN_SND_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: RESET+18E↓w
                                        ; ZZ+22↓w ...
byte_6B0:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+13F↓w
                                        ; EB+E5↓w ...
byte_6B1:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+286↓w
                                        ; GUNC:TB↓w ...
TEMP_NEXT_ROW_PTR:.BYTE 0,0 ; (uninited) ; DATA XREF: XPLSN+1E↓w
                                        ; DNXP+7↓r ...
TEMP_PREVIOUS_ROW_PTR:.BYTE 0,0 ; (uninited) ; DATA XREF: XPLSN+2A↓w
                                        ; UPXP↓r ...
byte_6B6:       .BYTE 0 ; (uninited)    ; DATA XREF: CKLAND+10↓w
                                        ; CKLAND+4D↓w ...
byte_6B7:       .BYTE 0 ; (uninited)    ; DATA XREF: FLSH:_1↓w
                                        ; FLSH+C↓r
                ; 0 .BYTE uninited & unexplored
COLOR_FLASHING: .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1CD↓w
                                        ; TURN+84↓w ...
                                        ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
SAVED_COLOR0_3: .BYTE 0,0,0,0 ; (uninited) ; DATA XREF: B7+C4↓w
                                        ; B7+DB↓w ...
QUAKE_ANIMATION_COUNTER:.BYTE 0 ; (uninited) ; DATA XREF: EB+D7↓w
                                        ; QUAKE↓r ...
                                        ; Quake, shake via the scroll register, timer
CAPITAL_Y_POS:  .BYTE 0 ; (uninited)    ; DATA XREF: RESET+194↓w
                                        ; CPTL+E↓r ...
                ; 0 .BYTE uninited & unexplored
byte_6C1:       .BYTE 0 ; (uninited)    ; DATA XREF: CPTL+54↓w
                                        ; CPTL+7E↓w
GAME_COMPLETION_MASK:.BYTE 0 ; (uninited) ; DATA XREF: RESET+197↓w
                                        ; STOPL+2A↓r ...
byte_6C3:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+19A↓w
                                        ; AFP+26↓r ...
byte_6C4:       .BYTE 0 ; (uninited)    ; DATA XREF: XCPTL:_1↓w
                                        ; XCPTL+C↓r ...
byte_6C5:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+19D↓w
                                        ; CPTL+8E↓w ...
byte_6C6:       .BYTE 0 ; (uninited)    ; DATA XREF: XCPTL+1D↓r
                                        ; XCPTL+44↓w
REQUIRED_TARGETS:.BYTE 0 ; (uninited)   ; DATA XREF: RESET+256↓w
                                        ; EB+FA↓r ...
                                        ; Number of required primary targets to progress (8 or 9 by random)
DIFF:           DIFF_STRUCT <?>         ; DATA XREF: EB+39↓w EB+4F↓w ...
                                        ; Difficulty for the level
byte_6CF:       .BYTE 0 ; (uninited)    ; DATA XREF: EB+44↓w EB+65↓w ...
                .BYTE 0,0,0,0,0,0 ; (uninited)
byte_6D6:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+172↓w
                                        ; CKCOL+2C↓w ...
                .BYTE 0,0,0,0 ; (uninited)
byte_6DB:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+191↓w
byte_6DC:       .BYTE 0 ; (uninited)    ; DATA XREF: SHIP+5F↓w
                                        ; SHP23:_3↓w
                .BYTE 0 ; (uninited)
RIVER_BOAT_HIT_COUNTER:.BYTE 0 ; (uninited)
                                        ; DATA XREF: DRBT__DRAW_BOAT+63↓w
                                        ; SHBT:_5↓w
                                        ; The boat requires 2 hits to be destroyed
LAST_STRIG0:    .BYTE 0 ; (uninited)    ; DATA XREF: TRIGC__TRIGGER_COUNT+3↓r
                                        ; TRIGC__TRIGGER_COUNT:_1↓w ...
                                        ; Last STRIG0 value (for debouncing)
TRIGGER_COUNT:  .BYTE 0 ; (uninited)    ; DATA XREF: REFUEL+7↓w
                                        ; REFUEL+2C↓r ...
                                        ; Increment with each button/trigger press
                .BYTE 0,0 ; (uninited)
byte_6E3:       .BYTE 0 ; (uninited)    ; DATA XREF: PBMB+4B↓w
                                        ; PBMB:_6↓r
                .BYTE 0,0 ; (uninited)
MODE_GRAVITY_FLAG:.BYTE 0 ; (uninited)  ; DATA XREF: RESET+21↓w
                                        ; GRAV__APPLY_GRAVITY↓r ...
                                        ; Gravity? 0=No, 1=Yes
MODE_LEVEL:     .BYTE 0 ; (uninited)    ; DATA XREF: RESET+24↓w
                                        ; EB+2B↓r ...
                                        ; Level: 0=Novice, 1=Intermediate, 2=Advanced
MENU_OPTION_INDEX_6E8:.BYTE 0 ; (uninited)
                                        ; DATA XREF: CNSL__CONSOLE+3E↓w
                                        ; MENU__CHECK_KEYS:_2↓r ...
                                        ; MENU: currently selected option
MENU_LAST_CONSOL_6E9:.BYTE 0 ; (uninited)
                                        ; DATA XREF: CNSL__CONSOLE:_5↓w
                                        ; MENU__CHECK_KEYS+3↓r ...
                                        ; Last value of CONSOL in the MENU selection
byte_6EA:       .BYTE 0 ; (uninited)    ; DATA XREF: PRIOR__+3D↓w
                                        ; AFB:_1↓r
byte_6EB:       .BYTE 0 ; (uninited)    ; DATA XREF: BOMB:HJ↓w Z3+A↓r ...
AUDIO2_DROPSND_FREQ_SAVED:.BYTE 0 ; (uninited) ; DATA XREF: DRPSND+F↓w
                                        ; Z3+4D↓r
byte_6ED:       .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1DF↓w
                                        ; BOMB+1F↓r ...
                .BYTE 0,0 ; (uninited)
PAUSE_RTCLOK:   .BYTE 0,0 ; (uninited)  ; DATA XREF: PAUSE+1B↓w
                                        ; PAUSE+33↓r ...
                                        ; Saved 2 bytes of the RTCLOK during pause
byte_6F2:       .BYTE 0 ; (uninited)    ; DATA XREF: DRBR__DRAW_BRIDGE+69↓w
                                        ; CKCHAR:U5↓w
DEMO_IS_ACTIVE: .BYTE 0 ; (uninited)    ; DATA XREF: RESET+3F↓w
                                        ; RESET+95↓r ...
                                        ; 0:normal game play, 1=demo mode active
DL_IRQ_COLPF1:  .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+13↓r
                                        ; CNSL__CONSOLE+1B↓w ...
                                        ; COLPF1 color set in the DL IRQ
DEMO_JOY_TIMER: .BYTE 0 ; (uninited)    ; DATA XREF: DJOY__DEMO_JOYSTICK_INPUT:_15↓w
                                        ; DJOY__DEMO_JOYSTICK_INPUT+4F↓w
                                        ; Demo mode: timer for joystick input
DEMO_STICK0:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+17B↓w
                                        ; DJOY__DEMO_JOYSTICK_INPUT:_2↓r ...
                                        ; Demo mode: joystick movement
byte_6F7:       .BYTE 0 ; (uninited)    ; DATA XREF: COMMON+72↓r
                                        ; COMMON+77↓w ...
LOW_SND_FREQ:   .BYTE 0 ; (uninited)    ; DATA XREF: LOW:_3↓r LOW+26↓w ...
                                        ; Sound flag when the plane is low to the ground
byte_6F9:       .BYTE 0 ; (uninited)    ; DATA XREF: ENRUN+22↓w
                                        ; DRUN__DRAW_RUNWAY+12A↓w ...
                .BYTE 0,0,0,0,0 ; (uninited)
SOUND_MUSIC_ACTIVE_6FF:.BYTE 0 ; (uninited) ; DATA XREF: RESET+13C↓w
                                        ; EB+76↓r ...
; end of 'VARS'                         ; Sound: Music playback is active, when != 0

; ===========================================================================

; Segment type: Pure code
                ;.segment TAPE_LOADER
                * =  $700
BOOT_RECORD:    .BYTE 0                 ; DATA XREF: TAPE_LOADER:0702↓o
                                        ; boot flag, copied to DFLAGS
                .BYTE 2                 ; number of sectors the boot record, copied to DBSECT
                .WORD BOOT_RECORD       ; BOOT ADRESS, copied to BOOTAD
                .WORD BOOT_INIT         ; BOOT INIT

; =============== S U B R O U T I N E =======================================

; BOOT CONTINUE

                ; public BOOT_CONTINUE
BOOT_CONTINUE:
                LDX     #4

_COLOR_INIT:                            ; CODE XREF: BOOT_CONTINUE+9↓j
                LDA     COLOR_TABLE,X
                STA     COLOR0,X        ; COLOR 0
                DEX
                BPL     _COLOR_INIT
                LDA     #<DISPLAY_LIST
                STA     SDLSTL          ; SAVE DISPLAY LIST LOW BYTE
                LDA     #>DISPLAY_LIST
                STA     SDLSTH          ; SAVE DISPLAY LIST HI BYTE
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)

_SYNC:                                  ; CODE XREF: BOOT_CONTINUE+19↓j
                CMP     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                BEQ     _SYNC

_READ_LOOP:                             ; CODE XREF: BOOT_CONTINUE+29↓j
                JSR     READ_BLOCK
                LDA     LOAD_DCB.DBUF+1
                SEC
                SBC     #4
                STA     LOAD_DCB.DBUF+1
                CMP     #9
                BNE     _READ_LOOP
                LDA     #$B
                STA     LOAD_DCB.DBUF+1
                LDA     #2
                STA     LOAD_DCB.DBYTE+1
                JSR     READ_BLOCK
                LDA     #5
                TAY
                TAX

_TIMER_LOOP:                            ; CODE XREF: BOOT_CONTINUE+3E↓j
                                        ; BOOT_CONTINUE+41↓j ...
                SBC     #1
                BNE     _TIMER_LOOP
                DEX
                BNE     _TIMER_LOOP
                DEY
                BNE     _TIMER_LOOP
                LDA     #$3C ; '<'      ; Stop Tape
                STA     PACTL           ; Port A Control Register
                JMP     RESET
; End of function BOOT_CONTINUE


; =============== S U B R O U T I N E =======================================


                ; public BOOT_INIT
BOOT_INIT:                              ; DATA XREF: TAPE_LOADER:0704↑o
                RTS
; End of function BOOT_INIT


; =============== S U B R O U T I N E =======================================


READ_BLOCK:                             ; CODE XREF: BOOT_CONTINUE:_READ_LOOP↑p
                                        ; BOOT_CONTINUE+35↑p
                LDX     #11

loc_757:                                ; CODE XREF: READ_BLOCK+9↓j
                LDA     LOAD_DCB,X
                STA     DCB,X           ; DEVICE CONTROL BLOCK
                DEX
                BPL     loc_757
                JSR     SIOV            ; SERIAL INPUT OUTPUT ROUTINE
                BPL     loc_768
                JMP     (BRK)
; ---------------------------------------------------------------------------

loc_768:                                ; CODE XREF: READ_BLOCK+E↑j
                LDX     TEXT_LINE+$26
                DEX
                CPX     #_QUESTIONMARK|_C_ORANGE
                BNE     loc_775
                DEC     TEXT_LINE+$25
                LDX     #_9|_C_ORANGE

loc_775:                                ; CODE XREF: READ_BLOCK+19↑j
                STX     TEXT_LINE+$26
                RTS
; End of function READ_BLOCK

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS CTRL-NUMPAD+ TO EXPAND]
COLOR_TABLE:    .BYTE COLOR_INTENSITY_14|COLOR_BLUE
                                        ; DATA XREF: BOOT_CONTINUE:_COLOR_INIT↑r
                .BYTE COLOR_INTENSITY_12|COLOR_GREEN
                .BYTE COLOR_INTENSITY_14|COLOR_GOLD
                .BYTE COLOR_INTENSITY_14|COLOR_GREEN
                .BYTE COLOR_INTENSITY_0|COLOR_GRAY
LOAD_DCB:       .BYTE $60               ; DDEVICE
                                        ; DATA XREF: READ_BLOCK:loc_757↑r
                                        ; BOOT_CONTINUE+1E↑r ...
                .BYTE 0                 ; DUNIT ; $3F: Black tile
                .BYTE DCB_COMMANDS_READ ; DCOMMAND
                .BYTE $40               ; DSTATS
                .WORD ABQ+5             ; DBUF
                .BYTE 64                ; DTIMLO
                .BYTE 0
                .WORD $403              ; DBYTE
                .WORD $8004             ; DSECTOR

DISPLAY_LIST:   .BYTE $70               ; DATA XREF: BOOT_CONTINUE+B↑t
                                        ; BOOT_CONTINUE+10↑t ...
                .BYTE $70
                .BYTE $70
                .BYTE $47
                .WORD TEXT_LINE
                .BYTE $70
                .BYTE $70
                .BYTE $70
                .BYTE 6
                .BYTE $41
                .WORD DISPLAY_LIST

TEXT_LINE:      .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_L|_C_BLACK,_O|_C_BLACK,_A|_C_BLACK,_D|_C_BLACK,_I|_C_BLACK,_N|_C_BLACK,_G|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: TAPE_LOADER:078F↑o
                .BYTE _B|_C_BLACK,_L|_C_BLACK,_U|_C_BLACK,_E|_C_BLACK,_SPACE|_C_BLACK,_M|_C_BLACK,_A|_C_BLACK,_X|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                .BYTE _B|_C_BLUE,_L|_C_BLUE,_O|_C_BLUE,_C|_C_BLUE,_K|_C_BLUE,_S|_C_BLUE,_SPACE|_C_BLACK,_T|_C_BLUE,_O|_C_BLUE,_SPACE|_C_BLACK
                .BYTE _L|_C_BLUE,_O|_C_BLUE,_A|_C_BLUE,_D|_C_BLUE,_SPACE|_C_BLACK,_MINUS|_C_BLUE,_SPACE|_C_BLACK,_2|_C_ORANGE,_2|_C_ORANGE,_SPACE|_C_BLACK
                .BYTE   0,$4C,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
                .BYTE   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
; end of 'TAPE_LOADER'

; ===========================================================================

; Segment type: Pure code
                ;.segment GAME
                * =  $C00

; =============== S U B R O U T I N E =======================================


RESET:                                  ; CODE XREF: BOOT_CONTINUE+4B↑j
                                        ; DATA XREF: RESET↓t ...
                LDA     #<RESET
                STA     CASINI          ; CASSETTE INIT LOCATION
                LDA     #>RESET
                STA     CASINI+1        ; CASSETTE INIT LOCATION

                LDA     #JOYSTICK_DOWN
                STA     DIRECTION_A
                LDA     #JOYSTICK_UP
                STA     DIRECTION_B
                LDX     #95

X0:                                     ; CODE XREF: RESET+1B↓j
                LDA     ADS,X           ; $15: Hangar (A)
                STA     AEG,X           ; Backup of the hangar font characters
                DEX
                BPL     X0
                INX
                STX     COLDST          ; COLDSTART FLAG (1=IN MIDDLE OF COLDSTART)
                STX     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                STX     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                STX     SDMCTL          ; SAVE DMACTL REGISTER
                STX     AUDCTL          ; Audio Control Register
                LDA     #3
                STA     SKSTAT          ; Serial Port control Register
                STA     BOOT?           ; SUCCESSFUL BOOT FLAG
                LDX     #58

loc_C36:                                ; CODE XREF: RESET+3D↓j
                LDA     DEMI,X          ; "BLUE MAX" / "  BY BOB POLIN" / "    (C)SYNSOFT 1983"
                STA     SC_STATUS_TITLE+8,X ; Print title copyright to screen
                DEX
                BPL     loc_C36
                STX     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active

START:                                  ; CODE XREF: TURN+196↓j
                                        ; CNSL__CONSOLE+1E↓j ...
                JSR     STOP_SN         ; Sound: Stop
                STA     SDMCTL          ; SAVE DMACTL REGISTER
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz

                LDA     #$50 ; 'P'      ; Display List: 6 VBLANK
                STA     DL
                STA     DL+1

                LDA     #$74 ; 't'      ; Display List: LMS <adr> VSCROL HSCROL MODE 4
                LDX     #66

A_:                                     ; CODE XREF: RESET+5D↓j
                STA     DL-1,X
                DEX
                DEX
                DEX
                BNE     A_
                LDA     #<SC_TOP_PLAYSCREEN
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     #>SC_TOP_PLAYSCREEN
                STA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                LDY     #69

B:                                      ; CODE XREF: RESET+7F↓j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                SEC
                SBC     #65             ; each line has 65 bytes RAM
                STA     DL,Y
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                SBC     #0
                STA     DL+1,Y
                STA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                DEY
                DEY
                DEY
                BNE     B

                LDA     #$80            ; Display List: DLI 1 BLANK (trigger an interrupt)
                STA     DL+71
                LDA     #$54 ; 'T'      ; Display List: LMS <adr> HSCROL MODE 4
                STA     DL+68
                LDA     #$20 ; ' '      ; Display List: 3 BLANK
                STA     DL+72
                LDA     #$46 ; 'F'      ; Display List: LMS <adr> MODE 6
                STA     DL+73

                LDA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BEQ     AFZ
                LDA     #<SC_STATUS_TITLE
                STA     DL+74
                LDA     #>SC_STATUS_TITLE
                BNE     AGA

AFZ:                                    ; CODE XREF: RESET+98↑j
                LDA     #<SC_STATUS_LINE
                STA     DL+74
                LDA     #>SC_STATUS_LINE

AGA:                                    ; CODE XREF: RESET+A1↑j
                STA     DL+75
                LDA     #6              ; Display List: MODE 6
                STA     DL+76
                STA     DL+77
                LDA     #$41 ; 'A'      ; Display List: JVB <adr>
                STA     DL+78
                LDA     #<DL
                STA     DL+79
                STA     SDLSTL          ; SAVE DISPLAY LIST LOW BYTE
                LDA     #>DL
                STA     DL+80
                STA     SDLSTH          ; SAVE DISPLAY LIST HI BYTE

                LDA     #>__CHBAS
                STA     CHBAS           ; Select the playfield font
                LDA     #COLOR_INTENSITY_4|COLOR_GREEN
                STA     byte_B1
                STA     COLOR0          ; COLOR 0
                LDA     #COLOR_INTENSITY_4|COLOR_LIGHT_BLUE
                STA     COLOR1
                LDA     #COLOR_INTENSITY_2|COLOR_YELLOW_GREEN
                STA     byte_620
                STA     COLOR2
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                LDA     #>VDSLST_ROUTINE ; DL IRQ triggered when the control display is reached
                STA     VDSLST          ; DISPLAY LIST NMI VECTOR
                LDA     #<VDSLST_ROUTINE ; DL IRQ triggered when the control display is reached
                STA     VDSLST+1        ; DISPLAY LIST NMI VECTOR
                LDA     #<(SC_TOP_PLAYSCREEN-1)
                STA     BOTM            ; Last byte of the screen level memory
                LDA     #>(SC_TOP_PLAYSCREEN-1)
                STA     BOTM+1          ; Last byte of the screen level memory
                LDA     #>SC            ; Screen memory
                STA     TOP             ; First byte of the screen level memory
                LDA     #<SC            ; Screen memory
                STA     TOP+1           ; First byte of the screen level memory
                JSR     CLRPM__CLEAR_PMGRAPHICS ; Clear Player-Missile Graphics
                STX     BUILDING_ROW_COUNTER
                LDX     #6
                LDA     #0

EU:                                     ; CODE XREF: RESET+114↓j
                STA     TREE_POS_BUF-1,X ; Position of trees
                DEX
                BNE     EU
                STA     RIVER_BOAT_ROW_FLAG ; !=0 boat top row drawn, ==0 boat bottom row drawn
                STA     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                STA     byte_FA
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                LDA     #26
                STA     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                STA     byte_C4
                LDA     #150
                STA     byte_FE
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     #$F
                STA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                LDA     #$40 ; '@'
                STA     CH              ; GLOBAL VARIABLE FOR KEYBOARD
                LDA     #$50 ; 'P'
                STA     SOUND_MUSIC_ACTIVE_6FF ; Sound: Music playback is active, when != 0
                STA     byte_6B0
                STA     byte_655
                STA     IS_DEMO_MODE    ; 0=Demo Mode active
                LDA     #44
                STA     RUNWAY_POS_X_INDEX ; Right position where the runway starts
                STA     byte_6A1
                LDX     #66

L5:                                     ; CODE XREF: RESET+159↓j
                LDA     DSPLY-1,X       ; Initial Control Display
                STA     SC_STATUS_LINE.line_0.empty_2,X
                DEX
                BNE     L5
                LDA     RANDOM          ; Random Number Generator
                ORA     #$40 ; '@'
                STA     byte_6AA
                LDA     RANDOM          ; Random Number Generator
                ORA     #$18
                AND     #$7F
                STA     byte_650
                LDX     #16
                STX     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                STX     byte_6D6
                STX     byte_666
                DEX
                STX     STICK0_COPY     ; JOYSTICK 0 copy
                STX     DEMO_STICK0     ; Demo mode: joystick movement
                LDA     #75
                STA     byte_667
                LDA     #SND_FREQ_251
                STA     AUDF1           ; Audio 1 Frequency Register
                JSR     DFGN            ; Restore anti-airgraft gun battery graphics at character $31
                JSR     QUIET__STOP_ALL_SOUNDS ; Sound: stop all audio output
                STA     AUDIO4_GUN_SND_COUNTER
                STA     byte_6DB
                STA     CAPITAL_Y_POS
                STA     GAME_COMPLETION_MASK
                STA     byte_6C3
                STA     byte_6C5
                STA     EXPLOSION_TILE_ANIMATION
                STA     WIND_DURATION   ; Duration during which Wind is in effect
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     byte_6A2
                STA     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     PLANE_HIT_FLASH_COUNTER ; !=0 => counter to signal damage via flashing
                STA     AUDIO2_DROPSND_FREQ
                STA     byte_6A6
                STA     SIZEM           ; Missle Size
                STA     byte_6A7
                STA     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                STA     byte_698
                STA     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                STA     CURRENT_GAME_PHASE
                STA     byte_661
                STA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                STA     byte_65F
                STA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                STA     M3PL_SIZEP3     ; Missle to Player 3 Collision / Player 3 Size
                STA     VAR_PRIMARY_TARGET_SUBTYPE
                STA     byte_656
                STA     byte_6ED
                STA     byte_FD
                STA     GRAVITY_COUNT   ; When enabled, this counter pulls the plane down every 40 ticks
                STA     byte_B6
                STA     byte_6AE
                STA     AUDIO3_SOUND_COUNTER
                STA     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                STA     PCOLP3          ; P3 COLOR
                STA     PCOLR1          ; P1 COLOR
                STA     COLOR4
                STA     CURRENT_TILE_ROW_PTR+1
                STA     byte_602
                STA     AUDIO2_DURATION_COUNTER
                LDA     #26
                STA     RIVER_RIGHT_X_POS ; Right position of the river
                STA     CAN_LAND_FLAG   ; =0 => plane can land (runway reached)
                STA     FUEL_TIMER
                LDA     #6
                STA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                LDA     #14
                STA     GRAVITY_COUNT   ; When enabled, this counter pulls the plane down every 40 ticks
                STA     PCOLR0          ; P0 COLOR
                LDA     #>PMBASE_
                STA     PMBASE          ; Player-Missile Address Base Register
                LDA     #11b            ; Enable Player Graphics and Missile Graphics
                STA     GRACTL          ; Graphics Control Register
                LDA     #119
                STA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)
                LDA     #165
                STA     PLANE_VERT_POS  ; Vertical Position of the Plane
                JSR     DRP0            ; Update the primary plane graphics at the current vertical position (not the shadow or alternative color)
                LDA     #1
                STA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                STA     byte_C5
                STA     GPRIOR          ; PRIO = Players first, then Playfield
                STA     byte_606
                STA     byte_610
                LDA     #168
                STA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                JSR     DRP1
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1
                LDA     RANDOM          ; Random Number Generator
                AND     #1
                CLC
                ADC     #8
                STA     REQUIRED_TARGETS ; Number of required primary targets to progress (8 or 9 by random)
                LDA     #4
                STA     WORKING_PARTS   ; # of working part (4): fuel, bomb, maneuverabiity, gun
                STA     COLOR3
                STA     byte_608
                STA     SPEED_DELAY_COUNTER ; Limit speed increment/decrement changes with this counter
                LDA     #255
                STA     byte_603
                LDA     #DIR_RIVER_LEFT
                STA     byte_637
                STA     MAP_RIVER_DIR   ; Direction of the river
                STA     byte_643
                JSR     DFHNGR          ; Define Hangar – restore the font characters for the hangar
                LDA     #<EB
                STA     EE__JMP_PATCH+1
                LDA     #>EB
                STA     EE__JMP_PATCH+2
                LDA     #25
                STA     byte_6B1
                STA     RIVER_BRIDGE_ROW

EA:                                     ; CODE XREF: EB+B↓j
                JMP     J
; End of function RESET


; =============== S U B R O U T I N E =======================================


EB:                                     ; DATA XREF: RESET+27A↑t
                                        ; RESET+27F↑t
                JSR     DRAW            ; Draw river/gras on the map
                JSR     MB
                JSR     DRTR__DRAW_TREE ; Draw trees into the map. Needs to be the last draw function to be called.
                DEC     RIVER_BRIDGE_ROW
                BNE     EA
                LDA     #>XSND          ; Deferred interrupt for sound
                STA     EE__JMP_PATCH+2
                LDA     #<XSND          ; Deferred interrupt for sound
                STA     EE__JMP_PATCH+1
                LDA     #3
                STA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                LDA     #255
                STA     byte_B6
                LDA     #130
                STA     byte_638
                LDA     #$3F ; '?'
                STA     SDMCTL          ; SAVE DMACTL REGISTER
                STA     ATRACT          ; ATRACT FLAG

                LDA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                BEQ     _2              ; Setup level: novice
                CMP     #GAME_LEVEL_INTERMEDIATE
                BEQ     _6              ; Setup level: intermediate
                LDX     #6              ; Setup level: advanced

_5:                                     ; CODE XREF: EB+3D↓j
                LDA     EAS9,X          ; Advanced level variables
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     _5
                INC     byte_6A7
                LDA     #200
                STA     byte_6CF
                JMP     _3
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: EB+2E↑j
                LDX     #7              ; Setup level: novice

_1:                                     ; CODE XREF: EB+53↓j
                LDA     EAS0,X          ; Novice level variables
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     _1
                JMP     _3
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: EB+32↑j
                LDX     #6              ; Setup level: intermediate

_7:                                     ; CODE XREF: EB+61↓j
                LDA     EAS6,X          ; Intermediate level variables
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     _7
                LDA     #180
                STA     byte_6CF

_3:                                     ; CODE XREF: EB+47↑j EB+55↑j
                LDX     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BEQ     AFX
                JSR     PLAY_IT         ; Sound: Start playing the title music

AFY:                                    ; CODE XREF: EB+79↓j
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JSR     DFLSH__DEMO_FLASH_BLUEMAX ; Demo: Pulsate "BLUE MAX" in blue
                LDA     SOUND_MUSIC_ACTIVE_6FF ; Sound: Music playback is active, when != 0
                BNE     AFY             ; Wait for the title music to be done

AFX:                                    ; CODE XREF: EB+6B↑j
                LDA     #SND_FREQ_251
                STA     AUDF1           ; Audio 1 Frequency Register
                LDA     #SND_FREQ_13
                STA     AUDF3           ; Audio 3 Frequency Register
                LDA     #$EC
                STA     CDTMA1          ; COUNT DOWN TIMER 1 JSR ADDRESS
                LDA     #$EB
                STA     CDTMA1+1        ; COUNT DOWN TIMER 1 JSR ADDRESS
                LDA     #AUDIO_CONTROL_VOL_1|AUDIO_CONTROL_DIST_6
                STA     AUDC1_SHADOW
                STA     AUDC1           ; Audio 1 Channel Control Register
                LDX     #150

CW:                                     ; CODE XREF: EB+B3↓j
                STX     RIVER_BRIDGE_ROW
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JSR     FUEL            ; Use fuel, update the display as well
                JSR     DFLSH__DEMO_FLASH_BLUEMAX ; Demo: Pulsate "BLUE MAX" in blue
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                JSR     ROAR
                LDX     RIVER_BRIDGE_ROW
                DEX
                BNE     CW

MZ:                                     ; CODE XREF: REFUEL:_1↓j
                LDA     #SETVBV_VVBLKD
                LDX     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                LDY     #<VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                STA     HITCLR          ; write to HITCLR clears all of the collision registers.
                LDA     #_0|_C_ORANGE
                STA     SC_STATUS_LINE.line_1.speed_digit_100
                STA     SC_STATUS_LINE.line_1.speed_digit_10
                STA     SC_STATUS_LINE.line_1.speed_digit_1
                JSR     TAKOF__TAKEOFF_LOOP ; Loop to manage takeoff
                LDA     byte_6CF
                STA     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                CMP     #220
                BCS     _1_0
                ADC     #7
                STA     byte_6CF

_1_0:                                   ; CODE XREF: EB+DC↑j
                LDA     #4
                STA     byte_6B0
                STA     IS_DEMO_MODE    ; 0=Demo Mode active
                STA     CH              ; GLOBAL VARIABLE FOR KEYBOARD

                LDA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BNE     _18
                LDA     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                CMP     #2
                BCC     SRT
                CMP     REQUIRED_TARGETS ; Number of required primary targets to progress (8 or 9 by random)
                BCS     V0
                INC     byte_6A7

_18:                                    ; CODE XREF: EB+F1↑j
                LDA     RANDOM          ; Random Number Generator
                CMP     #160
                BCC     ZN

_9:
                JMP     SRT
; ---------------------------------------------------------------------------

V0:                                     ; CODE XREF: EB+FD↑j
                INC     byte_6AE

ZN:                                     ; CODE XREF: EB+107↑j
                LDA     #90
                STA     byte_667
                STA     byte_685
                LDA     #1
                STA     byte_666
                STA     byte_669

                LDA     RANDOM          ; Random Number Generator
                AND     #1111b
                ADC     #30
                STA     ROAD_RIGHT_X_POS ; right X position where the road starts
                ORA     #16
                STA     byte_668
                STA     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear
                LDA     #36
                STA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                STA     byte_674
                LDY     #0
                STY     ENEMY_RUNWAY_PLANE_FLAG
                STY     byte_677
                STY     byte_686
                DEY
                STY     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                LDA     RANDOM          ; Random Number Generator
                AND     #11111b
                STA     byte_B2
                INC     CURRENT_GAME_PHASE
                JSR     AKA
                JMP     CITY
; End of function EB


; =============== S U B R O U T I N E =======================================


SRT:                                    ; CODE XREF: EB+F8↑j EB:_9↑j ...
                JSR     DRAW            ; Draw river/gras on the map
                JSR     DRBR__DRAW_BRIDGE ; Draw a bridge over water
                JSR     DRBT__DRAW_BOAT ; Draw a ship onto the map
                JSR     DRUN__DRAW_RUNWAY ; Draw the runway on the map
                JSR     PLBCK
                JSR     PLFWD
                JSR     DRTNK
                JSR     TNK
                JSR     SHIP            ; Draw a moving ship
                JSR     COMMON
                JSR     CKLAND          ; Check if the player wants to land the plane while being over the runway
                JSR     RUNSND
                JSR     FBRGN           ; Fire Gun
                JSR     FBTGN
                JSR     DRP23           ; Draw Car or Truck driving left/right
                JSR     CKCOL           ; Check collision?!?
                JSR     SPD__SPEED_CHANGE ; Change the speed of the plane up/down based on the joystick
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                STA     ATRACT          ; ATRACT FLAG
                JMP     SRT
; End of function SRT


; =============== S U B R O U T I N E =======================================


COMMON:                                 ; CODE XREF: SRT+1B↑p
                                        ; CKLAND+1C↓p ...
                LDA     STICK0          ; JOYSTICK 0 RAM CELL
                STA     STICK0_COPY     ; JOYSTICK 0 copy
                LDA     STRIG0          ; JOYSTICK TRIGGER 0
                STA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                JSR     DEMO__DEMO_TRIGGER ; Demo Bomb release
                JSR     WIND            ; Check if Wind Warnings are possible and randomly trigger it.
                JSR     TRGT
                JSR     PBMB
                JSR     DRTR__DRAW_TREE ; Draw trees into the map. Needs to be the last draw function to be called.
                JSR     QUAKE           ; Quake, if enabled, shake the screen via HSCROL.
                JSR     PROP            ; Update the propeller graphics for rotation
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BNE     NQ
                JSR     KMKZ
                JMP     NR
; ---------------------------------------------------------------------------

NQ:                                     ; CODE XREF: COMMON+22↑j
                JSR     JOYST

NR:                                     ; CODE XREF: COMMON+27↑j
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     XPLSN
                JSR     ROAR
                JSR     TRIG__TRIGGER_MACHINE_GUN ; Trigger machine gun
                JSR     BOMB            ; Trigger bomb drop
                JSR     GUNSND          ; Gun sound from the plane
                JSR     SPLASH          ; Splash sound effect on channel 2
                JSR     GRAV__APPLY_GRAVITY ; When enabled, apply gravity to the plane
                JSR     LOW             ; Check if the plane is too low to the ground. Warn via control display color and sound effect.
                JSR     FUEL            ; Use fuel, update the display as well
                JSR     PAUSE           ; Check if 'SPACE' for Pause was pressed and pause the game.
                JSR     BRGPOS
                JSR     FTNKGN
                JSR     M2GPOS
                JSR     FM2GN
                JSR     ALT__ALTITUDE_DISPLAY_FIXUP ; Fixup Altitude display to make sure that all digits are correct. This can be necessary, because the last digit can over/underflow when in/decremented somewhere else.
                JSR     GGNSND          ; Play gound sound, if enabled
                JSR     COLRDM__COLOR_DAMAGE ; Flash background of control display to signal damage
                JSR     XFLSH           ; Flash the screen colors after e.g. a crash
                JSR     CKSC
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JSR     SHCOL
                JSR     TRGTP2          ; Flicker PCOLR2
                LDA     byte_6F7
                BEQ     _9              ; => Return
                DEC     byte_6F7

_9:                                     ; CODE XREF: COMMON+75↑j
                RTS                     ; => Return
; End of function COMMON


; =============== S U B R O U T I N E =======================================

; Wait for Timer 3. Sync gameplay to 60Hz

TIMER:                                  ; CODE XREF: RESET+48↑p
                                        ; EB+AA↑p ...
                LDA     #11b
                STA     HITCLR          ; write to HITCLR clears all of the collision registers.
                LDX     #0
                LDY     #1
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled

L:                                      ; CODE XREF: TIMER+14↓j
                LDA     CDTMV3          ; COUNT DOWN TIMER 3
                BNE     L
                RTS
; End of function TIMER


; =============== S U B R O U T I N E =======================================

; Deferred VBL: scroll the playfield and play sound

VBIR__DEFERRED_VBL_DRAW:                ; DATA XREF: EB+B7↑t EB+B9↑t ...
                DEC     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     SCROL           ; Scrolling happens at 30Hz
                JMP     XSND            ; Deferred interrupt for sound
; ---------------------------------------------------------------------------

SCROL:                                  ; CODE XREF: VBIR__DEFERRED_VBL_DRAW+7↑j
                LDA     VBL_DRAW_DOWN_COUNTER ; Scrolling happens at 30Hz
                BEQ     JR
                DEC     VBL_DRAW_DOWN_COUNTER ; VBL: 30Hz down counter whenever the level scrolls a pixel

JR:                                     ; CODE XREF: VBIR__DEFERRED_VBL_DRAW+F↑j
                LDA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                BEQ     J
                SEC
                SBC     #1
                STA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                STA     HSCROL          ; Horizontal Scroll Register
                ASL     A
                STA     VSCROL          ; Vertical Scroll Register
                JMP     XSND            ; Deferred interrupt for sound
; ---------------------------------------------------------------------------

J:                                      ; CODE XREF: RESET:EA↑j
                                        ; VBIR__DEFERRED_VBL_DRAW+16↑j
                LDA     byte_FE
                BEQ     GN
                DEC     byte_FE
                BNE     GN
                LDA     #8
                STA     RIVER_BRIDGE_ROW
                LDA     RANDOM          ; Random Number Generator
                AND     #11b
                STA     byte_61B

GN:                                     ; CODE XREF: VBIR__DEFERRED_VBL_DRAW+29↑j
                                        ; VBIR__DEFERRED_VBL_DRAW+2D↑j
                LDA     #0
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     #3
                STA     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                STA     HSCROL          ; Horizontal Scroll Register
                ASL     A
                STA     VSCROL          ; Vertical Scroll Register

                LDA     BOTM            ; Last byte of the screen level memory
                SEC
                SBC     #23
                STA     BUF
                LDA     BOTM+1          ; Last byte of the screen level memory
                SBC     #0
                STA     BUF+1
                LDA     BOTSCREN
                STA     BOTM            ; Last byte of the screen level memory
                SEC
                SBC     #20
                STA     VBL_NEXT_ROW_PTR ; new row to be draw. Set inside the VBL.
                PHP
                LDA     BOTSCREN+1
                STA     BOTM+1          ; Last byte of the screen level memory
                PLP
                SBC     #0
                STA     VBL_NEXT_ROW_PTR+1 ; new row to be draw. Set inside the VBL.
                LDY     #66

K:                                      ; CODE XREF: VBIR__DEFERRED_VBL_DRAW+88↓j
                LDA     DL,Y
                CLC
                ADC     #1
                STA     DL+3,Y
                LDA     DL+1,Y
                ADC     #0
                STA     DL+4,Y
                DEY
                DEY
                DEY
                BNE     K
                LDA     TOP             ; First byte of the screen level memory
                CLC
                ADC     #1
                STA     DL+3
                LDA     TOP+1           ; First byte of the screen level memory
                ADC     #0
                STA     DL+4
                LDA     BUF
                STA     TOP             ; First byte of the screen level memory
                LDA     BUF+1
                STA     TOP+1           ; First byte of the screen level memory

EE__JMP_PATCH:                          ; DATA XREF: RESET+27C↑w
                                        ; EB+14↑w ...
                JMP     XSND            ; Deferred interrupt for sound
; End of function VBIR__DEFERRED_VBL_DRAW


; =============== S U B R O U T I N E =======================================

; Draw river/gras on the map

DRAW:                                   ; CODE XREF: EB↑p SRT↑p ...
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     M
                RTS
; ---------------------------------------------------------------------------

M:                                      ; CODE XREF: DRAW+2↑j
                LDY     #64
                LDA     #L_GRAS|L_C_0

N:                                      ; CODE XREF: DRAW+C↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; Fill whole line with gras
                DEY
                BNE     N               ; Fill whole line with gras

AY:                                     ; Direction of the river
                LDA     MAP_RIVER_DIR
                CMP     #DIR_RIVER_STRAIGHT
                BEQ     STRGHT
                CMP     #DIR_RIVER_RIGHT
                BEQ     AR

AQ:
                JMP     LFT
; ---------------------------------------------------------------------------

AR:                                     ; CODE XREF: DRAW+17↑j
                JMP     RGHT
; ---------------------------------------------------------------------------

RND:                                    ; CODE XREF: DRAW+35↓j
                                        ; DRAW+D2↓j ...
                LDA     RANDOM          ; Random Number Generator
                AND     #3
                ORA     #2
                STA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                LDA     #DIR_RIVER_STRAIGHT
                STA     MAP_RIVER_DIR   ; Direction of the river
                JMP     STRGHT
; ---------------------------------------------------------------------------

AX:                                     ; CODE XREF: DRAW+83↓j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCS     RND
                LDA     RANDOM          ; Random Number Generator
                AND     #15
                ORA     #3
                STA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                LDA     #255
                STA     byte_603
                LDA     byte_602
                CMP     #4
                BEQ     AV              ; River should turn right
                CMP     #5
                BEQ     BA              ; River should turn left
                LDA     byte_610
                BEQ     EC              ; 50/50 chance for the river to turn left/right
                LSR     A
                STA     byte_610
                BCC     AV              ; River should turn right
                JMP     BA              ; River should turn left
; ---------------------------------------------------------------------------

EC:                                     ; CODE XREF: DRAW+54↑j
                LDA     RANDOM          ; 50/50 chance for the river to turn left/right
                LSR     A
                BCC     AV              ; River should turn right

BA:                                     ; CODE XREF: DRAW+4F↑j
                                        ; DRAW+5C↑j
                LDA     #DIR_RIVER_LEFT ; River should turn left
                STA     MAP_RIVER_DIR   ; Direction of the river
                JMP     LFT
; ---------------------------------------------------------------------------

AV:                                     ; CODE XREF: DRAW+4B↑j
                                        ; DRAW+5A↑j ...
                LDA     #DIR_RIVER_RIGHT ; River should turn right
                STA     MAP_RIVER_DIR   ; Direction of the river
                LSR     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                ORA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                STA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                JMP     RGHT
; ---------------------------------------------------------------------------

STRGHT:                                 ; CODE XREF: DRAW+13↑j
                                        ; DRAW+2E↑j
                DEC     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                BNE     P
                JMP     AX
; ---------------------------------------------------------------------------

P:                                      ; CODE XREF: DRAW+81↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     #65
                BCS     AF
                LDA     #L_WATER_GRAS_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AF:                                     ; CODE XREF: DRAW+8A↑j
                DEY
                BEQ     U
                LDA     #L_WATER|L_C_0
                LDX     #19

Q:                                      ; CODE XREF: DRAW+A1↓j
                CPY     #65
                BCS     AG
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AG:                                     ; CODE XREF: DRAW+99↑j
                DEY
                BEQ     U
                DEX
                BNE     Q
                CPY     #65
                BCS     AH
                LDA     #L_CLIFF_WATER_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AH:                                     ; CODE XREF: DRAW+A5↑j
                DEY
                BEQ     U
                CPY     #65
                BCS     U
                LDA     byte_606
                BEQ     BN
                LDA     #L_CLIFF_GRAS_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

BN:                                     ; CODE XREF: DRAW+B5↑j
                LDA     #L_CLIFF_GRAS_B2|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BEQ     U
                LDA     #L_CLIFF_GRAS_B1|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

U:                                      ; CODE XREF: DRAW+91↑j
                                        ; DRAW+9E↑j ...
                LDA     #1
                STA     byte_606
                RTS
; ---------------------------------------------------------------------------

LFT:                                    ; CODE XREF: DRAW:AQ↑j
                                        ; DRAW+6A↑j
                DEC     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                BNE     R
                JMP     RND
; ---------------------------------------------------------------------------

R:                                      ; CODE XREF: DRAW+D0↑j
                LDA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                LSR     A
                BCC     S
                DEC     RIVER_RIGHT_X_POS ; Right position of the river
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     byte_666
                BEQ     W
                CPY     #65
                BCS     AL
                LDA     #L_WATER_GRAS_C2|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AL:                                     ; CODE XREF: DRAW+E6↑j
                DEY
                BEQ     V
                LDA     #L_WATER|L_C_0
                LDX     #19

X_:                                     ; CODE XREF: DRAW+FD↓j
                CPY     #65
                BCS     AM
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AM:                                     ; CODE XREF: DRAW+F5↑j
                DEY
                BEQ     V
                DEX
                BNE     X_
                CPY     #65
                BCS     V
                LDA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                CMP     #1
                BEQ     AZ
                LDA     #L_GRAS_CLIFF_WATER_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

V:                                      ; CODE XREF: DRAW+ED↑j
                                        ; DRAW+FA↑j ...
                DEC     byte_603
                RTS
; ---------------------------------------------------------------------------

AZ:                                     ; CODE XREF: DRAW+108↑j
                LDA     #L_GRAS_CLIFF_WATER_B|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

W:                                      ; CODE XREF: DRAW+E2↑j
                LDA     #4
                STA     byte_602
                JMP     RND
; ---------------------------------------------------------------------------

S:                                      ; CODE XREF: DRAW+D9↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     #65
                BCS     BB
                LDA     #L_WATER_GRAS_C1|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

BB:                                     ; CODE XREF: DRAW+123↑j
                DEY
                BEQ     V
                LDA     #L_WATER|L_C_0
                LDX     #19

T:                                      ; CODE XREF: DRAW+13A↓j
                CPY     #65
                BCS     AJ
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AJ:                                     ; CODE XREF: DRAW+132↑j
                DEY
                BEQ     V
                DEX
                BNE     T
                CPY     #65
                BCS     AK
                LDA     #L_CLIFF_WATER_C|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AK:                                     ; CODE XREF: DRAW+13E↑j
                DEY
                BEQ     V
                CPY     #65
                BCS     TL              ; => Return
                LDA     byte_603
                CMP     #$FF
                BNE     Y_
                LDA     #L_CLIFF_GRAS_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEC     byte_603
                LDA     #$FF
                STA     byte_602
                RTS
; ---------------------------------------------------------------------------

Y_:                                     ; CODE XREF: DRAW+150↑j
                LDA     #L_GRASS_CLIFF_D|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

TL:                                     ; CODE XREF: DRAW+149↑j
                                        ; DRAW+1C7↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

RGHT:                                   ; CODE XREF: DRAW:AR↑j
                                        ; DRAW+7B↑j
                DEC     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                BNE     Z
                LDA     #0
                STA     byte_606
                JMP     RND
; ---------------------------------------------------------------------------

Z:                                      ; CODE XREF: DRAW+167↑j
                INC     RIVER_RIGHT_X_POS ; Right position of the river
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     byte_667
                BCC     AA
                LDA     #0
                STA     byte_606
                DEC     RIVER_RIGHT_X_POS ; Right position of the river
                LDA     #5
                STA     byte_602
                JMP     RND
; ---------------------------------------------------------------------------

AA:                                     ; CODE XREF: DRAW+178↑j
                CPY     #65
                BCS     AB
                LDA     #L_WATER_GRAS_B2|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AB:                                     ; CODE XREF: DRAW+18B↑j
                DEY
                BEQ     AI
                CPY     #65
                BCS     AC
                LDA     #L_WATER_GRAS_B1|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AC:                                     ; CODE XREF: DRAW+196↑j
                DEY
                BEQ     AI
                LDX     #18
                LDA     #L_WATER|L_C_0

AD:                                     ; CODE XREF: DRAW+1AD↓j
                CPY     #65
                BCS     AE
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AE:                                     ; CODE XREF: DRAW+1A5↑j
                DEY
                BEQ     AI
                DEX
                BNE     AD
                CPY     #65
                BCS     AN
                LDA     #L_CLIFF_WATER_B2|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AN:                                     ; CODE XREF: DRAW+1B1↑j
                DEY
                BEQ     AI
                CPY     #65
                BCS     AO
                LDA     #L_CLIFF_WATER_B1|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

AO:                                     ; CODE XREF: DRAW+1BC↑j
                DEY
                BEQ     AI
                CPY     #65
                BCS     TL              ; => Return
                LDA     byte_603
                CMP     #$FF
                BNE     AP
                LDA     #L_CLIFF_GRAS_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEC     byte_603
                LDA     #$FF
                STA     byte_602

AI:                                     ; CODE XREF: DRAW+192↑j
                                        ; DRAW+19D↑j ...
                DEC     byte_603
                RTS
; ---------------------------------------------------------------------------

AP:                                     ; CODE XREF: DRAW+1CE↑j
                LDA     #L_CLIFF_GRAS_B2|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BEQ     AI
                LDA     #L_CLIFF_GRAS_B1|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; End of function DRAW


; =============== S U B R O U T I N E =======================================


DRP1:                                   ; CODE XREF: RESET+248↑p
                                        ; CE-10↓p
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                INY
                INY
                LDA     #1100b
                STA     P1,Y            ; Player Plane (BLACK parts)
                INY
                LDA     #100b
                STA     P1,Y            ; Player Plane (BLACK parts)
                INY
                LDA     #10000b
                STA     P1,Y            ; Player Plane (BLACK parts)
                INY
                LDA     #0
                STA     P1,Y            ; Player Plane (BLACK parts)
                RTS
; End of function DRP1


; =============== S U B R O U T I N E =======================================

; Copy Plane Shadow into P1

SHDW_SUB:                               ; CODE XREF: RESET+24B↑p
                                        ; CE-4↓p ...
                LDX     #0
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow

loc_1367:                               ; CODE XREF: SHDW_SUB+E↓j
                LDA     P1IMAGE,X       ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P1,Y            ; Player Plane (BLACK parts)
                INY
                INX
                CPX     #8
                BNE     loc_1367
                RTS
; End of function SHDW_SUB


; =============== S U B R O U T I N E =======================================

; Update the propeller graphics for rotation

PROP:                                   ; CODE XREF: EB+9B↑p
                                        ; COMMON+1C↑p ...
                DEC     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                BNE     BG
                LDA     #4
                STA     PROPELLER_PHASE ; Propeller phase (typically 0-4)

BG:                                     ; CODE XREF: PROP+3↑j
                LDX     #3
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                CMP     #2
                BEQ     BE
                CMP     #4
                BEQ     BF
                RTS
; ---------------------------------------------------------------------------

BE:                                     ; CODE XREF: PROP+13↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     #JOYSTICK_LEFT
                BEQ     BP
                CMP     #JOYSTICK_UP_LEFT
                BEQ     BP
                CMP     #JOYSTICK_RIGHT
                BEQ     BR
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     BR

BT:                                     ; CODE XREF: PROP+34↓j
                LDA     P0IMAGE+9,X     ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BNE     BT
                RTS
; ---------------------------------------------------------------------------

BF:                                     ; CODE XREF: PROP+17↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     #JOYSTICK_LEFT
                BEQ     BQ
                CMP     #JOYSTICK_UP_LEFT
                BEQ     BQ
                CMP     #JOYSTICK_RIGHT
                BEQ     BS
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     BS

BU:                                     ; CODE XREF: PROP+51↓j
                LDA     P0IMAGE+$C,X    ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BNE     BU
                RTS
; ---------------------------------------------------------------------------

BP:                                     ; CODE XREF: PROP+1E↑j
                                        ; PROP+22↑j
                LDA     #0
                STA     P0,Y            ; Player Plane (WHITE parts)
                LDA     #1000b
                STA     P0+1,Y          ; Player Plane (WHITE parts)
                LDA     #10b
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                RTS
; ---------------------------------------------------------------------------

BQ:                                     ; CODE XREF: PROP+3B↑j
                                        ; PROP+3F↑j
                LDA     #100b
                STA     P0,Y            ; Player Plane (WHITE parts)
                STA     P0+1,Y          ; Player Plane (WHITE parts)
                LDA     #0
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                RTS
; ---------------------------------------------------------------------------

BR:                                     ; CODE XREF: PROP+26↑j
                                        ; PROP+2A↑j
                LDA     #11000000b
                STA     P0,Y            ; Player Plane (WHITE parts)
                LDA     #1001000b
                STA     P0+1,Y          ; Player Plane (WHITE parts)
                LDA     #1100010b
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                RTS
; ---------------------------------------------------------------------------

BS:                                     ; CODE XREF: PROP+43↑j
                                        ; PROP+47↑j
                LDA     #11000100b
                STA     P0,Y            ; Player Plane (WHITE parts)
                LDA     #1000100b
                STA     P0+1,Y          ; Player Plane (WHITE parts)
                LDA     #1100000b
                STA     P0+2,Y          ; Player Plane (WHITE parts)
                RTS
; End of function PROP


; =============== S U B R O U T I N E =======================================

; Check if 'SPACE' for Pause was pressed and pause the game.

PAUSE:                                  ; CODE XREF: COMMON+4B↑p
                LDA     CH              ; GLOBAL VARIABLE FOR KEYBOARD
                CMP     #KEYCODE_SPACE
                BEQ     IF
                RTS
; ---------------------------------------------------------------------------

IF:                                     ; CODE XREF: PAUSE+5↑j
                LDA     #SETVBV_VVBLKD
                LDX     #>XSND          ; Deferred interrupt for sound
                LDY     #<XSND          ; Deferred interrupt for sound
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                STA     CH              ; GLOBAL VARIABLE FOR KEYBOARD
                LDA     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     PAUSE_RTCLOK    ; Saved 2 bytes of the RTCLOK during pause
                LDA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     PAUSE_RTCLOK+1  ; Saved 2 bytes of the RTCLOK during pause

IG:                                     ; CODE XREF: PAUSE+31↓j
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                LDA     CH              ; GLOBAL VARIABLE FOR KEYBOARD
                CMP     #KEYCODE_SPACE  ; Wait for Space to be pressed again
                BNE     IG

                LDA     PAUSE_RTCLOK    ; Saved 2 bytes of the RTCLOK during pause
                STA     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LDA     PAUSE_RTCLOK+1  ; Saved 2 bytes of the RTCLOK during pause
                STA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LDA     #SETVBV_VVBLKD
                LDX     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                LDY     #<VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                STA     CH              ; GLOBAL VARIABLE FOR KEYBOARD
                RTS
; End of function PAUSE


; =============== S U B R O U T I N E =======================================

; Check collision?!?

CKCOL:                                  ; CODE XREF: SRT+2D↑p
                                        ; CKLAND+25↓p ...
                LDA     byte_C5
                BNE     L2
                RTS
; ---------------------------------------------------------------------------

L2:                                     ; CODE XREF: CKCOL+2↑j
                LDA     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
                CMP     #1
                BEQ     IJ              ; => Return
                CMP     #10b
                BEQ     L3
                CMP     #1000b
                BEQ     IJ              ; => Return
                CMP     #1001b
                BNE     IL

IJ:                                     ; CODE XREF: CKCOL+A↑j
                                        ; CKCOL+12↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

L3:                                     ; CODE XREF: CKCOL+E↑j
                LDY     COLOR1
                CPY     #COLOR_INTENSITY_10|COLOR_ORANGE
                BNE     IJ              ; => Return

IL:                                     ; CODE XREF: CKCOL+16↑j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                BNE     _1
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                ADC     #$F
                STA     byte_6D6

_1:                                     ; CODE XREF: CKCOL+23↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     byte_6D6
                BCS     IJ              ; => Return
                STA     byte_654
                JMP     CRASH           ; Plane was crashed
; End of function CKCOL


; =============== S U B R O U T I N E =======================================


JOYST:                                  ; CODE XREF: COMMON:NQ↑p

; FUNCTION CHUNK AT 158C SIZE 00000066 BYTES

                LDA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                BEQ     SE
                DEC     byte_65A
                LDA     byte_65A
                LSR     A
                BCC     SE
                RTS
; ---------------------------------------------------------------------------

SE:                                     ; CODE XREF: JOYST+3↑j
                                        ; JOYST+C↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     DIRECTION_B
                BEQ     UP              ; Move Plane up, if possible
                CMP     #JOYSTICK_RIGHT
                BEQ     PI
                CMP     #JOYSTICK_LEFT
                BEQ     PJ
                CMP     #JOYSTICK_UP_RIGHT
                BEQ     CO
                CMP     #JOYSTICK_DOWN_LEFT
                BEQ     PM
                CMP     DIRECTION_A
                BEQ     KK              ; Move Plane down, if possible
                CMP     #JOYSTICK_UP_LEFT
                BEQ     CE
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     CF
                JMP     BACK
; ---------------------------------------------------------------------------

PI:                                     ; CODE XREF: JOYST+18↑j
                JMP     PK              ; Move Plane right, if possible
; ---------------------------------------------------------------------------

PJ:                                     ; CODE XREF: JOYST+1C↑j
                JMP     PL              ; Move Plane left, if possible
; ---------------------------------------------------------------------------

PM:                                     ; CODE XREF: JOYST+24↑j
                JMP     PN
; ---------------------------------------------------------------------------

CF:                                     ; CODE XREF: JOYST+31↑j
                JMP     CD
; ---------------------------------------------------------------------------

CO:                                     ; CODE XREF: JOYST+20↑j
                JMP     FRWD
; End of function JOYST


; =============== S U B R O U T I N E =======================================

; Move Plane down, if possible

KK:                                     ; CODE XREF: JOYST+29↑j
                                        ; GRAV__APPLY_GRAVITY+1D↓j ...
                DEC     SC_STATUS_LINE.line_1.altitude_digit_1

DN:                                     ; CODE XREF: CD+2C↓j
                INC     PLANE_VERT_POS  ; Vertical Position of the Plane
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #2
                BEQ     E               ; Plane crashed into the ground
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                LDX     #11

G:                                      ; CODE XREF: KK+1A↓j
                LDA     P0+8,Y          ; Player Plane (WHITE parts)
                STA     P0+9,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BNE     G
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                LDX     #4

H:                                      ; CODE XREF: KK+28↓j
                LDA     P1+3,Y          ; Player Plane (BLACK parts)
                STA     P1+4,Y          ; Player Plane (BLACK parts)
                DEY
                DEX
                BNE     H
                RTS
; ---------------------------------------------------------------------------

E:                                      ; CODE XREF: KK+C↑j
                JMP     CRASH           ; Plane crashed into the ground
; End of function KK


; =============== S U B R O U T I N E =======================================

; Move Plane up, if possible

UP:                                     ; CODE XREF: JOYST+14↑j
                                        ; DJOY__DEMO_JOYSTICK_INPUT+10↓p ...
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                CPY     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     CA
                INC     SC_STATUS_LINE.line_1.altitude_digit_1
; End of function UP

; START OF FUNCTION CHUNK FOR CE

BY:                                     ; CODE XREF: CE+29↓j
                LDX     #11

O:                                      ; CODE XREF: CE-14↓j
                LDA     P0,Y            ; Player Plane (WHITE parts)
                STA     P0-1,Y          ; Player Plane (WHITE parts)
                INY
                DEX
                BNE     O
                DEC     PLANE_VERT_POS  ; Vertical Position of the Plane
                JSR     DRP1
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #6
                BCS     I               ; => Return
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1

I:                                      ; CODE XREF: CE-6↑j
                RTS                     ; => Return
; END OF FUNCTION CHUNK FOR CE

; =============== S U B R O U T I N E =======================================


CE:                                     ; CODE XREF: JOYST+2D↑j
                                        ; KMKZ+36↓p

; FUNCTION CHUNK AT 150F SIZE 0000001E BYTES

                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CMP     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     CG
                DEC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)

CG:                                     ; CODE XREF: CE+4↑j
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                CPY     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BNE     CH__
                RTS
; ---------------------------------------------------------------------------

CH__:                                   ; CODE XREF: CE+14↑j
                                        ; JOYST+13A↓j
                LDX     #9
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow

CI:                                     ; CODE XREF: CE+23↓j
                LDA     P1,Y            ; Player Plane (BLACK parts)
                STA     P1-1,Y          ; Player Plane (BLACK parts)
                INY
                DEX
                BNE     CI
                DEC     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                JMP     BY
; End of function CE


; =============== S U B R O U T I N E =======================================


CD:                                     ; CODE XREF: JOYST:CF↑j
                                        ; KMKZ:loc_2251↓p
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CMP     #PLANE_MAX_X_POSITION ; max. allowed X position for the plane
                BEQ     CA
                INC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)

CA:                                     ; CODE XREF: UP+4↑j CD+4↑j
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                CPY     #168
                BNE     CB
                RTS
; ---------------------------------------------------------------------------

CB:                                     ; CODE XREF: CD+14↑j
                                        ; JOYST+120↓j
                LDX     #9

CC:                                     ; CODE XREF: CD+21↓j
                LDA     P1+7,Y          ; Player Plane (BLACK parts)
                STA     P1+8,Y          ; Player Plane (BLACK parts)
                DEY
                DEX
                BNE     CC
                INC     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     DIRECTION_B
                BEQ     MO
                JMP     DN
; ---------------------------------------------------------------------------

MO:                                     ; CODE XREF: CD+2A↑j
                INC     SC_STATUS_LINE.line_1.altitude_digit_1
                RTS
; End of function CD

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR JOYST

PN:                                     ; CODE XREF: JOYST:PM↑j
                DEC     byte_608
                DEC     byte_608

BACK:                                   ; CODE XREF: JOYST+33↑j
                DEC     byte_608
                BMI     CM

CN:                                     ; CODE XREF: JOYST+10E↓j
                                        ; JOYST+114↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

CM:                                     ; CODE XREF: JOYST+102↑j
                LDA     #4
                STA     byte_608
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CMP     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     CN              ; => Return
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                CPY     #168
                BEQ     CN              ; => Return
                DEC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)
                JMP     CB
; ---------------------------------------------------------------------------

FRWD:                                   ; CODE XREF: JOYST:CO↑j
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CMP     #PLANE_MAX_X_POSITION ; max. allowed X position for the plane
                BNE     CP

CQ:                                     ; CODE XREF: JOYST+12E↓j
                                        ; JOYST+141↓j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

CP:                                     ; CODE XREF: JOYST+127↑j
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                CPY     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     CQ              ; => Return
                INC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)
                JMP     CH__
; ---------------------------------------------------------------------------

PK:                                     ; CODE XREF: JOYST:PI↑j
                LDA     PLANE_HORI_POS  ; Move Plane right, if possible
                CMP     #PLANE_MAX_X_POSITION ; max. allowed X position for the plane
                BEQ     CQ              ; => Return
                INC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)
                RTS
; ---------------------------------------------------------------------------

PL:                                     ; CODE XREF: JOYST:PJ↑j
                LDA     PLANE_HORI_POS  ; Move Plane left, if possible
                CMP     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     CQ              ; => Return
                DEC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STA     HPOSP1          ; Player Plane (Horizontal Position – second color)
                RTS
; END OF FUNCTION CHUNK FOR JOYST

; =============== S U B R O U T I N E =======================================


SHCOL:                                  ; CODE XREF: COMMON+6C↑p
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #80
                BEQ     CR
                CMP     #79
                BEQ     CS__
                RTS
; ---------------------------------------------------------------------------

CR:                                     ; CODE XREF: SHCOL+7↑j
                LDA     #COLOR_INTENSITY_2|COLOR_GRAY
                STA     PCOLR1          ; P1 COLOR
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDA     P1+4,Y          ; Player Plane (BLACK parts)
                BEQ     FFF             ; => Return
                LDA     #0
                STA     P1,Y            ; Player Plane (BLACK parts)
                STA     P1+7,Y          ; Player Plane (BLACK parts)
                LDA     #1000100b
                STA     P1+1,Y          ; Player Plane (BLACK parts)
                LDA     #1000010b
                STA     P1+6,Y          ; Player Plane (BLACK parts)

FFF:                                    ; CODE XREF: SHCOL+18↑j
                                        ; SHCOL+37↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

CS__:                                   ; CODE XREF: SHCOL+B↑j
                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                STA     PCOLR1          ; P1 COLOR
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDA     P1+4,Y          ; Player Plane (BLACK parts)
                BEQ     FFF             ; => Return
                JMP     SHDW_SUB        ; Copy Plane Shadow into P1
; ---------------------------------------------------------------------------

CK:                                     ; CODE XREF: TURN+1B↓j
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDA     P1+4,Y          ; Player Plane (BLACK parts)
                BEQ     DRP0            ; Update the primary plane graphics at the current vertical position (not the shadow or alternative color)
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #80
                BCS     DRP0            ; Update the primary plane graphics at the current vertical position (not the shadow or alternative color)
                LDA     #10000010b
                STA     P1,Y            ; Player Plane (BLACK parts)
                LDA     #1000001b
                STA     P1+7,Y          ; Player Plane (BLACK parts)
; End of function SHCOL


; =============== S U B R O U T I N E =======================================

; Update the primary plane graphics at the current vertical position (not the shadow or alternative color)

DRP0:                                   ; CODE XREF: RESET+232↑p
                                        ; SHCOL+41↑j ...
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                LDX     #9

BH:                                     ; CODE XREF: DRP0+C↓j
                LDA     P0IMAGE,X       ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                STA     P0+9,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BPL     BH
                RTS
; End of function DRP0


; =============== S U B R O U T I N E =======================================

; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.

TURN:                                   ; CODE XREF: EB+9E↑p
                                        ; COMMON:NR↑p ...
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     TURN_STICK0     ; STICK0 copy for the TURN routine
                BNE     BC
                RTS                     ; => joystick direction has not changed
; ---------------------------------------------------------------------------

BC:                                     ; CODE XREF: TURN+5↑j
                STA     TURN_STICK0     ; STICK0 copy for the TURN routine
                CMP     #JOYSTICK_LEFT
                BEQ     BJ              ; Joystick was moved in allowed direction
                CMP     #JOYSTICK_UP_LEFT
                BEQ     BJ              ; Joystick was moved in allowed direction
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     BJ              ; Joystick was moved in allowed direction
                CMP     #JOYSTICK_RIGHT
                BEQ     BJ              ; Joystick was moved in allowed direction
                JMP     CK
; ---------------------------------------------------------------------------

BJ:                                     ; CODE XREF: TURN+D↑j
                                        ; TURN+11↑j ...
                LDA     PLANE_VERT_SHADOW_POS ; Joystick was moved in allowed direction
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #6              ; Is the plane already too close to the ground?
                BCS     DU              ; => no
                JMP     CRASH           ; Plane was crashed
; ---------------------------------------------------------------------------

DU:                                     ; CODE XREF: TURN+25↑j
                LDA     TURN_STICK0     ; STICK0 copy for the TURN routine
                CMP     #JOYSTICK_RIGHT
                BEQ     BK
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     BK

; Set plane image to turn left
                LDX     #10
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane

BL:                                     ; CODE XREF: TURN+41↓j
                LDA     P1IMAGE+7,X     ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P0+9,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BNE     BL
                JMP     CJ
; ---------------------------------------------------------------------------

; Set plane image to turn right

BK:                                     ; CODE XREF: TURN+2F↑j
                                        ; TURN+33↑j
                LDX     #10
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane

BO:                                     ; CODE XREF: TURN+52↓j
                LDA     P1IMAGE+$11,X   ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P0+9,Y          ; Player Plane (WHITE parts)
                DEY
                DEX
                BNE     BO

CJ:                                     ; CODE XREF: TURN+43↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #80             ; Shadow too far away?
                BCS     ZM              ; => Return
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDA     P1+4,Y          ; Player Plane (BLACK parts)
                BEQ     ZM              ; => Return
                LDA     #10b
                STA     P1,Y            ; Player Plane (BLACK parts)
                LDA     #1000000b
                STA     P1+7,Y          ; Player Plane (BLACK parts)

ZM:                                     ; CODE XREF: TURN+5A↑j
                                        ; TURN+61↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

CRASH:                                  ; CODE XREF: CKCOL+3B↑j KK:E↑j ...
                LDA     SC_STATUS_LINE.line_1.altitude_digit_1 ; Plane was crashed
                CMP     #_0|_C_BLUE     ; avoid an underflow for the altitude
                BCS     loc_16CE
                INC     SC_STATUS_LINE.line_1.altitude_digit_1

loc_16CE:                               ; CODE XREF: TURN+73↑j
                LDA     #80
                LDX     #AUDIO_CONTROL_VOL_15|AUDIO_CONTROL_DIST_1
                JSR     XXX             ; Start Audio 3 sound effect
                JSR     ABA             ; Save current color palette, because we start the flashing animation
                LDA     #22
                STA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                JSR     AFP             ; Remove all missles, bullets, etc. – reset variables related to this
                LDY     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                JSR     HG              ; Remove plane bullet
                LDA     #SETVBV_VVBLKD
                LDX     #>XSND          ; Deferred interrupt for sound
                LDY     #<XSND          ; Deferred interrupt for sound
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                LDA     byte_654
                BEQ     _20

_4:                                     ; CODE XREF: TURN+B5↓j
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LDX     #9

_3:                                     ; CODE XREF: TURN+AE↓j
                LDA     P1,Y            ; Player Plane (BLACK parts)
                STA     P0+$FF,Y        ; Player Plane (WHITE parts)
                INY
                DEX
                BNE     _3
                DEC     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                DEC     byte_654
                BNE     _4
                LDX     byte_655
                BNE     _20
                STX     HPOSP3          ; Enemy (Horizontal Position – second color)
                STX     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                JSR     S100__SCORE_ADD_100 ; Score: add 100
                JMP     _2
; ---------------------------------------------------------------------------

_20:                                    ; CODE XREF: TURN+A0↑j
                                        ; TURN+BA↑j
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_2|_C_BLUE
                BCC     _2
                LDA     byte_C5
                BEQ     _2
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                ADC     #3
                STA     byte_623
                LDA     PLANE_VERT_POS  ; Vertical Position of the Plane
                STA     byte_FA
                JSR     AFP             ; Remove all missles, bullets, etc. – reset variables related to this
                LDA     #120
                STA     byte_639

_2:                                     ; CODE XREF: TURN+C5↑j
                                        ; TURN+CD↑j ...
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.speed_digit_100
                STA     SC_STATUS_LINE.line_1.speed_digit_10
                STA     SC_STATUS_LINE.line_1.speed_digit_1
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_2.field_14 ; "*" character
                STA     AUDC1           ; Audio 1 Channel Control Register
                STA     AUDC4           ; Audio 4 Channel Control Register
                CPX     #0
                BNE     AFQ
                JSR     DG

AFQ:                                    ; CODE XREF: TURN+FE↑j
                LDX     #12
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane

_10:                                    ; CODE XREF: TURN+112↓j
                LDA     XPL1IM,X        ; plane explosion
                STA     P0+$A,Y         ; Player Plane (WHITE parts)
                STA     P1+$A,Y         ; Player Plane (BLACK parts)
                DEY
                DEX
                BPL     _10
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     byte_FE
                PLA
                PLA
                LDA     #80
                STA     CRASH_EXPLOSION_COUNTER ; Duration counter for the plane explosion

_11:                                    ; CODE XREF: TURN+135↓j
                JSR     CRSH
                JSR     XFLSH           ; Flash the screen colors after e.g. a crash
                JSR     XPLSN
                JSR     SPLASH          ; Splash sound effect on channel 2
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JSR     XSHIP
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                DEC     CRASH_EXPLOSION_COUNTER ; Duration counter for the plane explosion
                BNE     _11

                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                STA     PCOLR0          ; P0 COLOR
                STA     PCOLR1          ; P1 COLOR
                JSR     SK
                LDY     byte_FD
                CPY     #15
                BNE     _30
                STA     PCOLR2          ; P2 COLOR

_30:                                    ; CODE XREF: TURN+149↑j
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                ADC     #2
                STA     HPOSP0          ; Player Plane (Horizontal Position – first color)
                LDA     #64
                STA     TEMP_B0

_15:                                    ; CODE XREF: TURN+15E↓j
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                DEC     TEMP_B0
                BNE     _15
                LDA     byte_655
                BEQ     _6
                LDA     COLOR1
                CMP     #COLOR_INTENSITY_4|COLOR_LIGHT_BLUE
                BNE     _7
                LDA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                CMP     #10b
                BEQ     _8
                JMP     _7
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: TURN+163↑j
                LDX     #0
                STX     HPOSP2          ; Enemy (Horizontal Position – first color)

_8:                                     ; CODE XREF: TURN+171↑j
                STX     HPOSP1          ; Player Plane (Horizontal Position – second color)
                STX     HPOSP0          ; Player Plane (Horizontal Position – first color)

_7:                                     ; CODE XREF: TURN+16A↑j
                                        ; TURN+173↑j
                JSR     RNKX__PRINT_RANK_CLASS ; Print Rank Class on screen
                LDA     #251
                STA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                STA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)

_86:                                    ; CODE XREF: TURN+18F↓j
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                LDA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                BNE     _86
                LDA     #1
                STA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                JMP     START
; End of function TURN


; =============== S U B R O U T I N E =======================================

; Draw trees into the map. Needs to be the last draw function to be called.

DRTR__DRAW_TREE:                        ; CODE XREF: EB+6↑p
                                        ; COMMON+16↑p ...
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     EN              ; 6 trees per row
                RTS
; ---------------------------------------------------------------------------

EN:                                     ; CODE XREF: DRTR__DRAW_TREE+2↑j
                LDX     #6              ; 6 trees per row
                STX     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling

EO:                                     ; CODE XREF: DRTR__DRAW_TREE+37↓j
                LDY     TREE_POS_BUF-1,X ; Position of trees
                BEQ     EP
                LDA     #0
                STA     TREE_POS_BUF-1,X ; Position of trees

                LDA     RANDOM          ; Set random top-right part of a tree at Y
                LSR     A
                BCC     EQ
                LDA     #L_TREE_TOP_RIGHT_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     ER              ; Set random top-left part of a tree at Y-1
; ---------------------------------------------------------------------------

EQ:                                     ; CODE XREF: DRTR__DRAW_TREE+17↑j
                LDA     #L_TREE_TOP_RIGHT_B|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

ER:                                     ; CODE XREF: DRTR__DRAW_TREE+1D↑j
                DEY                     ; Set random top-left part of a tree at Y-1
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     ES
                LDA     #L_TREE_TOP_LEFT_B|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     EP
; ---------------------------------------------------------------------------

ES:                                     ; CODE XREF: DRTR__DRAW_TREE+29↑j
                LDA     #L_TREE_TOP_LEFT_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

EP:                                     ; CODE XREF: DRTR__DRAW_TREE+C↑j
                                        ; DRTR__DRAW_TREE+2F↑j
                DEX
                BNE     EO              ; => next tree

                LDA     byte_B6
                BEQ     FH              ; => Return
                CMP     #255
                BNE     EM

EL:                                     ; CODE XREF: DRTR__DRAW_TREE+46↓j
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                BEQ     EL
                SEC
                SBC     #1
                BNE     EM

FH:                                     ; CODE XREF: DRTR__DRAW_TREE+3B↑j
                                        ; DRTR__DRAW_TREE+69↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

EM:                                     ; CODE XREF: DRTR__DRAW_TREE+3F↑j
                                        ; DRTR__DRAW_TREE+4B↑j
                TAX
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CLC
                ADC     #2
                STA     TREE_PLANT_MAX_X ; max. X position for planing trees in a row
                SEC
                SBC     #25
                BPL     ET
                LDA     #0

ET:                                     ; CODE XREF: DRTR__DRAW_TREE+5A↑j
                STA     TREE_PLANT_MIN_X ; min. X position for planing trees in a row

                LDA     #25
                STA     TREE_PLANT_TRY_COUNT ; Try up to 25 times to find a position for a tree in a row

EF:                                     ; CODE XREF: DRTR__DRAW_TREE+72↓j
                                        ; DRTR__DRAW_TREE+7E↓j ...
                DEC     TREE_PLANT_TRY_COUNT ; search for next spot for a tree
                BEQ     FH              ; => Return
                LDA     RANDOM          ; Random Number Generator
                AND     #63
                CMP     #62             ; too large for the line?
                BCS     EF              ; => yes, next
                CMP     TREE_PLANT_MAX_X ; max. X position for planing trees in a row
                BCS     EG              ; Found a position A
                CMP     TREE_PLANT_MIN_X ; min. X position for planing trees in a row
                BCC     EG              ; Found a position A
                JMP     EF              ; search for next spot for a tree
; ---------------------------------------------------------------------------

EG:                                     ; CODE XREF: DRTR__DRAW_TREE+77↑j
                                        ; DRTR__DRAW_TREE+7C↑j
                TAY                     ; Found a position A
                LDA     #L_GRAS|L_C_0
                CMP     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                BNE     EF              ; search for next spot for a tree
                INY
                CMP     (VBL_NEXT_ROW_PTR),Y ; require 3 tiles of gras to use that area
                BNE     EF              ; search for next spot for a tree
                INY
                CMP     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                BNE     EF              ; search for next spot for a tree

                LDA     RANDOM          ; Set random bottom-right part of a tree at Y
                LSR     A
                BCC     EH
                LDA     #L_TREE_BOTTOM_RIGHT_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     EI              ; Set random bottom-left part of a tree at Y-1
; ---------------------------------------------------------------------------

EH:                                     ; CODE XREF: DRTR__DRAW_TREE+96↑j
                LDA     #L_TREE_BOTTOM_RIGHT_B|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

EI:                                     ; CODE XREF: DRTR__DRAW_TREE+9C↑j
                DEY                     ; Set random bottom-left part of a tree at Y-1
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     EJ
                LDA     #L_TREE_BOTTOM_LEFT_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     EK
; ---------------------------------------------------------------------------

EJ:                                     ; CODE XREF: DRTR__DRAW_TREE+A8↑j
                LDA     #L_TREE_BOTTOM_LEFT_B|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

EK:                                     ; CODE XREF: DRTR__DRAW_TREE+AE↑j
                TYA
                STA     TREE_POS_BUF-1,X ; Position of trees
                DEX
                BNE     EF              ; search for next spot for a tree
                RTS
; End of function DRTR__DRAW_TREE


; =============== S U B R O U T I N E =======================================


DG:                                     ; CODE XREF: TURN+100↑p
                                        ; COLM02+4D↓p
                LDX     #12
                LDY     ENEMY_Y_POS     ; Enemy Y position

_1:                                     ; CODE XREF: DG+C↓j
                LDA     XPL1IM,X        ; plane explosion
                STA     P2+$A,Y         ; Enemy (first color)
                DEY
                DEX
                BNE     _1
                RTS
; End of function DG


; =============== S U B R O U T I N E =======================================


CRSH:                                   ; CODE XREF: TURN:_11↑p
                LDA     CRASH_EXPLOSION_COUNTER ; Duration counter for the plane explosion
                LSR     A
                LSR     A
                LSR     A
                PHP
                BCC     _1
                INC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                DEC     byte_FE
                LDX     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STX     HPOSP0          ; Player Plane (Horizontal Position – first color)
                LDX     byte_FE
                JMP     _2
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: CRSH+6↑j
                DEC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                INC     byte_FE
                LDX     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STX     HPOSP0          ; Player Plane (Horizontal Position – first color)
                LDX     byte_FE

_2:                                     ; CODE XREF: CRSH+13↑j
                STX     HPOSP1          ; Player Plane (Horizontal Position – second color)
                PLP
                BCC     _3
                LDA     #COLOR_INTENSITY_0|COLOR_RED_ORANGE
                JMP     _4
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: CRSH+25↑j
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE

_4:                                     ; CODE XREF: CRSH+29↑j
                STA     PCOLR0          ; P0 COLOR
                STA     PCOLR1          ; P1 COLOR
; End of function CRSH


; =============== S U B R O U T I N E =======================================


SK:                                     ; CODE XREF: TURN+142↑p
                LDY     byte_655
                BNE     _1              ; => Return
                STA     PCOLR2          ; P2 COLOR

_1:                                     ; CODE XREF: SK+3↑j
                RTS                     ; => Return
; End of function SK


; =============== S U B R O U T I N E =======================================

; Draw a ship onto the map

DRBT__DRAW_BOAT:                        ; CODE XREF: SRT+6↑p
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     GV
                RTS
; ---------------------------------------------------------------------------

GV:                                     ; CODE XREF: DRBT__DRAW_BOAT+2↑j
                LDY     RIVER_BOAT_ROW_FLAG ; !=0 boat top row drawn, ==0 boat bottom row drawn
                BNE     HB              ; Draw 2nd row of the river boat (the top one)
                LDA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                BEQ     GX
                DEC     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                RTS
; ---------------------------------------------------------------------------

GX:                                     ; CODE XREF: DRBT__DRAW_BOAT+D↑j
                LDA     byte_FE
                CMP     #5
                BCS     GY
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #58
                BCS     GY
                CMP     #31
                BCC     GY
                LDA     #15
                STA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                RTS
; ---------------------------------------------------------------------------

GY:                                     ; CODE XREF: DRBT__DRAW_BOAT+17↑j
                                        ; DRBT__DRAW_BOAT+1D↑j ...
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                SEC
                SBC     #4              ; Ship is near the right riverbank
                TAY
                CLC
                ADC     #6
                JSR     A2
                LDA     #L_FIXED_BOAT_BOTTOM_RIGHT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDA     #L_FIXED_BOAT_BOTTOM_LEFT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                STY     RIVER_BOAT_ROW_FLAG ; !=0 boat top row drawn, ==0 boat bottom row drawn
                STA     byte_BF
                STA     byte_661
                RTS
; ---------------------------------------------------------------------------
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

HB:                                     ; CODE XREF: DRBT__DRAW_BOAT+8↑j
                LDA     #L_FIXED_BOAT_TOP_RIGHT|L_C_1 ; Draw 2nd row of the river boat (the top one)
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDA     #L_FIXED_BOAT_TOP_LEFT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #0
                STA     RIVER_BOAT_ROW_FLAG ; !=0 boat top row drawn, ==0 boat bottom row drawn

                LDA     RANDOM          ; Random Number Generator
                ORA     #16
                AND     #31
                STA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                LDA     #2
                STA     RIVER_BOAT_HIT_COUNTER ; The boat requires 2 hits to be destroyed
                RTS
; End of function DRBT__DRAW_BOAT


; =============== S U B R O U T I N E =======================================

; Trigger machine gun

TRIG__TRIGGER_MACHINE_GUN:              ; CODE XREF: COMMON+36↑p
                LDY     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                BNE     HE
                LDA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                BNE     HH              ; => button is not pressed
                LDA     SC_STATUS_LINE.line_0.machine_gun_damaged ; "G" character
                BEQ     HF              ; => gun is not damaged
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                BEQ     HF              ; 1/32 chance (3%) for the gun to still work

HH:                                     ; CODE XREF: TRIG__TRIGGER_MACHINE_GUN+6↑j
                                        ; TRIG__TRIGGER_MACHINE_GUN+1A↓j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

HF:                                     ; CODE XREF: TRIG__TRIGGER_MACHINE_GUN+B↑j
                                        ; TRIG__TRIGGER_MACHINE_GUN+12↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     DIRECTION_A
                BEQ     HH              ; => Return
                LDA     byte_620
                BPL     HH              ; => Return
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CLC
                ADC     #6
                STA     PLANE_BULLET_X_POS ; X-Position of the current bullet from the plane
                STA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                LDY     PLANE_VERT_POS  ; Vertical Position of the Plane
                INY
                INY
                STY     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                LDA     #11b
                STA     MISSLE,Y
                STA     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                RTS
; ---------------------------------------------------------------------------

HE:                                     ; CODE XREF: TRIG__TRIGGER_MACHINE_GUN+2↑j
                CPY     #38
                BCC     HG              ; Remove plane bullet
                LDA     PLANE_BULLET_X_POS ; X-Position of the current bullet from the plane
                CMP     #203
                BCS     HG              ; Remove plane bullet
                CLC
                ADC     #8
                STA     PLANE_BULLET_X_POS ; X-Position of the current bullet from the plane
                STA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                LDA     #0
                STA     MISSLE,Y
                LDX     #8

OA:                                     ; CODE XREF: TRIG__TRIGGER_MACHINE_GUN+58↓j
                DEY
                DEX
                BNE     OA
                STY     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                LDA     #11b
                STA     MISSLE,Y
                JSR     SHBT            ; Shoot plane bullet. Check if something was hit.
                RTS
; End of function TRIG__TRIGGER_MACHINE_GUN


; =============== S U B R O U T I N E =======================================

; Remove plane bullet

HG:                                     ; CODE XREF: TURN+8C↑p
                                        ; TRIG__TRIGGER_MACHINE_GUN+3D↑j ...
                LDA     #0
                STA     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                STA     MISSLE,Y
                LDX     #255
                STX     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                RTS
; End of function HG


; =============== S U B R O U T I N E =======================================

; Trigger bomb drop

BOMB:                                   ; CODE XREF: COMMON+39↑p
                                        ; BMBR:_3_↓p ...

; FUNCTION CHUNK AT 1A51 SIZE 0000003C BYTES

                LDY     byte_FA
                BNE     HI
                LDA     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                BNE     HK              ; => Return
                LDA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                BNE     HK              ; => button is not pressed
                LDA     SC_STATUS_LINE.line_0.bomb_gear_damaged ; "B" character
                BEQ     HJ
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                BEQ     HJ

HK:                                     ; CODE XREF: BOMB+6↑j BOMB+A↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

HI:                                     ; CODE XREF: BOMB+2↑j
                JMP     TJ
; ---------------------------------------------------------------------------

HJ:                                     ; CODE XREF: BOMB+F↑j
                                        ; BOMB+16↑j
                STA     byte_6EB
                LDA     byte_6ED
                BEQ     _1
                JSR     AFF

_1:                                     ; CODE XREF: BOMB+22↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     DIRECTION_A
                BNE     HK              ; => Return
                LDA     SC_STATUS_LINE.line_0.bomb_digit_1
                CMP     #_0|_C_BLUE
                BNE     PB
                LDA     SC_STATUS_LINE.line_0.bomb_digit_10
                CMP     #_0|_C_BLUE
                BEQ     HK              ; => Return

PB:                                     ; CODE XREF: BOMB+33↑j
                DEC     SC_STATUS_LINE.line_0.bomb_digit_1
                LDA     SC_STATUS_LINE.line_0.bomb_digit_1
                CMP     #KEYCODE_0-1
                BNE     PC
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_0.bomb_digit_1
                DEC     SC_STATUS_LINE.line_0.bomb_digit_10
; End of function BOMB


; =============== S U B R O U T I N E =======================================


PC:                                     ; CODE XREF: BOMB+44↑j
                                        ; BMBR+60↓p
                LDY     PLANE_HORI_POS  ; Horizontal Position of the Plane
                INY
                INY
                STY     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
                STY     byte_623
                LDA     PLANE_VERT_POS  ; Vertical Position of the Plane
                CLC
                ADC     #7
                STA     byte_FA
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                ADC     #3
                STA     byte_61F
                LDA     #15
                STA     byte_620
                LDA     #SND_FREQ_20
                STA     AUDF2           ; Audio 2 Frequency Register
                STA     AUDIO2_DROPSND_FREQ
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_4
                STA     AUDC2           ; Audio 2 Channel Control Register
                LDA     #0
                STA     AUDIO2_DURATION_COUNTER
                JMP     AFB
; End of function PC

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR BOMB

TJ:                                     ; CODE XREF: BOMB:HI↑j
                CPY     byte_61F
                BPL     AFV

AFU:
                LDA     #0
                STA     MISSLE,Y
                INY
                STY     byte_FA
                LDA     #1100b
                STA     MISSLE+1,Y
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LSR     A
                LSR     A
                BCC     _1_0
                LDA     #0
                STA     MISSLE,Y
                LDA     #1000b
                JMP     _2
; ---------------------------------------------------------------------------

_1_0:                                   ; CODE XREF: BOMB+96↑j
                LDA     #1000b
                STA     MISSLE,Y
                LDA     #0

_2:                                     ; CODE XREF: BOMB+9F↑j
                STA     MISSLE+2,Y
                DEC     byte_620
                JSR     DRPSND          ; Bomb drop sound
                RTS
; ---------------------------------------------------------------------------

AFV:                                    ; CODE XREF: BOMB+83↑j
                STY     byte_639

HL:
                JSR     BMBSHP
                JSR     BMCPTL
; END OF FUNCTION CHUNK FOR BOMB

; =============== S U B R O U T I N E =======================================

; Remove all missles, bullets, etc. – reset variables related to this

AFP:                                    ; CODE XREF: TURN+87↑p
                                        ; TURN+DE↑p
                LDA     #0
                LDY     byte_FA
                STY     CURRENT_TILE_ROW_PTR+1
                STA     AUDC2           ; Audio 2 Channel Control Register
                STY     TEMP_ADR+1
                STA     MISSLE,Y
                STA     MISSLE+1,Y
                STA     MISSLE+2,Y
                STA     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
                STA     EXPLOSION_TILE_ANIMATION
                STA     byte_FA
                LDA     #255
                STA     byte_620
                LDA     byte_623
                STA     TEMP_ADR
                LDA     byte_6C3
                BEQ     _9              ; => Return
                LDA     #0
                STA     byte_6C3
                STA     CURRENT_TILE_ROW_PTR+1

_9:                                     ; CODE XREF: AFP+29↑j
                RTS                     ; => Return
; End of function AFP


; =============== S U B R O U T I N E =======================================


XPLSN:                                  ; CODE XREF: COMMON+30↑p
                                        ; TURN+124↑p ...
                LDA     CURRENT_TILE_ROW_PTR+1
                BNE     HM
                RTS
; ---------------------------------------------------------------------------

HN:                                     ; CODE XREF: XPLSN+B↓j
                JMP     ID
; ---------------------------------------------------------------------------

HM:                                     ; CODE XREF: XPLSN+2↑j
                LDA     EXPLOSION_TILE_ANIMATION
                BNE     HN
                JSR     ADA             ; Convert a X/Y position into an address to screen memory
                STY     VAR_EXPLOSION_X_POS

ADB:
                LDA     TEMP_ADR
                STA     CURRENT_TILE_ROW_PTR
                LDA     TEMP_ADR+1
                STA     CURRENT_TILE_ROW_PTR+1

                LDA     DL+3,X
                STA     TEMP_NEXT_ROW_PTR
                LDA     DL+4,X
                STA     TEMP_NEXT_ROW_PTR+1
                LDA     DL-3,X
                STA     TEMP_PREVIOUS_ROW_PTR
                LDA     DL-2,X
                STA     TEMP_PREVIOUS_ROW_PTR+1

                LDA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CKCHAR          ; Check if a tile based target in A was hit
                LDA     (CURRENT_TILE_ROW_PTR),Y
                CMP     #L_BRIDGE_G|L_C_1
                BEQ     HW
                CMP     #L_CLIFF_WATER_C|L_C_0
                BEQ     HT
                CMP     #L_CLIFF_WATER_B2|L_C_0
                BEQ     HT
                CMP     #L_CLIFF_WATER_A|L_C_0
                BEQ     HT
                CMP     #L_WATER_GRAS_B1|L_C_0
                BEQ     HU
                CMP     #L_WATER_GRAS_C2|L_C_0
                BEQ     HU
                CMP     #L_CLIFF_GRAS_A|L_C_0
                BEQ     HX
                CMP     #L_CLIFF_GRAS_B2|L_C_0
                BEQ     HX
                CMP     #L_CLIFF_WATER_B1|L_C_0
                BEQ     HX
                CMP     #L_GRAS_CLIFF_WATER_B|L_C_0
                BEQ     HX
                CMP     #L_GRASS_CLIFF_D|L_C_0
                BEQ     HX
                CMP     #L_GRAS_CLIFF_WATER_A|L_C_0
                BEQ     HX
                CMP     #L_WATER|L_C_0
                BEQ     HW

U3:                                     ; CODE XREF: Z3+87↓j
                LDA     #EXPLOSITION_TARGET_GRAS
                STA     VAR_EXPLOSION_TARGET

HY:                                     ; CODE XREF: HU+B↓j
                LDA     #L_EXPLOSION_GRAS_1|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y

Z7:                                     ; CODE XREF: W1+3↓j Z3+91↓j ...
                LDA     #187
                SBC     byte_639
                LDX     byte_FD
                CPX     #254
                BNE     DT
                LDA     #30

DT:                                     ; CODE XREF: XPLSN+80↑j
                                        ; Z3+33↓j
                STA     EXPLOSION_TILE_ANIMATION

AFE:                                    ; CODE XREF: AFF+8↓j
                LDA     #42
                LDX     #AUDIO_CONTROL_VOL_12|AUDIO_CONTROL_DIST_1
                JMP     XXX             ; Start Audio 3 sound effect
; ---------------------------------------------------------------------------

HW:                                     ; CODE XREF: XPLSN+3C↑j
                                        ; XPLSN+6C↑j ...
                LDA     #L_EXPLOSION_WATER_1|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                LDA     #18
                STA     EXPLOSION_TILE_ANIMATION
; End of function XPLSN


; =============== S U B R O U T I N E =======================================

; Trigger explosion in water with sound

Y8:                                     ; CODE XREF: X8__HIT_BOAT_TR:Y4↓p
                LDA     #EXPLOSITION_TARGET_WATER
                STA     VAR_EXPLOSION_TARGET

SL:                                     ; CODE XREF: BMBSHP+33↓p
                                        ; SHBT+57↓p
                LDA     #0              ; Trigger explosion sound effect
                STA     AUDIO2_FREQ_COUNTER
                STA     AUDF2           ; Audio 2 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_3|AUDIO_CONTROL_DIST_3
                STA     AUDIO2_EFFECT_COUNTER
                STA     AUDC2           ; Audio 2 Channel Control Register
                LDA     #45
                STA     AUDIO2_DURATION_COUNTER
                RTS
; End of function Y8


; =============== S U B R O U T I N E =======================================


HT:                                     ; CODE XREF: XPLSN+40↑j
                                        ; XPLSN+44↑j ...
                INX
                INX
                LDA     DL,X
                STA     CURRENT_TILE_ROW_PTR
                INX
                LDA     DL,X
                STA     CURRENT_TILE_ROW_PTR+1
                JMP     HW
; End of function HT


; =============== S U B R O U T I N E =======================================

; Attributes: thunk

AFD:                                    ; CODE XREF: ID+B↓j
                JMP     HV              ; Explosition in the water
; End of function AFD


; =============== S U B R O U T I N E =======================================


HU:                                     ; CODE XREF: XPLSN+4C↑j
                                        ; XPLSN+50↑j
                INC     CURRENT_TILE_ROW_PTR
                BNE     HX
                INC     CURRENT_TILE_ROW_PTR+1

HX:                                     ; CODE XREF: XPLSN+54↑j
                                        ; XPLSN+58↑j ...
                LDA     #EXPLOSITION_TARGET_2
                STA     VAR_EXPLOSION_TARGET
                JMP     HY
; End of function HU


; =============== S U B R O U T I N E =======================================


ID:                                     ; CODE XREF: XPLSN:HN↑j
                DEC     EXPLOSION_TILE_ANIMATION
                BEQ     HQ
                LDY     VAR_EXPLOSION_X_POS
                LDA     VAR_EXPLOSION_TARGET
                BEQ     AFD
                CMP     #EXPLOSITION_TARGET_BRIDGE
                BEQ     V7
                CMP     #EXPLOSITION_TARGET_BUILDING
                BEQ     ABF
                CMP     #EXPLOSITION_TARGET_SKYSCRAPER
                BEQ     ACK
                CMP     #EXPLOSITION_TARGET_EMPTY_ROAD
                BEQ     X6
                CMP     #EXPLOSITION_TARGET_BOAT
                BEQ     Y5
                CMP     #EXPLOSITION_TARGET_RUNWAY_PLANE
                BEQ     W5
                CMP     #EXPLOSITION_TARGET_AIRPORT_HANGAR
                BEQ     Z4
                CMP     #EXPLOSITION_TARGET_10
                BEQ     AEH
                CMP     #EXPLOSITION_TARGET_15
                BEQ     BD
                LDA     EXPLOSION_TILE_ANIMATION ; 2x1 gras explosion
                LSR     A
                LSR     A
                LSR     A
                BCC     HO
                JMP     HP
; ---------------------------------------------------------------------------

ABF:                                    ; CODE XREF: ID+13↑j
                JMP     ABB             ; Buildings explosion via tile animation
; ---------------------------------------------------------------------------

V7:                                     ; CODE XREF: ID+F↑j
                JMP     V8              ; 2x2 water explosion
; ---------------------------------------------------------------------------

W5:                                     ; CODE XREF: ID+23↑j
                JMP     W6              ; 2x2 runway tile explosion
; ---------------------------------------------------------------------------

X6:                                     ; CODE XREF: ID+1B↑j
                JMP     X7              ; 2x1 street explosion
; ---------------------------------------------------------------------------

Y5:                                     ; CODE XREF: ID+1F↑j
                JMP     Y6              ; 2x2 water explosion
; ---------------------------------------------------------------------------

Z4:                                     ; CODE XREF: ID+27↑j
                JMP     Z5              ; Airport hangar explosion via tile animation
; ---------------------------------------------------------------------------

ACK:                                    ; CODE XREF: ID+17↑j
                JMP     ACL             ; Skyscraper explosition via tile animation
; ---------------------------------------------------------------------------

AEH:                                    ; CODE XREF: ID+2B↑j
                JMP     AEI             ; 2x1 tile explosion wall
; ---------------------------------------------------------------------------

BD:                                     ; CODE XREF: ID+2F↑j
                JMP     XI              ; 2x1 tile explosion in water
; ---------------------------------------------------------------------------

HQ:                                     ; CODE XREF: ID+3↑j
                LDA     #0
                STA     CURRENT_TILE_ROW_PTR+1
                RTS
; ---------------------------------------------------------------------------

HO:                                     ; CODE XREF: ID+37↑j
                LDA     #L_EXPLOSION_GRAS_4|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                LDA     VAR_EXPLOSION_TARGET
                CMP     #EXPLOSITION_TARGET_2
                BEQ     HZ              ; => Return
                JSR     HR              ; Stop bombing, if cliff edge would be hit => return
                LDA     #L_EXPLOSION_GRAS_2|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y

HZ:                                     ; CODE XREF: ID+65↑j ID+78↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

HP:                                     ; CODE XREF: ID+39↑j
                LDA     #L_EXPLOSION_GRAS_1|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                LDA     VAR_EXPLOSION_TARGET
                CMP     #EXPLOSITION_TARGET_2
                BEQ     HZ              ; => Return
                JSR     HR              ; Stop bombing, if cliff edge would be hit => return
                LDA     #L_EXPLOSION_GRAS_3|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; End of function ID


; =============== S U B R O U T I N E =======================================

; Stop bombing, if cliff edge would be hit => return

HR:                                     ; CODE XREF: ID+67↑p ID+7A↑p
                INY
                LDA     (CURRENT_TILE_ROW_PTR),Y
                CMP     #L_GRAS_CLIFF_WATER_A|L_C_0
                BEQ     HS
                RTS
; ---------------------------------------------------------------------------

HS:                                     ; CODE XREF: HR+5↑j
                PLA
                PLA
                RTS
; End of function HR


; =============== S U B R O U T I N E =======================================

; Explosition in the water

HV:                                     ; CODE XREF: AFD↑j
                LDA     EXPLOSION_TILE_ANIMATION
                CMP     #1
                BEQ     IC
                LSR     A
                LSR     A
                LSR     A
                BCC     IA
                JMP     IB
; ---------------------------------------------------------------------------

IA:                                     ; CODE XREF: HV+A↑j
                LDA     #L_EXPLOSION_WATER_2|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

IB:                                     ; CODE XREF: HV+C↑j
                LDA     #L_EXPLOSION_WATER_1|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

IC:                                     ; CODE XREF: HV+5↑j
                LDA     #L_WATER|L_C_0
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; End of function HV


; =============== S U B R O U T I N E =======================================

; 2x2 water explosion

V8:                                     ; CODE XREF: ID:V7↑j
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                LSR     A
                BCC     _1
                LDA     #L_EXPLOSION_WATER_5|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                LDA     #L_EXPLOSION_WATER_6|L_C_1
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CPBT            ; Check if previous tile row is still visible, exit if not
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                DEY
                LDA     #L_EXPLOSION_WATER_5|L_C_1
                STA     (PREVIOUS_TILE_ROW_PTR),Y

_2:                                     ; => Return
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: V8+6↑j
                LDA     #L_EXPLOSION_WATER_3|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                LDA     #L_EXPLOSION_WATER_4|L_C_1
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CPBT            ; Check if previous tile row is still visible, exit if not
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                DEY
                LDA     #L_EXPLOSION_WATER_3|L_C_1
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                RTS
; End of function V8


; =============== S U B R O U T I N E =======================================

; Quake, if enabled, shake the screen via HSCROL.

QUAKE:                                  ; CODE XREF: COMMON+19↑p
                LDA     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                BMI     _1              ; => Return
                DEC     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                LDX     SCROLL_OFFSET_F1 ; HSCROL and VSCROL shadow during gameplay
                BEQ     _1              ; => Return
                DEX
                STX     HSCROL          ; Horizontal Scroll Register

_1:                                     ; CODE XREF: QUAKE+3↑j
                                        ; QUAKE+A↑j
                RTS                     ; => Return
; End of function QUAKE


; =============== S U B R O U T I N E =======================================

; Draw Car or Truck driving left/right

DRP23:                                  ; CODE XREF: SRT+2A↑p
                LDA     byte_FD
                CMP     #1
                BNE     IR              ; => Return
                JSR     XP23
                JSR     SHP23
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_6
                BEQ     IO
                CMP     #UNKNOWNS_STATE_3
                BEQ     IP
                CMP     #UNKNOWNS_STATE_4
                BEQ     IQ

IR:                                     ; CODE XREF: DRP23+4↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

JW:                                     ; CODE XREF: DRP23+47↓j
                JMP     KC              ; Truck driving left/right
; ---------------------------------------------------------------------------

IP:                                     ; CODE XREF: DRP23+15↑j
                JMP     IZ
; ---------------------------------------------------------------------------

IQ:                                     ; CODE XREF: DRP23+19↑j
                JMP     JE
; ---------------------------------------------------------------------------

IO:                                     ; CODE XREF: DRP23+11↑j
                LDA     VBL_DRAW_DOWN_COUNTER ; VBL: 30Hz down counter whenever the level scrolls a pixel
                BEQ     IS
                RTS
; ---------------------------------------------------------------------------

IS:                                     ; CODE XREF: DRP23+28↑j
                LDY     #12
                STY     ENEMY_Y_POS     ; Enemy Y position
                LDA     byte_C4
                BNE     P8
                LDA     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                STA     PCOLR2          ; P2 COLOR
                DEC     byte_C4
                LDA     RANDOM          ; Random Number Generator
                JMP     P9
; ---------------------------------------------------------------------------

P8:                                     ; CODE XREF: DRP23+31↑j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     IT
                LSR     A
                BCC     JW
                LDX     #COLOR_INTENSITY_2|COLOR_LIGHT_BLUE
                STX     PCOLR2          ; P2 COLOR
                LSR     A
                BCC     IU

IY:                                     ; CODE XREF: DRP23+A7↓j
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     #90
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDX     #5

IV:                                     ; CODE XREF: DRP23+70↓j
                LDA     CARRT-1,X       ; car driving right
                STA     P2+4,Y          ; Enemy (first color)
                LDA     TYRRT-1,X       ; car tyres driving right
                STA     P3+5,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     IV
                LDA     #UNKNOWNS_STATE_3
                STA     VAR_UNKNOWN_STATE
                RTS
; ---------------------------------------------------------------------------

IU:                                     ; CODE XREF: DRP23+4F↑j
                                        ; DRP23+A5↓j
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     #210
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDX     #5

IW:                                     ; CODE XREF: DRP23+97↓j
                LDA     CARLT-1,X       ; car driving left
                STA     P2+4,Y          ; Enemy (first color)
                LDA     TYRLT-1,X       ; car tyres driving left
                STA     P3+5,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     IW
                LDA     #UNKNOWNS_STATE_4
                STA     VAR_UNKNOWN_STATE
                RTS
; ---------------------------------------------------------------------------

IT:                                     ; CODE XREF: DRP23+44↑j
                LDX     #COLOR_INTENSITY_2|COLOR_GOLD
                STX     PCOLR2          ; P2 COLOR

P9:                                     ; CODE XREF: DRP23+3D↑j
                LSR     A
                BCC     IU
                JMP     IY
; ---------------------------------------------------------------------------

IZ:                                     ; CODE XREF: DRP23:IP↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #194
                BCC     JN

JG:                                     ; CODE XREF: DRP23+E9↓j
                                        ; BMBSHP+D4↓j
                LDX     #11
                LDA     #0

JB:                                     ; CODE XREF: DRP23+BC↓j
                STA     P2-1,Y          ; Enemy (first color)
                STA     P3,Y            ; Enemy (second color)
                INY
                DEX
                BNE     JB
                LDA     #0
                STA     byte_FD
                RTS
; ---------------------------------------------------------------------------

JN:                                     ; CODE XREF: DRP23+AE↑j
                                        ; DRP23+F6↓j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     JC
                RTS
; ---------------------------------------------------------------------------

JC:                                     ; CODE XREF: DRP23+C7↑j
                LDX     #8
                LDY     ENEMY_Y_POS     ; Enemy Y position

JD:                                     ; CODE XREF: DRP23+DC↓j
                LDA     P2+4,Y          ; Enemy (first color)
                STA     P2+6,Y          ; Enemy (first color)
                LDA     P3+5,Y          ; Enemy (second color)
                STA     P3+7,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     JD
                INC     ENEMY_Y_POS     ; Enemy Y position
                INC     ENEMY_Y_POS     ; Enemy Y position
                RTS
; ---------------------------------------------------------------------------

JE:                                     ; CODE XREF: DRP23:IQ↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #194
                BCC     JF
                JMP     JG
; ---------------------------------------------------------------------------

JF:                                     ; CODE XREF: DRP23+E7↑j
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                JMP     JN
; ---------------------------------------------------------------------------

KC:                                     ; CODE XREF: DRP23:JW↑j
                LSR     A               ; Truck driving left/right
                BCC     JX
                LDX     #COLOR_INTENSITY_10|COLOR_GRAY
                STX     PCOLR2          ; P2 COLOR
                JMP     JY
; ---------------------------------------------------------------------------

JX:                                     ; CODE XREF: DRP23+FA↑j
                LDX     #COLOR_INTENSITY_12|COLOR_ORANGE
                STX     PCOLR2          ; P2 COLOR

JY:                                     ; CODE XREF: DRP23+101↑j
                LSR     A
                BCC     JZ
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     #90
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDX     #6

KA:                                     ; CODE XREF: DRP23+12B↓j
                LDA     TRRT-1,X        ; truck driving right
                STA     P2+5,Y          ; Enemy (first color)
                LDA     TYRTRR-1,X      ; truck tyres driving right
                STA     P3+6,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     KA
                LDA     #UNKNOWNS_STATE_3
                STA     VAR_UNKNOWN_STATE
                RTS
; ---------------------------------------------------------------------------

JZ:                                     ; CODE XREF: DRP23+10A↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     #210
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDX     #6

KB:                                     ; CODE XREF: DRP23+152↓j
                LDA     TRLT-1,X        ; truck driving left
                STA     P2+5,Y          ; Enemy (first color)
                LDA     TYRTRL-1,X      ; truck tyres driving left
                STA     P3+6,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     KB
                LDA     #UNKNOWNS_STATE_4
                STA     VAR_UNKNOWN_STATE
                RTS
; End of function DRP23


; =============== S U B R O U T I N E =======================================


COLP02:                                 ; CODE XREF: LF+3↓p L6+EF↓p ...
                LDA     P2PL            ; Player Graphics Register 1
                AND     #1              ; Collision with the player? (White color only)
                CMP     #1
                BEQ     AS

AT:                                     ; CODE XREF: COLP02+1F↓j
                STA     byte_654
                RTS
; ---------------------------------------------------------------------------

AS:                                     ; CODE XREF: COLP02+7↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                SBC     #6
                STA     byte_654
                LDA     byte_C2
                SBC     ENEMY_Y_POS     ; Enemy Y position
                SBC     byte_654
                CMP     #12
                BCS     AT
                LDA     #0
                STA     byte_655
                JMP     CRASH           ; Plane was crashed
; End of function COLP02


; =============== S U B R O U T I N E =======================================

; Fixup Altitude display to make sure that all digits are correct. This can be necessary, because the last digit can over/underflow when in/decremented somewhere else.

ALT__ALTITUDE_DISPLAY_FIXUP:            ; CODE XREF: COMMON+5A↑p
                LDA     SC_STATUS_LINE.line_1.altitude_digit_1
                CMP     #_COLON|_C_BLUE
                BEQ     KG
                CMP     #_0|_C_BLUE
                BCC     KI
                RTS
; ---------------------------------------------------------------------------

KG:                                     ; CODE XREF: ALT__ALTITUDE_DISPLAY_FIXUP+5↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.altitude_digit_1
                INC     SC_STATUS_LINE.line_1.altitude_digit_10
                LDA     SC_STATUS_LINE.line_1.altitude_digit_10
                CMP     #_COLON|_C_BLUE
                BEQ     KH
                RTS
; ---------------------------------------------------------------------------

KH:                                     ; CODE XREF: ALT__ALTITUDE_DISPLAY_FIXUP+19↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.altitude_digit_10
                LDA     #_1|_C_BLUE
                STA     SC_STATUS_LINE.line_1.altitude_digit_100
                RTS
; ---------------------------------------------------------------------------

KI:                                     ; CODE XREF: ALT__ALTITUDE_DISPLAY_FIXUP+9↑j
                CLC
                ADC     #10
                STA     SC_STATUS_LINE.line_1.altitude_digit_1
                DEC     SC_STATUS_LINE.line_1.altitude_digit_10
                LDA     SC_STATUS_LINE.line_1.altitude_digit_10
                CMP     #_QUESTIONMARK|_C_BLUE
                BEQ     KJ
                RTS
; ---------------------------------------------------------------------------

KJ:                                     ; CODE XREF: ALT__ALTITUDE_DISPLAY_FIXUP+35↑j
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_1.altitude_digit_10
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.altitude_digit_100
                RTS
; End of function ALT__ALTITUDE_DISPLAY_FIXUP


; =============== S U B R O U T I N E =======================================

; Draw a bridge over water

DRBR__DRAW_BRIDGE:                      ; CODE XREF: SRT+3↑p

; FUNCTION CHUNK AT 1EF7 SIZE 000000D4 BYTES

                LDA     byte_FE
                BEQ     FJ

GQ:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+7↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

FJ:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+2↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     GQ              ; => Return

LV:                                     ; Right position of the river
                LDY     RIVER_RIGHT_X_POS
                CPY     #54
                BCS     FL
                CPY     #34
                BCC     FM
                LDA     MAP_RIVER_DIR   ; Direction of the river
                CMP     #DIR_RIVER_STRAIGHT
                BEQ     FN
                RTS
; ---------------------------------------------------------------------------

FL:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+D↑j
                LDA     #3
                STA     byte_610
                RTS
; ---------------------------------------------------------------------------

FM:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+11↑j
                LDA     #4
                STA     byte_610
                RTS
; ---------------------------------------------------------------------------

FN:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+18↑j
                DEC     RIVER_BRIDGE_ROW
                LDA     byte_61B
                BEQ     GU
                LDA     RIVER_BRIDGE_ROW
                CMP     #2
                BNE     GU
                DEC     RIVER_BRIDGE_ROW

GU:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+2C↑j
                                        ; DRBR__DRAW_BRIDGE+32↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                LDA     RIVER_BRIDGE_ROW
                BEQ     GL
                CMP     #1
                BEQ     FO
                CMP     #2
                BEQ     FP
                CMP     #3
                BEQ     JI
                CMP     #4
                BEQ     FR
                CMP     #5
                BEQ     FS
                LDA     #0
                STA     byte_B6
                LDA     #8
                STA     MAP_RIVER_LENGTH ; Length of a certain river feature to continue (straight, turn left/right)
                RTS
; ---------------------------------------------------------------------------

FP:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+42↑j
                JMP     GS
; ---------------------------------------------------------------------------

JI:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+46↑j
                JMP     JH
; ---------------------------------------------------------------------------

FO:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+3E↑j
                JMP     FQ
; ---------------------------------------------------------------------------

GL:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+3A↑j
                LDA     #255
                STA     byte_B6
                LDA     #2
                STA     byte_6F2
                LDA     RANDOM          ; Random Number Generator
                ORA     #32
                AND     #63
                STA     byte_FE
                LDA     byte_C4
                CMP     #5
                BNE     LX              ; => Return
                LDA     #PRIMARY_TARGET_SUBTYPE_BRIDGE
                STA     VAR_PRIMARY_TARGET_SUBTYPE
                LDY     #22
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                SEC
                SBC     #1
                JMP     GNSGHT
; ---------------------------------------------------------------------------

LX:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+79↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

FS:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+4E↑j
                INY
                INY
                LDX     #25

FT:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+96↓j
                LDA     BR1-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     FT
                STX     byte_BF
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CLC
                ADC     #9
; End of function DRBR__DRAW_BRIDGE


; =============== S U B R O U T I N E =======================================


A2:                                     ; CODE XREF: DRBT__DRAW_BOAT+32↑p
                                        ; B5+B↓p ...
                ASL     A
                ASL     A
                STA     MISSLE_3_X_POS2
                STA     byte_661
                LDA     #50
                STA     byte_664
                LDA     #45
                STA     byte_65D
                RTS
; End of function A2

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR DRBR__DRAW_BRIDGE

FR:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+4A↑j
                JSR     RND7            ; Return random number 3 or 7 into register X
                STX     byte_617
                LDA     #L_RUNWAY_CENTER|L_C_1

FW:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+BE↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                DEX
                BNE     FW
                JSR     RND7            ; Return random number 3 or 7 into register X
                STX     byte_618
                LDA     #L_BRIDGE_M|L_C_1

FY:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+D0↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                CPY     #64
                BEQ     FX
                DEX
                BNE     FY
                LDA     #L_BRIDGE_N|L_C_1

FZ:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+D9↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                CPY     #64
                BNE     FZ

FX:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+CD↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                DEY
                LDX     #$15

GA:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+E7↓j
                LDA     BR2-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     GA
                JSR     RND7            ; Return random number 3 or 7 into register X
                STX     byte_619
                LDA     #L_RUNWAY_CENTER|L_C_1

GB:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+F5↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     GB
                JSR     RND7            ; Return random number 3 or 7 into register X
                STX     byte_61A
                LDA     #L_BRIDGE_M|L_C_1

GC:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+105↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BEQ     GD              ; => Return
                DEX
                BNE     GC
                LDA     #L_BRIDGE_N|L_C_1

GE:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+10C↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BNE     GE

GD:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+102↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

FQ:                                     ; CODE XREF: DRBR__DRAW_BRIDGE:FO↑j
                TYA
                CLC
                ADC     byte_617
                TAY
                LDA     #L_BRIDGE_K|L_C_1
                LDX     byte_618

GF:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+122↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                CPY     #65
                BEQ     GR
                DEX
                BNE     GF
                LDA     #L_BRIDGE_L|L_C_1

GG:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+12B↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                CPY     #65
                BNE     GG

GR:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+11F↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                LDX     #21

GH:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+138↓j
                DEY
                LDA     BR3-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEX
                BNE     GH
                TYA
                SEC
                SBC     byte_619
                TAY
                LDX     byte_61A
                LDA     #L_BRIDGE_K|L_C_1

GJ:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+14B↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BEQ     GI              ; => Return
                DEX
                BNE     GJ
                LDA     #L_BRIDGE_L|L_C_1

GK:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+152↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BNE     GK

GI:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+148↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

GS:                                     ; CODE XREF: DRBR__DRAW_BRIDGE:FP↑j
                                        ; DRBR__DRAW_BRIDGE+16E↓j ...
                LDY     #64
                LDA     #L_RUNWAY_CENTER|L_C_1

GT:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+15C↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BNE     GT
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                DEY
                LDX     #20
                LDA     #L_SKYSCRAPER_B_5B|L_C_1

T4:                                     ; CODE XREF: DRBR__DRAW_BRIDGE+169↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     T4
                RTS
; ---------------------------------------------------------------------------

JH:                                     ; CODE XREF: DRBR__DRAW_BRIDGE:JI↑j
                LDA     byte_FD
                BNE     GS
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                BEQ     GS
                LDA     #UNKNOWNS_STATE_6
                STA     VAR_UNKNOWN_STATE
                STA     VBL_DRAW_DOWN_COUNTER ; VBL: 30Hz down counter whenever the level scrolls a pixel
                LDA     #1
                STA     byte_FD
                JMP     GS
; END OF FUNCTION CHUNK FOR DRBR__DRAW_BRIDGE

; =============== S U B R O U T I N E =======================================

; Return random number 3 or 7 into register X

RND7:                                   ; CODE XREF: DRBR__DRAW_BRIDGE:FR↑p
                                        ; DRBR__DRAW_BRIDGE+C0↑p ...
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                ORA     #3
                TAX
                RTS
; End of function RND7


; =============== S U B R O U T I N E =======================================

; Change the speed of the plane up/down based on the joystick

SPD__SPEED_CHANGE:                      ; CODE XREF: SRT+30↑p
                                        ; TAKOF__TAKEOFF_LOOP+25↓p ...
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BEQ     PD
                LDA     STICK0          ; JOYSTICK 0 RAM CELL
                CMP     #JOYSTICK_UP_RIGHT
                BEQ     KL              ; Increment speed by 1, if not already 300

PD:                                     ; CODE XREF: SPD__SPEED_CHANGE+3↑j
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_2|_C_BLUE
                BCC     KT              ; Increment speed by 1
                CMP     #_3|_C_BLUE
                BEQ     KN              ; Decrement speed by 1 with little delay
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #_1|_C_BLUE
                BCS     KN              ; Decrement speed by 1 with little delay
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #_1|_C_BLUE
                BCS     KN              ; Decrement speed by 1 with little delay

KO:                                     ; CODE XREF: SPD__SPEED_CHANGE+2B↓j
                                        ; SPD__SPEED_CHANGE+30↓j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

KL:                                     ; CODE XREF: SPD__SPEED_CHANGE+A↑j
                LDA     SC_STATUS_LINE.line_1.speed_digit_100 ; Increment speed by 1, if not already 300
                CMP     #_3|_C_BLUE     ; Speed already 300?
                BEQ     KO              ; => Return

KM:                                     ; Increment speed by 1 with little delay
                DEC     SPEED_DELAY_COUNTER
                BNE     KO              ; => Return
                LDA     #2
                STA     SPEED_DELAY_COUNTER ; Limit speed increment/decrement changes with this counter

KT:                                     ; CODE XREF: SPD__SPEED_CHANGE+11↑j
                INC     SC_STATUS_LINE.line_1.speed_digit_1 ; Increment speed by 1
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #ATASCI_9+1
                BEQ     KP
                RTS
; ---------------------------------------------------------------------------

KP:                                     ; CODE XREF: SPD__SPEED_CHANGE+3F↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.speed_digit_1
                INC     SC_STATUS_LINE.line_1.speed_digit_10
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #ATASCI_9+1
                BEQ     KQ
                RTS
; ---------------------------------------------------------------------------

KQ:                                     ; CODE XREF: SPD__SPEED_CHANGE+4F↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_1.speed_digit_10
                INC     SC_STATUS_LINE.line_1.speed_digit_100
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                STA     SC_STATUS_LINE.line_1.speed_digit_100
                RTS
; ---------------------------------------------------------------------------

KN:                                     ; CODE XREF: SPD__SPEED_CHANGE+15↑j
                                        ; SPD__SPEED_CHANGE+1C↑j ...
                DEC     SPEED_DELAY_COUNTER ; Decrement speed by 1 with little delay
                BNE     KO              ; => Return
                LDA     #2
                STA     SPEED_DELAY_COUNTER ; Limit speed increment/decrement changes with this counter

MM:                                     ; CODE XREF: STOPL:ML↓j
                DEC     SC_STATUS_LINE.line_1.speed_digit_1 ; Decrement speed by 1
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #ATASCI_0-1
                BEQ     KR
                RTS
; ---------------------------------------------------------------------------

KR:                                     ; CODE XREF: SPD__SPEED_CHANGE+73↑j
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_1.speed_digit_1
                DEC     SC_STATUS_LINE.line_1.speed_digit_10
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #ATASCI_0-1
                BEQ     KS
                RTS
; ---------------------------------------------------------------------------

KS:                                     ; CODE XREF: SPD__SPEED_CHANGE+83↑j
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_1.speed_digit_10
                DEC     SC_STATUS_LINE.line_1.speed_digit_100
                RTS
; End of function SPD__SPEED_CHANGE


; =============== S U B R O U T I N E =======================================

; When enabled, apply gravity to the plane

GRAV__APPLY_GRAVITY:                    ; CODE XREF: COMMON+42↑p
                LDA     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                BEQ     FK              ; => Return
                LDA     STICK0          ; JOYSTICK 0 RAM CELL
                CMP     DIRECTION_A
                BEQ     FK              ; => Return
                CMP     DIRECTION_B
                BNE     HD

FK:                                     ; CODE XREF: GRAV__APPLY_GRAVITY+3↑j
                                        ; GRAV__APPLY_GRAVITY+B↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

HD:                                     ; CODE XREF: GRAV__APPLY_GRAVITY+10↑j
                DEC     GRAVITY_COUNT   ; When enabled, this counter pulls the plane down every 40 ticks
                BNE     FK              ; => Return
                LDA     #40
                STA     GRAVITY_COUNT   ; When enabled, this counter pulls the plane down every 40 ticks
                JMP     KK              ; Move Plane down, if possible
; End of function GRAV__APPLY_GRAVITY


; =============== S U B R O U T I N E =======================================


PLFWD:                                  ; CODE XREF: SRT+F↑p CITY+6↓p

; FUNCTION CHUNK AT 2113 SIZE 000000B7 BYTES
; FUNCTION CHUNK AT 21CA SIZE 00000012 BYTES
; FUNCTION CHUNK AT 21ED SIZE 0000002A BYTES

                LDA     byte_FD
                CMP     #3
                BNE     LM              ; => Return
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_10
                BEQ     LF
                CMP     #UNKNOWNS_STATE_11
                BEQ     LF
                CMP     #UNKNOWNS_STATE_7
                BEQ     KW
                CMP     #UNKNOWNS_STATE_8
                BEQ     KD
                JMP     LN
; ---------------------------------------------------------------------------

KW:                                     ; CODE XREF: PLFWD+13↑j
                JMP     LQ
; ---------------------------------------------------------------------------

KD:                                     ; CODE XREF: PLFWD+17↑j
                LDA     byte_C4
                BNE     P4
                LDA     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                STA     PCOLR2          ; P2 COLOR
                DEC     byte_C4
                JMP     P5
; ---------------------------------------------------------------------------

P4:                                     ; CODE XREF: PLFWD+21↑j
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE
                STA     PCOLR2          ; P2 COLOR

P5:                                     ; CODE XREF: PLFWD+2A↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #11111b
                ADC     #170
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                STA     ENEMY_X_POS     ; Enemy X position

                LDY     #15
                STY     byte_C2
                STY     ENEMY_Y_POS     ; Enemy Y position
                LDX     #10

KU:                                     ; CODE XREF: PLFWD+51↓j
                LDA     SHDW-1,X        ; enemy plane shadow flying towards player
                STA     P3+9,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     KU
                INC     VAR_UNKNOWN_STATE
                LDA     RANDOM          ; Random Number Generator
                AND     #11111b
                ORA     #$C
                ADC     #3
                STA     byte_62F
                RTS
; End of function PLFWD


; =============== S U B R O U T I N E =======================================


KV:                                     ; CODE XREF: L6:OY↓j
                LDA     #UNKNOWNS_STATE_7
                STA     VAR_UNKNOWN_STATE
                LDA     #3
                STA     byte_FD

LM:                                     ; CODE XREF: PLFWD+4↑j
                RTS                     ; => Return
; End of function KV


; =============== S U B R O U T I N E =======================================


LF:                                     ; CODE XREF: PLFWD+B↑j
                                        ; PLFWD+F↑j

; FUNCTION CHUNK AT 2113 SIZE 000000B7 BYTES

                JSR     XP2
                JSR     COLP02
                JSR     TRIGF
                JSR     FTURN
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #186
                BCC     LG
; End of function LF


; =============== S U B R O U T I N E =======================================


UZ:                                     ; CODE XREF: PLFWD+9D↓j
                                        ; XP2+4D↓p
                LDA     #0
                LDX     #15

LH:                                     ; CODE XREF: UZ+C↓j
                STA     P2+$C,Y         ; Enemy (first color)
                STA     P3+$B,Y         ; Enemy (second color)
                DEY
                DEX
                BNE     LH
                STA     byte_FD
                RTS
; End of function UZ

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR PLFWD
;   ADDITIONAL PARENT FUNCTION LF

LG:                                     ; CODE XREF: LF+10↑j
                LDA     ENEMY_X_POS     ; Enemy X position
                CMP     #30
                BCS     loc_2123
                LDY     byte_C2
                JSR     LD
                LDY     ENEMY_Y_POS     ; Enemy Y position
                JMP     UZ
; ---------------------------------------------------------------------------

loc_2123:                               ; CODE XREF: PLFWD+94↑j
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_RIGHT
                BEQ     loc_215A
                LDX     #13

loc_212C:                               ; CODE XREF: PLFWD+B7↓j
                LDA     P2+9,Y          ; Enemy (first color)
                STA     P2+$B,Y         ; Enemy (first color)
                LDA     P3+9,Y          ; Enemy (second color)
                STA     P3+$B,Y         ; Enemy (second color)
                DEY
                DEX
                BNE     loc_212C
                INC     ENEMY_Y_POS     ; Enemy Y position
                INC     ENEMY_Y_POS     ; Enemy Y position
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                BNE     loc_215A
                DEC     byte_637
                BNE     loc_214F
                LDA     #4
                STA     byte_637

loc_214F:                               ; CODE XREF: PLFWD+C5↑j
                LDA     byte_637
                CMP     #4
                BEQ     loc_216A
                CMP     #2
                BEQ     loc_2179

loc_215A:                               ; CODE XREF: PLFWD+A5↑j
                                        ; PLFWD+C0↑j ...
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_11
                BEQ     LP
                JSR     LINE            ; Check line of sight: enemy plane at the same altitude?
                JSR     COLM02          ; If Player is at the same altitude as the enemey plane, check if that one got hit
                JMP     loc_21AD
; ---------------------------------------------------------------------------

loc_216A:                               ; CODE XREF: PLFWD+D1↑j
                LDX     #4

loc_216C:                               ; CODE XREF: PLFWD+F1↓j
                LDA     PROPIM-1,X      ; enemy plane propeller animations (0-3 and 4-7)
                STA     P2+$17,Y        ; Enemy (first color)
                DEY
                DEX
                BNE     loc_216C
                JMP     loc_215A
; ---------------------------------------------------------------------------

loc_2179:                               ; CODE XREF: PLFWD+D5↑j
                LDX     #4

loc_217B:                               ; CODE XREF: PLFWD+100↓j
                LDA     PROPIM+3,X      ; enemy plane propeller animations (0-3 and 4-7)
                STA     P2+$17,Y        ; Enemy (first color)
                DEY
                DEX
                BNE     loc_217B
                JMP     loc_215A
; ---------------------------------------------------------------------------

LN:                                     ; CODE XREF: PLFWD+19↑j
                DEC     byte_62F
                BNE     loc_21AD

                INC     VAR_UNKNOWN_STATE
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDA     #10000b
                STA     P3+4,Y          ; Enemy (second color)
                LDA     #1000000b
                STA     P3+5,Y          ; Enemy (second color)
                LDA     #1100000b
                STA     P3+6,Y          ; Enemy (second color)
                LDX     #10

loc_21A3:                               ; CODE XREF: PLFWD+128↓j
                LDA     PLANE1-1,X      ; enemy plane flying towards player
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     loc_21A3

loc_21AD:                               ; CODE XREF: PLFWD+E4↑j
                                        ; PLFWD+108↑j
                LDY     byte_C2
                CPY     #190
                BCS     LD
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_RIGHT
                BEQ     loc_21D1
                LDX     #10

loc_21BC:                               ; CODE XREF: PLFWD+141↓j
                LDA     P3+7,Y          ; Enemy (second color)
                STA     P3+9,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     loc_21BC
                INC     byte_C2
                INC     byte_C2
; END OF FUNCTION CHUNK FOR PLFWD
; START OF FUNCTION CHUNK FOR LD
;   ADDITIONAL PARENT FUNCTION PLFWD

LP:                                     ; CODE XREF: PLFWD+DC↑j LD+E↓j
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_LEFT
                BEQ     locret_21DB     ; => Return

loc_21D1:                               ; CODE XREF: PLFWD+135↑j
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)

locret_21DB:                            ; CODE XREF: LD-D↑j
                RTS                     ; => Return
; END OF FUNCTION CHUNK FOR LD

; =============== S U B R O U T I N E =======================================


LD:                                     ; CODE XREF: PLFWD+98↑p
                                        ; PLFWD+12E↑j

; FUNCTION CHUNK AT 21CA SIZE 00000012 BYTES

                LDA     #0
                LDX     #8

LE:                                     ; CODE XREF: LD+9↓j
                STA     P3+7,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     LE
                INC     VAR_UNKNOWN_STATE
                JMP     LP
; End of function LD

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR PLFWD

LQ:                                     ; CODE XREF: PLFWD:KW↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     loc_21F2
                RTS
; ---------------------------------------------------------------------------

loc_21F2:                               ; CODE XREF: PLFWD+16C↑j
                DEC     byte_636
                BNE     loc_21FB
                INC     VAR_UNKNOWN_STATE
                RTS
; ---------------------------------------------------------------------------

loc_21FB:                               ; CODE XREF: PLFWD+172↑j
                LDA     byte_636
                CMP     #13
                BCC     NF              ; => Return
                LSR     A
                BCC     loc_220E
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_1.enemy_plane_warning ; "P" character
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; ---------------------------------------------------------------------------

loc_220E:                               ; CODE XREF: PLFWD+180↑j
                LDA     #_P|_C_ORANGE
                STA     SC_STATUS_LINE.line_1.enemy_plane_warning ; "P" character
                JSR     WARN
                RTS
; END OF FUNCTION CHUNK FOR PLFWD

; =============== S U B R O U T I N E =======================================


KMKZ:                                   ; CODE XREF: COMMON+24↑p
                DEC     byte_643
                BNE     PP
                LDA     #20
                STA     byte_643
                LDA     AUDC1_SHADOW
                CMP     #AUDIO_CONTROL_DIST_6
                BEQ     PP
                JSR     PO

PP:                                     ; CODE XREF: KMKZ+3↑j KMKZ+F↑j
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     DIRECTION_A
                BNE     NC
                JSR     KK              ; Move Plane down, if possible

NC:                                     ; CODE XREF: KMKZ+19↑j
                DEC     FUEL_TIMER
                BEQ     NE
                RTS
; ---------------------------------------------------------------------------

NE:                                     ; CODE XREF: KMKZ+21↑j
                LDA     #4
                STA     FUEL_TIMER
                JSR     KK              ; Move Plane down, if possible
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     #JOYSTICK_DOWN_RIGHT
                BEQ     loc_2251
                CMP     #JOYSTICK_UP_LEFT
                BNE     NF              ; => Return
                JSR     CE

NF:                                     ; CODE XREF: PLFWD+17D↑j
                                        ; KMKZ+34↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_2251:                               ; CODE XREF: KMKZ+30↑j
                JSR     CD
                RTS
; End of function KMKZ


; =============== S U B R O U T I N E =======================================

; Use fuel, update the display as well

FUEL:                                   ; CODE XREF: EB+A4↑p
                                        ; COMMON+48↑p ...
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BEQ     NP              ; => Return
                LDA     SC_STATUS_LINE.line_0.fuel_leak ; "F" character
                BNE     SD              ; A leak doubles the speed of using fuel
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     #JOYSTICK_UP_RIGHT
                BNE     MP

SD:                                     ; CODE XREF: FUEL+8↑j
                DEC     FUEL_TIMER      ; A leak doubles the speed of using fuel

MP:                                     ; CODE XREF: FUEL+E↑j
                DEC     FUEL_TIMER
                BMI     MQ

NP:                                     ; CODE XREF: FUEL+3↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

MQ:                                     ; CODE XREF: FUEL+16↑j
                LDA     #40
                STA     FUEL_TIMER
                DEC     SC_STATUS_LINE.line_0.fuel_digit_1
                LDA     SC_STATUS_LINE.line_0.fuel_digit_1
                CMP     #KEYCODE_0-1
                BEQ     MR
                RTS
; ---------------------------------------------------------------------------

MR:                                     ; CODE XREF: FUEL+26↑j
                LDA     SC_STATUS_LINE.line_0.fuel_digit_10
                CMP     #_0|_C_BLUE
                BNE     MS
                LDA     SC_STATUS_LINE.line_0.fuel_digit_100
                CMP     #_0|_C_BLUE
                BNE     MS
                STA     SC_STATUS_LINE.line_0.fuel_digit_1
                LDX     #0
                STX     IS_DEMO_MODE    ; 0=Demo Mode active
                INX
                STX     byte_643
                RTS
; ---------------------------------------------------------------------------

MS:                                     ; CODE XREF: FUEL+2E↑j
                                        ; FUEL+35↑j
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_0.fuel_digit_1
                DEC     SC_STATUS_LINE.line_0.fuel_digit_10
                LDA     SC_STATUS_LINE.line_0.fuel_digit_10
                CMP     #_QUESTIONMARK|_C_BLUE
                BEQ     MT
                RTS
; ---------------------------------------------------------------------------

MT:                                     ; CODE XREF: FUEL+51↑j
                LDA     #_9|_C_BLUE
                STA     SC_STATUS_LINE.line_0.fuel_digit_10
                DEC     SC_STATUS_LINE.line_0.fuel_digit_100
                RTS
; End of function FUEL


; =============== S U B R O U T I N E =======================================


REFUEL:                                 ; CODE XREF: STOPL+E6↓p
                LDA     SC_STATUS_LINE.line_0.fuel_digit_100
                CMP     #_3|_C_BLUE
                BNE     MU
                INC     TRIGGER_COUNT   ; Increment with each button/trigger press

MV:                                     ; CODE XREF: REFUEL:AGB↓j
                JSR     INCBMB          ; Increment/Reload bombs during refuel
                LDA     #_B|_C_LBLUE
                STA     SC_STATUS_LINE.line_0.bomb_B

SB:                                     ; CODE XREF: REFUEL+53↓j
                LDA     WORKING_PARTS   ; # of working part (4): fuel, bomb, maneuverabiity, gun
                CMP     #4
                BCS     N4
                LDA     #90
                STA     RIVER_BRIDGE_ROW

SA:                                     ; CODE XREF: REFUEL+3B↓j
                                        ; REFUEL+47↓j
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     PBMB
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                JSR     TRIGC__TRIGGER_COUNT ; Count individual button presses during a landing
                LDA     TRIGGER_COUNT   ; Increment with each button/trigger press
                CMP     #3
                BCS     ADO
                DEC     RIVER_BRIDGE_ROW
                BEQ     N8
                LDA     RIVER_BRIDGE_ROW
                CMP     #20
                BCS     SA
                LDA     #SND_FREQ_21
                STA     AUDF4           ; Audio 4 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_4
                STA     AUDC4           ; Audio 4 Channel Control Register
                JMP     SA
; ---------------------------------------------------------------------------

N8:                                     ; CODE XREF: REFUEL+35↑j
                JSR     FIX             ; Fix one broken part per call (F, B, M, G)
                STA     AUDF4           ; Audio 4 Frequency Register
                STA     AUDC4           ; Audio 4 Channel Control Register
                JMP     SB
; ---------------------------------------------------------------------------

ADO:                                    ; CODE XREF: REFUEL+31↑j
                LDA     #0
                STA     AUDC4           ; Audio 4 Channel Control Register

N4:                                     ; CODE XREF: REFUEL+17↑j
                PLA
                PLA
                LDA     #COLOR_INTENSITY_14|COLOR_GRAY
                STA     PCOLR0          ; P0 COLOR
                STA     IS_DEMO_MODE    ; 0=Demo Mode active
                STA     RIVER_BRIDGE_ROW

NA:                                     ; CODE XREF: REFUEL+78↓j
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     PBMB
                JSR     ROAR
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                DEC     RIVER_BRIDGE_ROW
                BNE     NA
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                AND     #3
                BNE     _1
                STA     byte_6B0

_1:                                     ; CODE XREF: REFUEL+7E↑j
                JMP     MZ
; ---------------------------------------------------------------------------

MU:                                     ; CODE XREF: REFUEL+5↑j
                JSR     TRIGC__TRIGGER_COUNT ; Count individual button presses during a landing
                LDA     TRIGGER_COUNT   ; Increment with each button/trigger press
                CMP     #1
                BCS     AGB
                JSR     PBMB
                DEC     FUEL_TIMER
                BEQ     MW
                RTS
; ---------------------------------------------------------------------------

AGB:                                    ; CODE XREF: REFUEL+8E↑j
                JMP     MV
; ---------------------------------------------------------------------------

MW:                                     ; CODE XREF: REFUEL+96↑j
                LDA     #2
                STA     FUEL_TIMER
                LDA     #_F|_C_BLACK
                STA     SC_STATUS_LINE.line_0.fuel_F
                INC     SC_STATUS_LINE.line_0.fuel_digit_1
                LDA     SC_STATUS_LINE.line_0.fuel_digit_1
                CMP     #_COLON|_C_BLUE
                BEQ     MX
                RTS
; ---------------------------------------------------------------------------

MX:                                     ; CODE XREF: REFUEL+AE↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_0.fuel_digit_1
                INC     SC_STATUS_LINE.line_0.fuel_digit_10
                LDA     SC_STATUS_LINE.line_0.fuel_digit_10
                CMP     #_COLON|_C_BLUE
                BEQ     MY
                RTS
; ---------------------------------------------------------------------------

MY:                                     ; CODE XREF: REFUEL+BE↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_0.fuel_digit_10
                INC     SC_STATUS_LINE.line_0.fuel_digit_100
                RTS
; End of function REFUEL


; =============== S U B R O U T I N E =======================================

; Decrement speed, except if we are at 100

SPDL:                                   ; CODE XREF: CKLAND+22↓p
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_1|_C_BLUE
                BNE     MH
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #_0|_C_BLUE
                BNE     MH
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #_0|_C_BLUE
                BNE     MH
                RTS
; ---------------------------------------------------------------------------

MH:                                     ; CODE XREF: SPDL+5↑j SPDL+C↑j ...
                JMP     KN              ; Decrement speed by 1 with little delay
; End of function SPDL

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR STOPL

ML:                                     ; CODE XREF: STOPL+5↓j
                                        ; STOPL+C↓j ...
                JMP     MM              ; Decrement speed by 1
; END OF FUNCTION CHUNK FOR STOPL

; =============== S U B R O U T I N E =======================================

; Decrement speed till we hit 000 (= we landed)

STOPL:                                  ; CODE XREF: CKLAND+72↓p

; FUNCTION CHUNK AT 2395 SIZE 00000003 BYTES
; FUNCTION CHUNK AT 2478 SIZE 00000019 BYTES

                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_0|_C_BLUE
                BNE     ML
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #_0|_C_BLUE
                BNE     ML
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #_0|_C_BLUE
                BNE     ML

                LDA     #SETVBV_VVBLKD
                LDX     #>XSND          ; Deferred interrupt for sound
                LDY     #<XSND          ; Deferred interrupt for sound
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                PLA
                PLA
                LDA     #150
                STA     FUEL_TIMER
                LDA     GAME_COMPLETION_MASK
                CMP     #FINAL_TARGET_ALL
                BNE     _1
                PLA
                PLA

_2:                                     ; CODE XREF: STOPL+3F↓j
                                        ; STOPL+54↓j
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                DEC     FUEL_TIMER
                BNE     _2
                LDY     AUDC1_SHADOW
                CPY     #AUDIO_CONTROL_DIST_6
                BEQ     _35
                DEY
                DEC     AUDC1_SHADOW
                STY     AUDC1           ; Audio 1 Channel Control Register
                LDA     #15
                STA     FUEL_TIMER
                JMP     _2
; ---------------------------------------------------------------------------

_35:                                    ; CODE XREF: STOPL+46↑j
                JSR     PLAY_IT         ; Sound: Start playing the title music

_3:
                PLA
                PLA
                JSR     RNK__DISPLAY_RANK ; Display the rank based on difficulty and score

_69:                                    ; CODE XREF: STOPL+62↓j
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JMP     _69             ; => endless loop. It is exited via the subroutine
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: STOPL+2F↑j
                JMP     GROUND
; End of function STOPL


; =============== S U B R O U T I N E =======================================

; Check if the player wants to land the plane while being over the runway

CKLAND:                                 ; CODE XREF: SRT+1E↑p
                LDA     CAN_LAND_FLAG   ; =0 => plane can land (runway reached)
                BEQ     MF
                RTS
; ---------------------------------------------------------------------------

MF:                                     ; CODE XREF: CKLAND+3↑j
                LDA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                BEQ     MG              ; => button is pressed!
                RTS
; ---------------------------------------------------------------------------

MG:                                     ; CODE XREF: CKLAND+8↑j
                LDY     #_L|_C_LBLUE
                STY     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                STY     byte_6B6

LAND:                                   ; CODE XREF: CKLAND+3B↓j
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                JSR     DRAW            ; Draw river/gras on the map
                JSR     DRUN__DRAW_RUNWAY ; Draw the runway on the map
                JSR     COMMON
                JSR     RUNSND
                JSR     SPDL            ; Decrement speed, except if we are at 100
                JSR     CKCOL           ; Check collision?!?
                JSR     FBRGN           ; Fire Gun
                JSR     FBTGN
                LDA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                BNE     MK
                RTS
; ---------------------------------------------------------------------------

MK:                                     ; CODE XREF: CKLAND+31↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #3              ; plane low enough to land?
                BNE     LAND

                LDA     #0
                STA     TRIGGER_COUNT   ; Increment with each button/trigger press
                STA     DL_IRQ_BACKGROUND_COLOR ; Color back to BLACK
                STA     SC_STATUS_LINE.line_1.wind_factor_warning ; "W" character
                STA     WIND_DURATION   ; Duration during which Wind is in effect
                STA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                STA     byte_6B6

                LDA     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
                CMP     #1000b          ; Player hit the playfield
                BEQ     MJ
                JMP     CRASH           ; Plane was crashed
; ---------------------------------------------------------------------------

MJ:                                     ; CODE XREF: CKLAND+55↑j
                                        ; CKLAND+75↓j
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                STA     DL_IRQ_BACKGROUND_COLOR ; Color back to BLACK
                JSR     DRAW            ; Draw river/gras on the map
                JSR     DRUN__DRAW_RUNWAY ; Draw the runway on the map
                JSR     DRTR__DRAW_TREE ; Draw trees into the map. Needs to be the last draw function to be called.
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     XPLSN
                JSR     STOPL           ; Decrement speed till we hit 000 (= we landed)
                JMP     MJ
; End of function CKLAND

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR STOPL

GROUND:                                 ; CODE XREF: STOPL:_1↑j
                                        ; STOPL+F1↓j ...
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     REFUEL
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                LDA     AUDC1_SHADOW
                CMP     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_6
                BCC     GROUND
                JSR     PO
                JMP     GROUND
; END OF FUNCTION CHUNK FOR STOPL

; =============== S U B R O U T I N E =======================================

; Loop to manage takeoff

TAKOF__TAKEOFF_LOOP:                    ; CODE XREF: EB+D1↑p
                                        ; TAKOF__TAKEOFF_LOOP+5C↓j
                JSR     DRAW            ; Draw river/gras on the map
                JSR     DRUN__DRAW_RUNWAY ; Draw the runway on the map
                JSR     DRTR__DRAW_TREE ; Draw trees into the map. Needs to be the last draw function to be called.
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     PBMB
                JSR     XPLSN
                JSR     FUEL            ; Use fuel, update the display as well
                JSR     CNSL__CONSOLE   ; Console for option selection and to start the game
                JSR     DTKOF__DEMO_TAKE_OFF ; Demo: plane take-off at speed 100
                JSR     ROAR
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #_D|_C_BLUE
                BCS     _8
                JSR     SPD__SPEED_CHANGE ; Change the speed of the plane up/down based on the joystick
                JMP     _1
; ---------------------------------------------------------------------------

_8:                                     ; CODE XREF: TAKOF__TAKEOFF_LOOP+23↑j
                JSR     TKOSPD__INCREMENT_SPEED ; Increment Speed
                LDA     byte_6B0
                BNE     _1
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_1|_C_BLUE
                BCS     _1
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     _1
                JSR     TKOSPD__INCREMENT_SPEED ; Increment Speed

_1:                                     ; CODE XREF: TAKOF__TAKEOFF_LOOP+28↑j
                                        ; TAKOF__TAKEOFF_LOOP+31↑j ...
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                LDA     STICK0          ; JOYSTICK 0 RAM CELL
                CMP     #JOYSTICK_NOTHING
                BEQ     DI
                CMP     DIRECTION_B
                BEQ     DJ

DK:                                     ; CODE XREF: TAKOF__TAKEOFF_LOOP+5A↓j
                                        ; TAKOF__TAKEOFF_LOOP+64↓j
                JMP     CRASH           ; Plane was crashed
; ---------------------------------------------------------------------------

DI:                                     ; CODE XREF: TAKOF__TAKEOFF_LOOP+4B↑j
                LDA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                AND     #1
                BNE     DK
                JMP     TAKOF__TAKEOFF_LOOP ; Loop to manage takeoff
; ---------------------------------------------------------------------------

DJ:                                     ; CODE XREF: TAKOF__TAKEOFF_LOOP+50↑j
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_D|_C_BLUE
                BCS     DK
                RTS
; End of function TAKOF__TAKEOFF_LOOP


; =============== S U B R O U T I N E =======================================

; Deferred interrupt for sound

XSND:                                   ; CODE XREF: VBIR__DEFERRED_VBL_DRAW+9↑j
                                        ; VBIR__DEFERRED_VBL_DRAW+24↑j ...
                LDA     AUDIO3_SOUND_COUNTER
                BEQ     PV              ; => Exit
                LDA     RANDOM          ; Random Number Generator
                AND     #3
                ORA     AUDIO3_SOUND_COUNTER
                ADC     #16
                STA     AUDF3           ; Audio 3 Frequency Register
                INC     AUDIO3_SOUND_COUNTER
                LDA     AUDIO3_SOUND_COUNTER
                CMP     AUDIO3_COUNTER_TRIGGER
                BCC     PV              ; => Exit
                LDA     AUDIO3_CONTROL
                CMP     #64
                BEQ     PY
                DEC     AUDIO3_CONTROL_COUNTER
                BNE     PV              ; => Exit
                LDA     #4
                STA     AUDIO3_CONTROL_COUNTER
                DEC     AUDIO3_CONTROL
                LDA     AUDIO3_CONTROL
                STA     AUDC3           ; Audio 3 Channel Control Register

PV:                                     ; CODE XREF: XSND+3↑j
                                        ; XSND+1B↑j ...
                JMP     XITVBV          ; => Exit
; ---------------------------------------------------------------------------

PY:                                     ; CODE XREF: XSND+22↑j
                LDA     #0
                STA     AUDIO3_SOUND_COUNTER
                JMP     XITVBV          ; => Exit
; End of function XSND


; =============== S U B R O U T I N E =======================================

; Start Audio 3 sound effect

XXX:                                    ; CODE XREF: TURN+7C↑p
                                        ; XPLSN+8B↑j ...
                STA     AUDIO3_COUNTER_TRIGGER
                STX     AUDIO3_CONTROL
                STX     AUDC3           ; Audio 3 Channel Control Register
                LDA     #1
                STA     AUDIO3_SOUND_COUNTER
                STA     AUDIO3_CONTROL_COUNTER
                RTS
; End of function XXX


; =============== S U B R O U T I N E =======================================

; Bomb drop sound

DRPSND:                                 ; CODE XREF: BOMB+AF↑p
                                        ; CDRP+D↓j
                DEC     AUDIO2_DROPSND_COUNTER
                LDA     AUDIO2_DROPSND_COUNTER
                LSR     A
                BCC     _1              ; => Return
                INC     AUDIO2_DROPSND_FREQ
                LDA     AUDIO2_DROPSND_FREQ
                STA     AUDIO2_DROPSND_FREQ_SAVED
                STA     AUDF2           ; Audio 2 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_4
                STA     AUDC2           ; Audio 2 Channel Control Register

_1:                                     ; CODE XREF: DRPSND+7↑j
                RTS                     ; => Return
; End of function DRPSND


; =============== S U B R O U T I N E =======================================

; Gun sound from the plane

GUNSND:                                 ; CODE XREF: COMMON+3C↑p
                LDX     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                BEQ     QA              ; => Return
                DEC     PLANE_GUN_SOUND_TIMER_2 ; Timer 2 for the repeating gun sound from the plane
                LDA     PLANE_GUN_SOUND_TIMER_2 ; Timer 2 for the repeating gun sound from the plane
                LSR     A
                BCC     QA              ; => Return
                LDA     #SND_FREQ_50
                STA     AUDF4           ; Audio 4 Frequency Register
                CPX     #255
                BEQ     QC
                CPX     #254
                BEQ     QD
                DEC     PLANE_GUN_SOUND_TIMER_3 ; Timer 3 for the repeating gun sound from the plane
                LDA     PLANE_GUN_SOUND_TIMER_3 ; Timer 3 for the repeating gun sound from the plane
                LSR     A
                BCC     QB
                LDA     #AUDIO_CONTROL_VOL_5|AUDIO_CONTROL_DIST_2
                STA     AUDC4           ; Audio 4 Channel Control Register

QA:                                     ; CODE XREF: GUNSND+3↑j
                                        ; GUNSND+C↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

QB:                                     ; CODE XREF: GUNSND+22↑j
                LDA     #AUDIO_CONTROL_DIST_2
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; ---------------------------------------------------------------------------

QC:                                     ; CODE XREF: GUNSND+15↑j
                LDA     #AUDIO_CONTROL_VOL_5|AUDIO_CONTROL_DIST_1
                STA     AUDC4           ; Audio 4 Channel Control Register
                DEC     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                RTS
; ---------------------------------------------------------------------------

QD:                                     ; CODE XREF: GUNSND+19↑j
                LDA     #0
                STA     AUDC4           ; Audio 4 Channel Control Register
                STA     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                RTS
; End of function GUNSND


; =============== S U B R O U T I N E =======================================


ROAR:                                   ; CODE XREF: EB+AD↑p
                                        ; COMMON+33↑p ...

; FUNCTION CHUNK AT 25CC SIZE 0000001B BYTES

                DEC     byte_643
                BNE     PQ              ; => Return
                LDA     #20
                STA     byte_643
                LDA     STICK0_COPY     ; JOYSTICK 0 copy
                CMP     #JOYSTICK_UP_RIGHT
                BEQ     PR
                LDA     AUDC1_SHADOW
                CMP     #AUDIO_CONTROL_VOL_4|AUDIO_CONTROL_DIST_6
                BEQ     PQ              ; => Return
                BCC     PS
; End of function ROAR


; =============== S U B R O U T I N E =======================================


PO:                                     ; CODE XREF: KMKZ+11↑p
                                        ; STOPL+F3↑p
                DEC     AUDC1_SHADOW
                LDA     AUDC1_SHADOW
                STA     AUDC1           ; Audio 1 Channel Control Register
                RTS
; End of function PO

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR ROAR

PS:                                     ; CODE XREF: ROAR+17↑j
                INC     AUDC1_SHADOW
                LDA     AUDC1_SHADOW
                STA     AUDC1           ; Audio 1 Channel Control Register

PQ:                                     ; CODE XREF: ROAR+3↑j
                                        ; ROAR+15↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

PR:                                     ; CODE XREF: ROAR+E↑j
                LDA     AUDC1_SHADOW
                CMP     #AUDIO_CONTROL_VOL_8|AUDIO_CONTROL_DIST_6
                BEQ     PQ              ; => Return
                INC     AUDC1_SHADOW
                LDA     AUDC1_SHADOW
                STA     AUDC1           ; Audio 1 Channel Control Register
                RTS
; END OF FUNCTION CHUNK FOR ROAR

; =============== S U B R O U T I N E =======================================


WARN:                                   ; CODE XREF: PLFWD+190↑p
                                        ; L6+80↓p
                LDX     #0
                STX     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                INX
                STX     AUDF4           ; Audio 4 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_0
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; End of function WARN


; =============== S U B R O U T I N E =======================================

; Increment/Reload bombs during refuel

INCBMB:                                 ; CODE XREF: REFUEL:MV↑p
                LDA     #_F|_C_LBLUE
                STA     SC_STATUS_LINE.line_0.fuel_F
                LDA     #_B|_C_BLACK
                STA     SC_STATUS_LINE.line_0.bomb_B
                STA     RIVER_BRIDGE_ROW

PF:                                     ; CODE XREF: INCBMB+24↓j
                                        ; INCBMB+39↓j ...
                JSR     PROP            ; Update the propeller graphics for rotation
                JSR     TURN            ; Check for the joystick and set the plane graphics. Check for too low altitude as well and then crash the plane.
                JSR     TRIGC__TRIGGER_COUNT ; Count individual button presses during a landing
                JSR     PBMB
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz

                LDA     TRIGGER_COUNT   ; Increment with each button/trigger press
                CMP     #2
                BCS     PG              ; => Return
                DEC     RIVER_BRIDGE_ROW
                BNE     PF
                LDA     #8
                STA     RIVER_BRIDGE_ROW

                LDA     SC_STATUS_LINE.line_0.bomb_digit_10
                CMP     #_3|_C_BLUE
                BEQ     ADN
                INC     SC_STATUS_LINE.line_0.bomb_digit_1
                LDA     SC_STATUS_LINE.line_0.bomb_digit_1
                CMP     #_COLON|_C_BLUE
                BNE     PF
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_0.bomb_digit_1
                INC     SC_STATUS_LINE.line_0.bomb_digit_10
                JMP     PF
; ---------------------------------------------------------------------------

ADN:                                    ; CODE XREF: INCBMB+2F↑j
                INC     TRIGGER_COUNT   ; Increment with each button/trigger press

PG:                                     ; CODE XREF: INCBMB+20↑j
                RTS                     ; => Return
; End of function INCBMB


; =============== S U B R O U T I N E =======================================


RUNSND:                                 ; CODE XREF: SRT+21↑p
                                        ; CKLAND+1F↑p
                LDA     RUN_SOUND_COUNTER ; 0=Run sound off, otherwise a count down timer for the effect
                BEQ     QE              ; => Return
                DEC     RUN_SOUND_COUNTER ; 0=Run sound off, otherwise a count down timer for the effect
                LDA     RUN_SOUND_COUNTER ; 0=Run sound off, otherwise a count down timer for the effect
                BEQ     QF
                LSR     A
                BCC     QG
                LDA     #SND_FREQ_10
                STA     AUDF4           ; Audio 4 Frequency Register

QE:                                     ; CODE XREF: RUNSND+3↑j
                                        ; PLBCK+6↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

QG:                                     ; CODE XREF: RUNSND+E↑j
                LDA     #SND_FREQ_25
                STA     AUDF4           ; Audio 4 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_4|AUDIO_CONTROL_DIST_4

QF:                                     ; CODE XREF: RUNSND+B↑j
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; End of function RUNSND


; =============== S U B R O U T I N E =======================================


PLBCK:                                  ; CODE XREF: SRT+C↑p CITY+9↓p
                LDA     byte_FD
                BEQ     OB
                CMP     #2
                BNE     QE              ; => Return
                LDA     byte_6A8
                BEQ     L6
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     L6
                JSR     XP2
                JSR     TRIGB
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_5
                BCC     _1              ; => Return
                JSR     COLM02          ; If Player is at the same altitude as the enemey plane, check if that one got hit

_1:                                     ; CODE XREF: PLBCK+1E↑j
                RTS                     ; => Return
; End of function PLBCK


; =============== S U B R O U T I N E =======================================


L6:                                     ; CODE XREF: PLBCK+B↑j
                                        ; PLBCK+11↑j ...

; FUNCTION CHUNK AT 2758 SIZE 00000091 BYTES
; FUNCTION CHUNK AT 27F7 SIZE 00000037 BYTES

                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_2
                BEQ     OD
                CMP     #UNKNOWNS_STATE_3
                BEQ     OG
                CMP     #UNKNOWNS_STATE_4
                BEQ     OI
                CMP     #UNKNOWNS_STATE_5
                BEQ     OJ
                JMP     OR
; ---------------------------------------------------------------------------

OI:                                     ; CODE XREF: L6+D↑j
                JMP     OW
; ---------------------------------------------------------------------------

OJ:                                     ; CODE XREF: L6+11↑j
                JSR     XP2
                JSR     LINE            ; Check line of sight: enemy plane at the same altitude?
                JSR     COLM02          ; If Player is at the same altitude as the enemey plane, check if that one got hit
                JMP     OX
; ---------------------------------------------------------------------------

OB:                                     ; CODE XREF: PLBCK+2↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                BNE     OC              ; => Return
                STA     byte_6A8
                STA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any

                LDA     byte_6A6
                BNE     OC              ; => Return
                LDA     #23
                STA     byte_636
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     OY
                LDA     #UNKNOWNS_STATE_2
                STA     byte_FD
                STA     VAR_UNKNOWN_STATE
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_ROAD_HARD_RIGHT_3
                BCS     OC              ; => Return
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LSR     A
                BCC     OC              ; => Return
                INC     byte_6A8
                RTS
; ---------------------------------------------------------------------------

OY:                                     ; CODE XREF: L6+40↑j
                JMP     KV
; ---------------------------------------------------------------------------

OD:                                     ; CODE XREF: L6+5↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     OC              ; => Return
                DEC     byte_636
                BNE     OE
                INC     VAR_UNKNOWN_STATE

OC:                                     ; CODE XREF: L6+2A↑j L6+35↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

OE:                                     ; CODE XREF: L6+62↑j
                LDA     byte_636
                CMP     #13
                BCC     OC              ; => Return
                LSR     A
                BCC     OF
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_1.enemy_plane_warning ; "P" character
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; ---------------------------------------------------------------------------

OF:                                     ; CODE XREF: L6+70↑j
                LDA     #_P|_C_ORANGE
                STA     SC_STATUS_LINE.line_1.enemy_plane_warning ; "P" character
                JSR     WARN
                RTS
; End of function L6


; =============== S U B R O U T I N E =======================================


OG:                                     ; CODE XREF: L6+9↑j PBMB+22↓p
                LDY     #186
                STY     ENEMY_Y_POS     ; Enemy Y position
                STY     byte_C2
                LDX     #10

OH:                                     ; CODE XREF: OG+10↓j
                LDA     BUF+1,X
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     OH
                LDA     #1100b
                STA     P3+$BC          ; Enemy (second color)
                LDA     #100b
                STA     P3+$BD          ; Enemy (second color)
                LDA     #10000b
                STA     P3+$BE          ; Enemy (second color)
                LDA     RANDOM          ; Random Number Generator
                AND     #$3F ; '?'
                ORA     #$18
                ADC     #6
                STA     byte_62F
                LDA     RANDOM          ; Random Number Generator
                AND     #$3F ; '?'
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                INC     VAR_UNKNOWN_STATE
                LDA     byte_C4
                BNE     Q3
                LDA     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                STA     PCOLR2          ; P2 COLOR
                DEC     byte_C4
                RTS
; ---------------------------------------------------------------------------

Q3:                                     ; CODE XREF: OG+3F↑j
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE
                STA     PCOLR2          ; P2 COLOR
                RTS
; End of function OG

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR L6

OW:                                     ; CODE XREF: L6:OI↑j
                DEC     byte_62F
                BNE     OX
                INC     VAR_UNKNOWN_STATE
                LDY     byte_C2
                LDX     #8

OK:                                     ; CODE XREF: L6+E7↓j
                LDA     P1IMAGE-1,X     ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P3+7,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     OK

OX:                                     ; CODE XREF: L6+22↑j L6+D6↑j
                LDA     byte_FD
                CMP     #254
                BEQ     _1
                JSR     COLP02
                JSR     TRIGB
                JSR     BTURN
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_RIGHT
                BEQ     OR

_1:                                     ; CODE XREF: L6+ED↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #14
                BCS     OL
                LDA     #0

K1:                                     ; CODE XREF: L6+17F↓j
                LDX     #10

OM:                                     ; CODE XREF: L6+111↓j
                STA     P2+9,Y          ; Enemy (first color)
                STA     P3+9,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     OM
                JSR     AEL
                INC     VAR_UNKNOWN_STATE
                JMP     OR
; ---------------------------------------------------------------------------

OL:                                     ; CODE XREF: L6+103↑j
                LDX     #12

ON:                                     ; CODE XREF: L6+12C↓j
                LDA     P2,Y            ; Enemy (first color)
                STA     P1+$FF,Y        ; Player Plane (BLACK parts)
                LDA     P3,Y            ; Enemy (second color)
                STA     P2+$FF,Y        ; Enemy (first color)
                INY
                DEX
                BNE     ON
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                BNE     OQ
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                LDX     #3
                CMP     #3
                BCC     OP

OO:                                     ; CODE XREF: L6+146↓j
                LDA     P0IMAGE+9,X     ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                STA     P2+1,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     OO
                JMP     OQ
; ---------------------------------------------------------------------------

OP:                                     ; CODE XREF: L6+13C↑j L6+153↓j
                LDA     P0IMAGE+$C,X    ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                STA     P2+1,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     OP

OQ:                                     ; CODE XREF: L6+131↑j L6+148↑j
                DEC     ENEMY_Y_POS     ; Enemy Y position
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_5
                BNE     OV

OR:                                     ; CODE XREF: L6+13↑j L6+FD↑j ...
                LDY     byte_C2
                CPY     #12
                BCS     OS
; END OF FUNCTION CHUNK FOR L6

; =============== S U B R O U T I N E =======================================


K0:                                     ; CODE XREF: L6+178↓p
                LDA     #0
                LDX     #8

OT:                                     ; CODE XREF: K0+9↓j
                STA     P3+7,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     OT
                STA     byte_FD
                RTS
; End of function K0

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR L6

OS:                                     ; CODE XREF: L6+162↑j
                LDX     ENEMY_X_POS     ; Enemy X position
                CPX     #220
                BCC     J9
                JSR     K0
                STA     byte_C2
                LDY     ENEMY_Y_POS     ; Enemy Y position
                JMP     K1
; ---------------------------------------------------------------------------

J9:                                     ; CODE XREF: L6+176↑j
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_RIGHT
                BEQ     OV
                LDX     #9

OU:                                     ; CODE XREF: L6+193↓j
                LDA     P3,Y            ; Enemy (second color)
                STA     P2+$FF,Y        ; Enemy (first color)
                INY
                DEX
                BNE     OU
                DEC     byte_C2

OV:                                     ; CODE XREF: L6+15C↑j L6+187↑j
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                CMP     #TURN_MODE_LEFT
                BEQ     K8              ; => Return
                INC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)

K8:                                     ; CODE XREF: L6+19C↑j
                RTS                     ; => Return
; END OF FUNCTION CHUNK FOR L6

; =============== S U B R O U T I N E =======================================

; Splash sound effect on channel 2

SPLASH:                                 ; CODE XREF: COMMON+3F↑p
                                        ; TURN+127↑p ...
                LDA     AUDIO2_DURATION_COUNTER
                BEQ     QH              ; => Return
                DEC     AUDIO2_DURATION_COUNTER
                LDA     AUDIO2_DURATION_COUNTER
                LSR     A
                BCS     QH              ; => Return
                CMP     #3
                BCC     QI
                CMP     #7
                BCC     QH              ; => Return
                CMP     #14
                BCC     QJ
                INC     AUDIO2_FREQ_COUNTER

QK:                                     ; CODE XREF: SPLASH+27↓j
                LDA     AUDIO2_FREQ_COUNTER
                STA     AUDF2           ; Audio 2 Frequency Register
                RTS
; ---------------------------------------------------------------------------

QJ:                                     ; CODE XREF: SPLASH+18↑j
                DEC     AUDIO2_FREQ_COUNTER
                JMP     QK
; ---------------------------------------------------------------------------

QI:                                     ; CODE XREF: SPLASH+10↑j
                DEC     AUDIO2_EFFECT_COUNTER
                LDA     AUDIO2_EFFECT_COUNTER
                STA     AUDC2           ; Audio 2 Channel Control Register

QH:                                     ; CODE XREF: SPLASH+3↑j
                                        ; SPLASH+C↑j ...
                RTS                     ; => Return
; End of function SPLASH


; =============== S U B R O U T I N E =======================================


DRTNK:                                  ; CODE XREF: SRT+12↑p
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     QL
                RTS
; ---------------------------------------------------------------------------

QL:                                     ; CODE XREF: DRTNK+2↑j
                LDA     byte_650
                BEQ     QM
                DEC     byte_650
                RTS
; ---------------------------------------------------------------------------

QM:                                     ; CODE XREF: DRTNK+8↑j
                LDA     BUILDING_ROW_COUNTER
                BNE     QN              ; construct a 5x2 building wit up to 6 tanks in front of it and an anti-aircraft gun
                LDA     byte_638
                CMP     #20
                BCS     QQ
                LDA     #60
                STA     byte_650
                RTS
; ---------------------------------------------------------------------------

QQ:                                     ; CODE XREF: DRTNK+18↑j
                LDA     byte_FE
                CMP     #8
                BCS     QR
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #25
                BCC     QR
                LDA     #10
                STA     byte_650
                RTS
; ---------------------------------------------------------------------------

QR:                                     ; CODE XREF: DRTNK+24↑j
                                        ; DRTNK+2A↑j
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #36
                BCC     QS
                LDA     #3
                STA     byte_610
                RTS
; End of function DRTNK


; =============== S U B R O U T I N E =======================================


QS:                                     ; CODE XREF: DRTNK+36↑j
                                        ; TNKC+14↓j
                LDA     #8
                STA     BUILDING_ROW_COUNTER
                LDX     #0
                STX     byte_B6
                STX     byte_676
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     QT
                STX     BUILDING_COLOR_OFFSET
                RTS
; ---------------------------------------------------------------------------

QT:                                     ; CODE XREF: QS+10↑j
                LDA     #L_GRAS|L_C_1
                STA     BUILDING_COLOR_OFFSET
                RTS
; End of function QS


; =============== S U B R O U T I N E =======================================

; construct a 5x2 building wit up to 6 tanks in front of it and an anti-aircraft gun

QN:                                     ; CODE XREF: DRTNK+11↑j
                LDY     RIVER_RIGHT_X_POS ; Right position of the river

TT:                                     ; CODE XREF: TNKC+1A↓j
                INY
                INY
                DEC     BUILDING_ROW_COUNTER
                LDA     BUILDING_ROW_COUNTER
                BEQ     RE__BUILDING_ROW_0
                CMP     #1
                BEQ     RB__BUILDING_ROW_1
                CMP     #2
                BEQ     QY__BUILDING_ROW_2 ; Build a base row of the building
                CMP     #4
                BCC     QX__BUILDING_ROW_3

                LDA     byte_676
                BNE     WE              ; up ro 6 tanks in front of the building
                LDA     #2
                STA     byte_B6

WE:                                     ; CODE XREF: QN+1B↑j
                LDX     #6              ; up ro 6 tanks in front of the building

QW:                                     ; CODE XREF: QN+3C↓j
                INY
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     QU
                LDA     #L_TANK_LEFT_A|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                LDA     #L_TANK_RIGHT_A|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     QV
; ---------------------------------------------------------------------------

QU:                                     ; CODE XREF: QN+28↑j
                INY
                LDA     #L_GRAS_BEFORE_BUILDING|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

QV:                                     ; CODE XREF: QN+33↑j
                DEX
                BNE     QW
                RTS
; ---------------------------------------------------------------------------

RB__BUILDING_ROW_1:                     ; CODE XREF: QN+E↑j
                JMP     RC              ; Build a center row of the building
; ---------------------------------------------------------------------------

RE__BUILDING_ROW_0:                     ; CODE XREF: QN+A↑j
                JMP     RF              ; Building create roof
; ---------------------------------------------------------------------------

QX__BUILDING_ROW_3:                     ; CODE XREF: QN+16↑j
                LDA     #0
                STA     byte_B6
                STA     byte_676
                JSR     DFTNK
                RTS
; ---------------------------------------------------------------------------

QY__BUILDING_ROW_2:                     ; CODE XREF: QN+12↑j
                PHA                     ; Build a base row of the building
                INY
                INY
                INY
                STY     BUILDING_X_START_POS
                INY

RD:                                     ; CODE XREF: QN+91↓j
                LDX     #5
                LDA     #L_BUILDING_WINDOW|L_C_0
                CLC
                ADC     BUILDING_COLOR_OFFSET

QZ:                                     ; CODE XREF: QN+64↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                DEX
                BNE     QZ
                PLA
                CMP     #1
                BEQ     RA
                LDA     #L_BUILDING_WALL_A|L_C_0
                CLC
                ADC     BUILDING_COLOR_OFFSET
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

                LDA     #11
                STA     byte_6A3
                JSR     B5
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_1
                LDY     BUILDING_X_START_POS
                DEY                     ; anti-aircraft gun to the left of the building
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

RA:                                     ; CODE XREF: QN+69↑j
                LDA     #L_RUNWAY_CENTER_12|L_C_0
                CLC
                ADC     BUILDING_COLOR_OFFSET
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

RC:                                     ; CODE XREF: QN:RB__BUILDING_ROW_1↑j
                PHA                     ; Build a center row of the building
                LDY     BUILDING_X_START_POS
                JMP     RD
; ---------------------------------------------------------------------------

RF:                                     ; CODE XREF: QN:RE__BUILDING_ROW_0↑j
                LDY     BUILDING_X_START_POS ; Building create roof
                DEY
                LDA     #L_BUILDING_ROOF_TOP_LEFT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                LDX     #4
                LDA     #L_BUILDING_ROOF_CENTER|L_C_1

RG:                                     ; CODE XREF: QN+A5↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                DEX
                BNE     RG
                LDA     #L_BUILDING_ROOF_TOP_RIGHT|L_C_0
                CLC
                ADC     BUILDING_COLOR_OFFSET
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDY     byte_676
                BNE     WF
                DEY
                STY     byte_B6

WF:                                     ; CODE XREF: QN+B2↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #$F
                ADC     #26
                STA     byte_650
                LDA     byte_C4
                CMP     #5
                BNE     Q0              ; => Return
                LDA     #PRIMARY_TARGET_SUBTYPE_BUILDING
                STA     VAR_PRIMARY_TARGET_SUBTYPE
                LDY     #11
                LDA     BUILDING_X_START_POS
                CLC
                ADC     #14
                JMP     GNSGHT
; ---------------------------------------------------------------------------

Q0:                                     ; CODE XREF: QN+C5↑j
                RTS                     ; => Return
; End of function QN


; =============== S U B R O U T I N E =======================================


COLM20:                                 ; CODE XREF: TRIGF-12↓p
                LDA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                AND     #1
                CMP     #1
                BEQ     RS

RU:                                     ; CODE XREF: COLM20+1E↓j
                                        ; COLM20+26↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

RS:                                     ; CODE XREF: COLM20+7↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                SBC     DIFF.field_5    ; Difficulty for the level
                STA     byte_658
                LDA     byte_C2
                SBC     ENEMY_Y_POS     ; Enemy Y position
                SBC     byte_658
                CMP     DIFF.field_6    ; Difficulty for the level
                BCS     RU              ; => Return

DAMAGE:
                JSR     RO

SV:                                     ; CODE XREF: COLM30+23↓p
                                        ; CLG20+36↓p
                LDA     byte_6F7
                BNE     RU              ; => Return
                LDA     #35
                STA     byte_6F7
                LDX     #72
                STA     PLANE_HIT_FLASH_COUNTER ; !=0 => counter to signal damage via flashing
                LDA     #15
                JSR     XXX             ; Start Audio 3 sound effect
                LDX     WORKING_PARTS   ; # of working part (4): fuel, bomb, maneuverabiity, gun
                BNE     RV              ; Damage a random part in the plane
                STX     IS_DEMO_MODE    ; Disable demo mode, when plane is completely damaged – to allow it to crash
                INX
                STX     byte_643
                INX
                STX     PCOLR0          ; P0 COLOR
                RTS
; ---------------------------------------------------------------------------

RV:                                     ; CODE XREF: COLM20+39↑j
                DEC     WORKING_PARTS   ; Damage a random part in the plane

RZ:                                     ; CODE XREF: COLM20+5C↓j
                                        ; COLM20+67↓j ...
                LDA     RANDOM          ; Random Number Generator
                AND     #3
                BEQ     RW
                CMP     #1
                BEQ     RX
                CMP     #2
                BEQ     RY
                LDA     SC_STATUS_LINE.line_0.machine_gun_damaged ; "G" character
                BNE     RZ
                LDA     #_G|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.machine_gun_damaged ; "G" character
                RTS
; ---------------------------------------------------------------------------

RW:                                     ; CODE XREF: COLM20+4F↑j
                LDA     SC_STATUS_LINE.line_0.fuel_leak ; "F" character
                BNE     RZ
                LDA     #_F|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.fuel_leak ; "F" character
                RTS
; ---------------------------------------------------------------------------

RX:                                     ; CODE XREF: COLM20+53↑j
                LDA     SC_STATUS_LINE.line_0.bomb_gear_damaged ; "B" character
                BNE     RZ
                LDA     #_B|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.bomb_gear_damaged ; "B" character
                RTS
; ---------------------------------------------------------------------------

RY:                                     ; CODE XREF: COLM20+57↑j
                LDA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                BNE     RZ
                LDA     #_M|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                RTS
; End of function COLM20


; =============== S U B R O U T I N E =======================================


TRIGB:                                  ; CODE XREF: PLBCK+16↑p
                                        ; L6+F2↑p

; FUNCTION CHUNK AT 2A54 SIZE 0000001C BYTES

                LDY     byte_656
                BNE     RR
                LDA     byte_C2
                SBC     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                BMI     RM              ; => Return
                LDA     ENEMY_X_POS     ; Enemy X position
                CMP     #170
                BCS     RM              ; => Return
                LDA     RANDOM          ; Random Number Generator
                CMP     DIFF.field_2    ; Difficulty for the level
                BCS     RM              ; => Return
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_5
                BNE     RM              ; => Return
                LDA     ENEMY_X_POS     ; Enemy X position
                CLC
                ADC     #6
                STA     byte_657
                STA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                LDY     ENEMY_Y_POS     ; Enemy Y position
                INY
                INY
; End of function TRIGB

; START OF FUNCTION CHUNK FOR TRIGF

RN:                                     ; CODE XREF: TRIGF+22↓j
                STY     byte_656
                LDA     #110000b
                STA     MISSLE,Y
                STA     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane

RM:                                     ; CODE XREF: TRIGB+9↑j
                                        ; TRIGB+F↑j ...
                RTS                     ; => Return
; END OF FUNCTION CHUNK FOR TRIGF
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR TRIGB

RR:                                     ; CODE XREF: TRIGB+3↑j
                CPY     #30
                BCC     RO
                LDA     byte_657
                CMP     #205
                BCS     RO
                CLC
                ADC     #3
                STA     byte_657
                STA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                LDA     #0
                STA     MISSLE,Y
                DEY
                DEY
                DEY
; END OF FUNCTION CHUNK FOR TRIGB
; START OF FUNCTION CHUNK FOR TRIGF

RP:                                     ; CODE XREF: TRIGF+42↓j
                STY     byte_656
                LDA     #110000b
                STA     MISSLE,Y
                JSR     COLM20
                RTS
; END OF FUNCTION CHUNK FOR TRIGF

; =============== S U B R O U T I N E =======================================


RO:                                     ; CODE XREF: COLM20:DAMAGE↑p
                                        ; TRIGB+3D↑j ...
                LDA     #0
                STA     byte_656
                STA     MISSLE,Y
                LDX     #255
                STX     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane

SG:                                     ; CODE XREF: TRIGF+9↓j
                                        ; TRIGF+11↓j
                RTS                     ; => Return
; End of function RO


; =============== S U B R O U T I N E =======================================


TRIGF:                                  ; CODE XREF: LF+6↑p

; FUNCTION CHUNK AT 2A48 SIZE 0000000C BYTES
; FUNCTION CHUNK AT 2A70 SIZE 0000000C BYTES

                LDY     byte_656
                BNE     loc_2AAF
                LDA     byte_C2
                CMP     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                BCS     SG              ; => Return
                LDA     RANDOM          ; Random Number Generator
                CMP     DIFF.field_2    ; Difficulty for the level
                BCS     SG              ; => Return
                LDA     ENEMY_X_POS     ; Enemy X position
                SBC     #2
                STA     byte_657
                STA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                LDA     ENEMY_Y_POS     ; Enemy Y position
                ADC     #11
                TAY
                JMP     RN
; ---------------------------------------------------------------------------

loc_2AAF:                               ; CODE XREF: TRIGF+3↑j
                CPY     #185
                BCS     RO
                LDA     byte_657
                CMP     #55
                BCC     RO
                CLC
                SBC     #2
                STA     byte_657
                STA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                LDA     #0
                STA     MISSLE,Y
                INY
                INY
                INY
                INY
                JMP     RP
; End of function TRIGF


; =============== S U B R O U T I N E =======================================


BRGPOS:                                 ; CODE XREF: COMMON+4E↑p
                LDA     byte_661
                BNE     loc_2ADB
                RTS
; ---------------------------------------------------------------------------

loc_2AD5:                               ; CODE XREF: BRGPOS+1D↓j
                LDA     #0
                STA     byte_661
                RTS
; ---------------------------------------------------------------------------

loc_2ADB:                               ; CODE XREF: BRGPOS+3↑j
                LDA     byte_664
                BEQ     loc_2AE4
                DEC     byte_664
                RTS
; ---------------------------------------------------------------------------

loc_2AE4:                               ; CODE XREF: BRGPOS+F↑j
                INC     byte_65D
                LDY     byte_65D
                CPY     #210
                BEQ     loc_2AD5
                DEC     byte_65E
                LDA     byte_65E
                LSR     A
                BCS     SP              ; => Return
                DEC     MISSLE_3_X_POS2

SP:                                     ; CODE XREF: BRGPOS+26↑j
                                        ; FBRGN+2↓j ...
                RTS                     ; => Return
; End of function BRGPOS


; =============== S U B R O U T I N E =======================================

; Fire Gun

FBRGN:                                  ; CODE XREF: SRT+24↑p
                                        ; CKLAND+28↑p

; FUNCTION CHUNK AT 2B3F SIZE 00000010 BYTES
; FUNCTION CHUNK AT 2B4F SIZE 00000049 BYTES

                LDA     byte_BF
                BNE     SP              ; => Return
                LDY     byte_65F
                BNE     SM
                JSR     CKFGN
                LDX     MISSLE_3_X_POS2
                CPX     #185
                BCS     TA
                CPX     #161
                BCS     SY
                CPX     #65
                BCC     SP              ; => Return

ZW:                                     ; CODE XREF: FBRGN+48↓j
                JMP     G3
; End of function FBRGN


; =============== S U B R O U T I N E =======================================


ZZ:
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT

A1:
                STA     VAR_MISSLE_3_STATE

SX:                                     ; CODE XREF: FTNKGN-1E1↓j
                STX     P3PF_HPOSM3     ; Set missile 3 X position
                STX     MISSLE_3_X_POS
                STY     byte_65F
                LDA     #10000000b
                STA     MISSLE,Y
                STA     MISSLE-1,Y
                LDA     RANDOM          ; Random Number Generator
                AND     #15
                ADC     #15
                STA     byte_660
                LDA     #12
                STA     AUDIO4_GUN_SND_COUNTER
                RTS
; End of function ZZ

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FBRGN

SY:                                     ; CODE XREF: FBRGN+15↑j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     ZW

TA:                                     ; CODE XREF: FBRGN+11↑j
                TXA
                SEC
                SBC     #96
                STA     MISSLE_3_X_POS2
                JMP     G3
; END OF FUNCTION CHUNK FOR FBRGN
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FTNKGN
;   ADDITIONAL PARENT FUNCTION FBRGN

SM:                                     ; CODE XREF: FBRGN+7↑j
                                        ; FTNKGN:A7↓j
                LDA     VAR_MISSLE_3_STATE
                BEQ     ZV
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT2
                BNE     ZX
                DEC     MISSLE_3_X_POS

ZV:                                     ; CODE XREF: FTNKGN-C5D↑j
                                        ; FTNKGN-C36↓j
                DEC     MISSLE_3_X_POS

G5:                                     ; CODE XREF: FTNKGN-C3D↓j
                LDA     MISSLE_3_X_POS
                STA     P3PF_HPOSM3     ; Missile 3 Horizontal Position / Player 3 to Playfield Collision
                JMP     SW
; ---------------------------------------------------------------------------

ZX:                                     ; CODE XREF: FTNKGN-C59↑j
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_NOTHING
                BEQ     SW
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_RIGHT
                BNE     G4
                INC     MISSLE_3_X_POS
                JMP     G5
; ---------------------------------------------------------------------------

G4:                                     ; CODE XREF: FTNKGN-C42↑j
                LDA     byte_65E
                LSR     A
                BCC     ZV

SW:                                     ; CODE XREF: FTNKGN-C4B↑j
                                        ; FTNKGN-C46↑j
                LDA     byte_660
                BEQ     SN
                DEC     byte_660
                BNE     SQ
                LDA     AUDIO3_SOUND_COUNTER
                BNE     WD
                LDA     #2
                LDX     #AUDIO_CONTROL_VOL_7|AUDIO_CONTROL_DIST_1
                JSR     XXX             ; Start Audio 3 sound effect

WD:                                     ; CODE XREF: FTNKGN-C27↑j
                LDA     #25
                STA     byte_662
                LDA     #10000000b
; END OF FUNCTION CHUNK FOR FTNKGN
; START OF FUNCTION CHUNK FOR FM2GN

D3:                                     ; CODE XREF: FM2GN+AB↓j
                STA     MISL-2,Y
                STA     MISL-4,Y
                LSR     A
                STA     MISL-1,Y
                STA     MISL-3,Y
                RTS
; END OF FUNCTION CHUNK FOR FM2GN
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FTNKGN

SQ:                                     ; CODE XREF: FTNKGN-C2C↑j
                LDA     #0
                STA     MISSLE,Y
                DEY
                STA     MISSLE,Y
                DEY
                STY     byte_65F
                LDA     #10000000b
                STA     MISSLE,Y
                STA     MISL-1,Y
                JSR     COLM30
                RTS
; END OF FUNCTION CHUNK FOR FTNKGN

; =============== S U B R O U T I N E =======================================


SR:                                     ; CODE XREF: FTNKGN-BCD↓j
                                        ; COLM30+20↓p
                LDA     #0
                STA     MISSLE,Y
                STA     MISL-1,Y
                STA     byte_65F
                STA     MISL-2,Y
                STA     MISL-3,Y
                STA     MISL-4,Y
                LDA     #111100b
                AND     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size
                RTS
; End of function SR

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FTNKGN

SN:                                     ; CODE XREF: FTNKGN-C31↑j
                DEC     byte_662
                BEQ     SR
                LDA     byte_65E
                LSR     A
                LSR     A
                LSR     A
                BCC     SS
                JSR     COLM30
                RTS
; ---------------------------------------------------------------------------

SS:                                     ; CODE XREF: FTNKGN-BC5↑j
                LDA     #11000000b
                ORA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size
                RTS
; END OF FUNCTION CHUNK FOR FTNKGN

; =============== S U B R O U T I N E =======================================


COLM30:                                 ; CODE XREF: FTNKGN-BF4↑p
                                        ; FTNKGN-BC3↑p
                LDA     M3PL_SIZEP3     ; Missle to Player 3 Collision / Player 3 Size
                AND     #1
                BNE     ST
                LDA     #111111b
                AND     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size

SU:                                     ; CODE XREF: COLM30+1E↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

ST:                                     ; CODE XREF: COLM30+5↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                ADC     DIFF.field_3    ; Difficulty for the level
                SBC     byte_65D
                CMP     DIFF.field_4    ; Difficulty for the level
                BCS     SU              ; => Return
                JSR     SR
                JSR     SV
                RTS
; End of function COLM30

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR ENRUN

TY:                                     ; CODE XREF: ENRUN+19↓j
                LDA     #36
                STA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                LDA     byte_676
                CMP     #2
                BNE     WI
                LDA     #255
                STA     byte_B6

WI:                                     ; CODE XREF: ENRUN-11↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #127
                ORA     #64
                STA     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear
                RTS
; END OF FUNCTION CHUNK FOR ENRUN

; =============== S U B R O U T I N E =======================================

; Draw the enemy runway, when visible

ENRUN:                                  ; CODE XREF: DROAD+42↓p

; FUNCTION CHUNK AT 2C23 SIZE 0000001B BYTES

                LDA     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear
                BEQ     TX
                DEC     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear

XE:                                     ; CODE XREF: ENRUN+14↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

TX:                                     ; CODE XREF: ENRUN+3↑j
                LDA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                CMP     #36             ; first row of the runway appearing?
                BNE     WX
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_DIAGNOAL_ROAD_2 ; not before level 3
                BCS     XE              ; => Return

WX:                                     ; CODE XREF: ENRUN+E↑j
                DEC     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                BEQ     TY
                LDA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                CMP     #35
                BNE     TZ
                STA     byte_6F9

UD:                                     ; CODE XREF: ENRUN+8E↓j
                LDY     #0
                STY     byte_B6
                LDA     #2
                STA     byte_676
                JMP     DFHNGR          ; Define Hangar – restore the font characters for the hangar
; ---------------------------------------------------------------------------

TZ:                                     ; CODE XREF: ENRUN+20↑j
                LDA     byte_676
                CMP     #2
                BNE     WH
                STA     byte_B6

WH:                                     ; CODE XREF: ENRUN+36↑j
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #7
                TAY
                LDX     #11

UA:                                     ; CODE XREF: ENRUN+4A↓j
                DEY
                LDA     ENRNIM-1,X      ; Enemy runway
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEX
                BNE     UA

                INY
                LDA     ENEMY_RUNWAY_PLANE_FLAG
                BEQ     UB
                LDA     #L_RUNWAY_PLANE_TOP_LEFT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                LDA     #L_RUNWAY_PLANE_TOP_RIGHT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #0
                STA     ENEMY_RUNWAY_PLANE_FLAG
                JMP     UC
; ---------------------------------------------------------------------------

UB:                                     ; CODE XREF: ENRUN+50↑j
                LDA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                CMP     #4
                BCC     UC
                CMP     #33
                BCS     UC

                LDA     RANDOM          ; Random Number Generator
                AND     #7
                BNE     UC              ; 12.5% chance of a plane
                INY
                LDA     #L_RUNWAY_PLANE_BOTTOM_LEFT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                LDA     #L_RUNWAY_PLANE_BOTTOM_RIGHT|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                STA     ENEMY_RUNWAY_PLANE_FLAG

UC:                                     ; CODE XREF: ENRUN+60↑j
                                        ; ENRUN+68↑j ...
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #19
                TAY
                LDA     ENEMY_RUNWAY_LENGTH ; Length/current line of the enemy runway (default length=36)
                CMP     #20
                BEQ     UD
                CMP     #19
                BEQ     UE              ; Draw HNGR1 - first row of the hangar
                CMP     #18
                BEQ     UF              ; Draw HNGR2 - second row of the hangar
                CMP     #17
                BEQ     UG              ; Draw HNGR3 - center part
                CMP     #16
                BEQ     UG              ; Draw HNGR3 - center part
                CMP     #15
                BEQ     UH              ; Draw HNGR3 - second to last row
                CMP     #14
                BEQ     UI              ; Draw HNGR5 - last row
                CMP     #34
                BEQ     H0              ; Add Anti-Aircraft-Battery
                CMP     #9
                BEQ     H0              ; Add Anti-Aircraft-Battery
                RTS
; ---------------------------------------------------------------------------

UE:                                     ; CODE XREF: ENRUN+92↑j
                                        ; DRUN__DRAW_RUNWAY+12D↓j
                LDX     #5              ; Draw HNGR1 - first row of the hangar

UJ:                                     ; CODE XREF: ENRUN+BA↓j
                LDA     HNGR1-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     UJ
                RTS
; ---------------------------------------------------------------------------

UF:                                     ; CODE XREF: ENRUN+96↑j
                                        ; DRUN__DRAW_RUNWAY:FC↓j
                LDX     #6              ; Draw HNGR2 - second row of the hangar

UK:                                     ; CODE XREF: ENRUN+C6↓j
                LDA     HNGR2-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     UK
                RTS
; ---------------------------------------------------------------------------

UG:                                     ; CODE XREF: ENRUN+9A↑j
                                        ; ENRUN+9E↑j ...
                LDX     #6              ; Draw HNGR3 - center part

UM:                                     ; CODE XREF: ENRUN+D2↓j
                                        ; ENRUN+D8↓j
                LDA     HNGR3-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     UM
                RTS
; ---------------------------------------------------------------------------

UH:                                     ; CODE XREF: ENRUN+A2↑j
                                        ; DRUN__DRAW_RUNWAY:FF↓j
                LDX     #5              ; Draw HNGR3 - second to last row
                DEY
                JMP     UM
; ---------------------------------------------------------------------------

UI:                                     ; CODE XREF: ENRUN+A6↑j
                                        ; DRUN__DRAW_RUNWAY:FE↓j
                LDX     #4              ; Draw HNGR5 - last row
                DEY
                DEY

UN:                                     ; CODE XREF: ENRUN+E6↓j
                LDA     HNGR5-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     UN

R0:                                     ; => Return
                RTS
; ---------------------------------------------------------------------------

H0:                                     ; CODE XREF: ENRUN+AA↑j
                                        ; ENRUN+AE↑j
                LDA     ROAD_RIGHT_X_POS ; Add Anti-Aircraft-Battery
                SEC
                SBC     #7
                TAY
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     H1
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                JMP     H2
; ---------------------------------------------------------------------------

H1:                                     ; CODE XREF: ENRUN+F4↑j
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_1

H2:                                     ; CODE XREF: ENRUN+F8↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #0
                STA     byte_6A3
                LDA     byte_FD
                BNE     H4
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                JMP     H3
; ---------------------------------------------------------------------------

H4:                                     ; CODE XREF: ENRUN+106↑j
                JMP     B5
; End of function ENRUN


; =============== S U B R O U T I N E =======================================


AREA:                                   ; CODE XREF: CITY+3↓p
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     #2
                BCC     TC
                CPY     #87
                BCC     TD

TC:                                     ; CODE XREF: AREA+4↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     TU              ; => Return
                JSR     B7              ; Advance to next row of the level
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     WW
                CMP     #GAME_PHASE_8
                BCC     TU              ; => Return

WW:                                     ; CODE XREF: AREA+15↑j
                JSR     DROAD
                JSR     TNKC
                JSR     TNKC1
                JSR     GUNC

TU:                                     ; CODE XREF: AREA+C↑j
                                        ; AREA+19↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

TD:                                     ; CODE XREF: AREA+8↑j
                CPY     #40
                BCC     TE
                LDA     #$80
                STA     byte_610
                JMP     TF
; ---------------------------------------------------------------------------

TE:                                     ; CODE XREF: AREA+2A↑j
                LDA     #$FF
                STA     byte_610

TF:                                     ; CODE XREF: AREA+31↑j
                JMP     DRAW            ; Draw river/gras on the map
; End of function AREA


; =============== S U B R O U T I N E =======================================

; Clear one row of playfield with default character

CLEAR:                                  ; CODE XREF: CITY↓p B7+9D↓p
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     TN              ; => Return
                LDY     #64
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     XD
                CMP     #GAME_PHASE_8
                BCS     XD
                LDA     #L_SOLID_WALL|L_C_1
                JMP     TG
; ---------------------------------------------------------------------------

XD:                                     ; CODE XREF: CLEAR+A↑j
                                        ; CLEAR+E↑j
                LDA     #L_GRAS|L_C_0

TG:                                     ; CODE XREF: CLEAR+12↑j
                                        ; CLEAR+1A↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                BNE     TG
                RTS
; End of function CLEAR


; =============== S U B R O U T I N E =======================================


DROAD:                                  ; CODE XREF: AREA:WW↑p
                LDA     byte_668
                BEQ     TM
                DEC     byte_668

TN:                                     ; CODE XREF: CLEAR+2↑j
                                        ; TNKC+12↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

TM:                                     ; CODE XREF: DROAD+3↑j
                LDY     byte_669
                CPY     ROAD_RIGHT_X_POS ; right X position where the road starts
                BEQ     TO
                LDA     #COLOR_INTENSITY_10|COLOR_ORANGE
                STA     COLOR1
                STA     SAVED_COLOR0_3+1
                LDX     #7

TR:                                     ; CODE XREF: DROAD+2A↓j
                CPY     #65
                BCS     TP
                CPY     #0
                BEQ     TQ
                LDA     ROADR-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

TP:                                     ; CODE XREF: DROAD+1D↑j
                DEY
                DEX
                BNE     TR

TQ:                                     ; CODE XREF: DROAD+21↑j
                INC     byte_669
                RTS
; ---------------------------------------------------------------------------

TO:                                     ; CODE XREF: DROAD+F↑j
                DEY
                LDX     #5

TS:                                     ; CODE XREF: DROAD+3A↓j
                DEY
                LDA     ROADS-1,X
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEX
                BNE     TS
                JSR     DRCAR           ; Draw a car in the middle of a vertial/diagnal road
                JSR     BLDG
                JSR     ENRUN           ; Draw the enemy runway, when visible
                RTS
; End of function DROAD


; =============== S U B R O U T I N E =======================================


TNKC:                                   ; CODE XREF: AREA+1E↑p
                LDA     byte_650
                BEQ     TV
                DEC     byte_650
                RTS
; ---------------------------------------------------------------------------

TV:                                     ; CODE XREF: TNKC+3↑j
                LDA     BUILDING_ROW_COUNTER
                BNE     TW
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_ROAD_HARD_RIGHT_3
                BCS     TN              ; => Return
                JMP     QS
; ---------------------------------------------------------------------------

TW:                                     ; CODE XREF: TNKC+C↑j
                LDY     ROAD_RIGHT_X_POS ; right X position where the road starts
                JMP     TT
; End of function TNKC


; =============== S U B R O U T I N E =======================================


CITY:                                   ; CODE XREF: EB+153↑j
                                        ; CITY+34↓j
                JSR     CLEAR           ; Clear one row of playfield with default character
                JSR     AREA
                JSR     PLFWD
                JSR     PLBCK
                JSR     BLDGC
                JSR     BLDGL
                JSR     PRIOR__
                JSR     CTYGN
                LDA     byte_638
                BNE     _7
                JSR     DRUN__DRAW_RUNWAY ; Draw the runway on the map

_7:                                     ; CODE XREF: CITY+1B↑j
                JSR     COMMON
                JSR     CKCOL           ; Check collision?!?
                JSR     CPTL
                JSR     SPD__SPEED_CHANGE ; Change the speed of the plane up/down based on the joystick
                JSR     CDRP
                JSR     TIMER           ; Wait for Timer 3. Sync gameplay to 60Hz
                STA     ATRACT          ; ATRACT FLAG
                JMP     CITY
; End of function CITY


; =============== S U B R O U T I N E =======================================


ASTRSK:                                 ; CODE XREF: LINE:_1↓p
                LDY     SC_STATUS_LINE.line_1.speed_digit_100
                CPY     #_2|_C_BLUE
                BCC     _4              ; => Return
                LDY     #_ASTERIX|_C_ORANGE
                LDA     byte_C2
                SBC     ENEMY_Y_POS     ; Enemy Y position
                CMP     TEMP_B0
                BCC     _1
                STY     SC_STATUS_LINE.line_0.enemy_above_warning ; red "*" character

_4:                                     ; CODE XREF: ASTRSK+5↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: ASTRSK+F↑j
                STY     SC_STATUS_LINE.line_2.field_14 ; "*" character
                RTS
; End of function ASTRSK


; =============== S U B R O U T I N E =======================================


AEL:                                    ; CODE XREF: L6+113↑p LINE+4↓j
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_0.enemy_above_warning ; red "*" character
                STA     SC_STATUS_LINE.line_2.field_14 ; "*" character
                JMP     UO
; End of function AEL


; =============== S U B R O U T I N E =======================================

; Check line of sight: enemy plane at the same altitude?

LINE:                                   ; CODE XREF: PLFWD+DE↑p
                                        ; L6+1C↑p
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                CMP     byte_C2
                BCC     AEL
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                SBC     #7
                STA     TEMP_B0
                LDA     byte_C2
                SBC     ENEMY_Y_POS     ; Enemy Y position
                SBC     TEMP_B0
                CMP     #14
                BCS     _1

                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_0.enemy_above_warning ; red "*" character
                STA     SC_STATUS_LINE.line_2.field_14 ; "*" character
                LDA     #COLOR_INTENSITY_2|COLOR_LIGHT_BLUE ; at same altitude as enemy plane - can now be destroyed
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ

                LDA     TEMP_B0
                CMP     #18
                BCS     _5
                LDA     #0
                STA     AUDC2           ; Audio 2 Channel Control Register

_5:                                     ; CODE XREF: LINE+27↑j
                LDA     AUDIO3_SOUND_COUNTER
                BNE     UU              ; => Return
                DEC     byte_6A4
                LDA     byte_6A4
                CMP     #235
                BCC     F6
                LDA     #SND_FREQ_15
                STA     AUDF3           ; Audio 3 Frequency Register
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_4
                STA     AUDC3           ; Audio 3 Channel Control Register
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: LINE+14↑j
                JSR     ASTRSK
; End of function LINE


; =============== S U B R O U T I N E =======================================


UO:                                     ; CODE XREF: AEL+8↑j
                                        ; COLM02+2C↓p
                LDA     #0
                STA     byte_6A4
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ

F6:                                     ; CODE XREF: LINE+3B↑j
                LDA     AUDIO3_SOUND_COUNTER
                BNE     UU              ; => Return
                LDA     #0
                STA     AUDC3           ; Audio 3 Channel Control Register
                RTS
; End of function UO


; =============== S U B R O U T I N E =======================================

; If Player is at the same altitude as the enemey plane, check if that one got hit

COLM02:                                 ; CODE XREF: PLFWD+E1↑p
                                        ; PLBCK+20↑p ...
                LDA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                CMP     #COLOR_INTENSITY_2|COLOR_LIGHT_BLUE ; Is the enemy plane at the same altitude as the player plane?
                BEQ     UT              ; => Yes

UU:                                     ; CODE XREF: LINE+31↑j UO+B↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

UT:                                     ; CODE XREF: COLM02+5↑j
                LDY     PLANE_BULLET_Y_POS ; No bullet flying?
                BEQ     UU              ; => Return

                LDA     M0PL            ; Missle to Player 0 Collision
                AND     #100b           ; Player bullet collision with an enemy?
                CMP     #100b           ; no collision?
                BNE     UU              ; => Return

                LDA     PCOLR2          ; P2 COLOR
                CMP     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE ; Is the target a primary one?
                BEQ     V4
                CMP     #COLOR_INTENSITY_8|COLOR_TURQUOISE
                BNE     U6              ; => regular target

V4:                                     ; CODE XREF: COLM02+1A↑j
                INC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                JSR     S100__SCORE_ADD_100 ; Score: add 100
                JSR     S100__SCORE_ADD_100 ; +200 extra points for a primary target

U6:                                     ; CODE XREF: COLM02+1E↑j
                JSR     HG              ; Remove plane bullet
                JSR     UO

                LDA     byte_FD
                CMP     #2
                BEQ     _1
                JSR     S100__SCORE_ADD_100 ; Score: add 100
                JSR     S100__SCORE_ADD_100 ; Score: add 100

_1:                                     ; CODE XREF: COLM02+33↑j
                JSR     S100__SCORE_ADD_100 ; Score: add 100

                LDA     #0
                STA     byte_B1
                LDY     byte_C2
                LDX     #8

VB:                                     ; CODE XREF: COLM02+4B↓j
                STA     P3+7,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     VB
                JSR     DG
                LDA     #100
                STA     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                LDY     byte_656
                JSR     RO
                PLA
                PLA
                JSR     ABA             ; Save current color palette, because we start the flashing animation
                STX     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                LDA     #50
                LDX     #AUDIO_CONTROL_VOL_12|AUDIO_CONTROL_DIST_1
                JMP     XXX             ; Start Audio 3 sound effect
; End of function COLM02


; =============== S U B R O U T I N E =======================================


XP2:                                    ; CODE XREF: LF↑p PLBCK+13↑p ...
                LDA     byte_B1
                BEQ     US
                RTS
; ---------------------------------------------------------------------------

US:                                     ; CODE XREF: XP2+2↑j
                DEC     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                BEQ     UV
                LDA     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                CMP     #30
                BCS     UY
                LDA     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                JMP     UX
; ---------------------------------------------------------------------------

UY:                                     ; CODE XREF: XP2+F↑j
                LSR     A
                LSR     A
                LSR     A
                BCC     UW
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE
                JMP     UX
; ---------------------------------------------------------------------------

UW:                                     ; CODE XREF: XP2+19↑j
                LDA     #COLOR_INTENSITY_6|COLOR_RED_ORANGE

UX:                                     ; CODE XREF: XP2+13↑j XP2+1D↑j
                STA     PCOLR2          ; P2 COLOR
                LDA     byte_FD
                CMP     #3
                BNE     VD
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #187
                BCS     UV
                LDX     #15

VE:                                     ; CODE XREF: XP2+41↓j
                LDA     P2+$A,Y         ; Enemy (first color)
                STA     P2+$B,Y         ; Enemy (first color)
                LDA     P3+$A,Y         ; Enemy (second color)
                STA     P3+$B,Y         ; Enemy (second color)
                DEY
                DEX
                BNE     VE
                INC     ENEMY_Y_POS     ; Enemy Y position

VD:                                     ; CODE XREF: XP2+29↑j
                JSR     COLP02
                PLA
                PLA
                RTS
; ---------------------------------------------------------------------------

UV:                                     ; CODE XREF: XP2+8↑j XP2+2F↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                JSR     UZ
                LDA     #10
                STA     byte_B1
                PLA
                PLA
                RTS
; End of function XP2


; =============== S U B R O U T I N E =======================================

; DL IRQ triggered when the control display is reached

VDSLST_ROUTINE:                         ; DATA XREF: RESET+E8↑t
                                        ; RESET+ED↑t
                PHA
                TXA
                PHA
                LDA     #COLOR_INTENSITY_0|COLOR_ORANGE_GREEN
                LDX     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                STA     WSYNC           ; Wait for Horizontal Blank Synchronisation
                STX     COLBK           ; Background Color
                STA     CHBASE          ; Character Address Base Register
                LDA     #COLOR_INTENSITY_8|COLOR_LIGHT_BLUE
                LDX     DL_IRQ_COLPF1   ; COLPF1 color set in the DL IRQ
                STA     COLPF3          ; Playfield Color 3
                STX     COLPF1          ; Playfield Color 1
                LDA     #COLOR_INTENSITY_6|COLOR_RED_ORANGE
                STA     COLPF2          ; Playfield Color 2
                PLA
                TAX
                PLA
                RTI
; End of function VDSLST_ROUTINE


; =============== S U B R O U T I N E =======================================


BLDG:                                   ; CODE XREF: DROAD+3F↑p
                LDA     byte_B2
                BEQ     loc_2FB6
                DEC     byte_B2
                RTS
; ---------------------------------------------------------------------------

loc_2FB1:                               ; CODE XREF: BLDG+33↓j
                LDA     #15
                STA     byte_B2

locret_2FB5:                            ; CODE XREF: BLDG+15↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_2FB6:                               ; CODE XREF: BLDG+2↑j
                LDA     byte_674
                BEQ     loc_2FEA
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_ROAD_HARD_RIGHT_3
                BCS     locret_2FB5     ; => Return
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                ORA     #3
                STA     byte_671
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     loc_2FD8
                LDA     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear
                CMP     #20
                BCS     loc_2FED

loc_2FD8:                               ; CODE XREF: BLDG+25↑j
                LDA     byte_650
                CMP     #10
                BCC     loc_2FB1
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                ADC     #3
                ADC     byte_671
                JMP     loc_2FF2
; ---------------------------------------------------------------------------

loc_2FEA:                               ; CODE XREF: BLDG+F↑j
                JMP     loc_3048
; ---------------------------------------------------------------------------

loc_2FED:                               ; CODE XREF: BLDG+2C↑j
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SBC     #9

loc_2FF2:                               ; CODE XREF: BLDG+3D↑j
                STA     byte_670
                LDX     #3
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     loc_2FFE
                INX

loc_2FFE:                               ; CODE XREF: BLDG+51↑j
                STX     byte_672
                LDA     RANDOM          ; Random Number Generator
                AND     #1
                CLC
                ADC     #2
                STA     byte_673

                LDA     byte_670
                CMP     ROAD_RIGHT_X_POS ; right X position where the road starts
                BCS     loc_301F
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCS     loc_301F
                LDA     #$86
                JMP     loc_3032
; ---------------------------------------------------------------------------

loc_301F:                               ; CODE XREF: BLDG+68↑j
                                        ; BLDG+6E↑j
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_DIAGNOAL_ROAD_2
                BCS     loc_302B
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     loc_3030

loc_302B:                               ; CODE XREF: BLDG+79↑j
                LDA     #6
                JMP     loc_3032
; ---------------------------------------------------------------------------

loc_3030:                               ; CODE XREF: BLDG+7F↑j
                LDA     #0

loc_3032:                               ; CODE XREF: BLDG+72↑j
                                        ; BLDG+83↑j
                STA     SKYSCRAPER_TILE_OFFSET
                LDY     #0
                STY     byte_B4
                STY     byte_B6
                STY     byte_674
                STY     byte_675
                INY
                STY     byte_676
                JSR     DFBLDG          ; Final target phase: define skyscraper buildings
                RTS
; ---------------------------------------------------------------------------

loc_3048:                               ; CODE XREF: BLDG:loc_2FEA↑j
                INC     byte_B4
                LDX     byte_B4
                CPX     byte_672
                BCS     loc_30CC
                LDY     byte_670
                LDA     #L_SKYSCRAPER_54|L_C_0
                CLC
                ADC     SKYSCRAPER_TILE_OFFSET
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                ADC     #2
                DEY
                CPX     #1
                BEQ     loc_306E
                CPX     #2
                BEQ     loc_3069
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

loc_3069:                               ; CODE XREF: BLDG+BA↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JMP     loc_30BF
; ---------------------------------------------------------------------------

loc_306E:                               ; CODE XREF: BLDG+B6↑j
                LDX     byte_671
                LDA     #L_SKYSCRAPER_57|L_C_0
                CLC
                ADC     SKYSCRAPER_TILE_OFFSET

loc_3076:                               ; CODE XREF: BLDG+D0↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_3076
                LDA     byte_676
                CMP     #1
                BNE     loc_3087
                LDA     #2
                STA     byte_B6

loc_3087:                               ; CODE XREF: BLDG+D7↑j
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                CMP     byte_670
                BCC     loc_309A
                SEC
                SBC     #8
                LDY     #255
                STY     byte_6A3
                JMP     loc_30A2
; ---------------------------------------------------------------------------

loc_309A:                               ; CODE XREF: BLDG+E3↑j
                CLC
                ADC     #2
                LDY     #9
                STY     byte_6A3

loc_30A2:                               ; CODE XREF: BLDG+ED↑j
                TAY
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     loc_30AE
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                JMP     loc_30B0
; ---------------------------------------------------------------------------

loc_30AE:                               ; CODE XREF: BLDG+FD↑j
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_1

loc_30B0:                               ; CODE XREF: BLDG+101↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     byte_FD
                BNE     loc_30BC
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                JMP     H3
; ---------------------------------------------------------------------------

loc_30BC:                               ; CODE XREF: BLDG+10A↑j
                JMP     B5
; ---------------------------------------------------------------------------

loc_30BF:                               ; CODE XREF: BLDG+C1↑j
                                        ; BLDG+13D↓j
                LDX     byte_671
                CLC
                ADC     #1

loc_30C5:                               ; CODE XREF: BLDG+11F↓j
                DEY
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEX
                BNE     loc_30C5
                RTS
; ---------------------------------------------------------------------------

loc_30CC:                               ; CODE XREF: BLDG+A5↑j
                DEC     byte_670
                LDY     byte_670
                CPX     byte_673
                BCS     loc_30EA
                LDX     byte_672
                DEX
                LDA     #L_SKYSCRAPER_56|L_C_0
                CLC
                ADC     SKYSCRAPER_TILE_OFFSET

loc_30E0:                               ; CODE XREF: BLDG+13A↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_30E0
                INY
                JMP     loc_30BF
; ---------------------------------------------------------------------------

loc_30EA:                               ; CODE XREF: BLDG+12B↑j
                INC     byte_675
                LDA     byte_672
                CMP     byte_675
                BEQ     loc_3122
                SEC
                SBC     #1
                SBC     byte_675
                BEQ     loc_3109
                TAX
                LDA     #L_SKYSCRAPER_56|L_C_0
                CLC
                ADC     SKYSCRAPER_TILE_OFFSET

loc_3103:                               ; CODE XREF: BLDG+15D↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_3103

loc_3109:                               ; CODE XREF: BLDG+151↑j
                LDA     #L_SKYSCRAPER_58|L_C_0
                CLC
                ADC     SKYSCRAPER_TILE_OFFSET
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDX     byte_671
                DEY
                DEX
                LDA     #L_SKYSCRAPER_55|L_C_0

loc_3117:                               ; CODE XREF: BLDG+171↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_3117
                LDA     #L_SKYSCRAPER_59|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

loc_3122:                               ; CODE XREF: BLDG+149↑j
                LDX     #255
                STX     byte_B6
                STX     byte_674
                LDA     RANDOM          ; Random Number Generator
                AND     #11111b
                ADC     #25
                STA     byte_B2
                LDA     byte_C4
                CMP     #5
                BNE     Q9              ; => Return
                LDA     #PRIMARY_TARGET_SUBTYPE_SKYSCRAPER
                STA     VAR_PRIMARY_TARGET_SUBTYPE
                LDY     #17
                LDA     byte_670
                CLC
                ADC     #10
                JMP     GNSGHT
; ---------------------------------------------------------------------------

Q9:                                     ; CODE XREF: BLDG+18C↑j
                RTS                     ; => Return
; End of function BLDG

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR B7

WY:                                     ; CODE XREF: B7+A↓j
                INC     byte_677
                LDA     byte_677
                CMP     #2
                BEQ     WZ
                CMP     #3
                BEQ     XS
                LDA     #72
                STA     ROAD_RIGHT_X_POS ; right X position where the road starts
                LDY     byte_669
                INY
                CPY     ROAD_RIGHT_X_POS ; right X position where the road starts
                BEQ     XC
                RTS
; ---------------------------------------------------------------------------

ADL:                                    ; CODE XREF: B7+2A↓j
                JMP     WT              ; Game phase: 6
; ---------------------------------------------------------------------------

XC:                                     ; CODE XREF: B7-38↑j
                LDA     #GAME_PHASE_RIVER_PHASE_0
                STA     CURRENT_GAME_PHASE
                LDA     #COLOR_INTENSITY_4|COLOR_LIGHT_BLUE
                STA     COLOR1
                STA     SAVED_COLOR0_3+1
                LSR     A
                STA     byte_FE
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                ORA     #$20 ; ' '
                AND     #$3F ; '?'
                STA     byte_638
                PLA
                PLA
                PLA
                PLA
                JSR     AKA
                JMP     SRT
; ---------------------------------------------------------------------------

YM:                                     ; CODE XREF: B7+22↓j
                JMP     U8              ; Game phase: 7
; ---------------------------------------------------------------------------

U9:                                     ; CODE XREF: B7+26↓j
                JMP     WV              ; Game phase: 8
; ---------------------------------------------------------------------------

WZ:                                     ; CODE XREF: B7-4A↑j
                INC     CURRENT_GAME_PHASE
                JMP     WS              ; phase is 24 rows long
; ---------------------------------------------------------------------------

XS:                                     ; CODE XREF: B7-46↑j
                INC     CURRENT_GAME_PHASE
                JMP     XB
; END OF FUNCTION CHUNK FOR B7

; =============== S U B R O U T I N E =======================================

; Advance to next row of the level

B7:                                     ; CODE XREF: AREA+E↑p

; FUNCTION CHUNK AT 3149 SIZE 00000052 BYTES

                LDA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                BEQ     WN              ; end of this phase reached? => advance to next one!
                DEC     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

WN:                                     ; CODE XREF: B7+2↑j
                LDA     byte_677
                BNE     WY

                INC     CURRENT_GAME_PHASE
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_DIAGNOAL_ROAD_2
                BEQ     WO              ; Game phase: 2
                CMP     #GAME_PHASE_ROAD_HARD_RIGHT_3
                BEQ     WP              ; Game phase: 3
                CMP     #GAME_PHASE_4
                BEQ     WQ              ; Game phase: 4
                CMP     #GAME_PHASE_5
                BEQ     WR              ; Game phase: 5
                CMP     #GAME_PHASE_7
                BEQ     YM              ; Game phase: 7
                CMP     #GAME_PHASE_8
                BEQ     U9              ; Game phase: 8
                CMP     #GAME_PHASE_6
                BEQ     ADL             ; Game phase: 6

; Game phase: 0 or 1

U7:                                     ; CODE XREF: B7+5E↓j
                JSR     DFGN            ; Restore anti-airgraft gun battery graphics at character $31
                LDY     #GAME_PHASE_DIAGNOAL_ROAD_1
                STY     CURRENT_GAME_PHASE
                STY     byte_677
                STY     byte_B6
                DEY
                STY     COLOR4
                LDA     #COLOR_INTENSITY_2|COLOR_YELLOW_GREEN
                STA     COLOR2
                STA     SAVED_COLOR0_3+2
                LDA     RANDOM          ; Random Number Generator
                AND     #63
                ORA     #64             ; Length: 64-127 rows
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                LDA     #COLOR_INTENSITY_10|COLOR_ORANGE
                STA     COLOR1
                STA     SAVED_COLOR0_3+1
                RTS
; ---------------------------------------------------------------------------

WO:                                     ; CODE XREF: B7+12↑j
                LDA     #61             ; Game phase: 2
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

WP:                                     ; CODE XREF: B7+16↑j
                LDY     byte_6AE        ; Game phase: 3
                BEQ     U7
                LDY     #1
                STY     byte_B6
                STY     byte_684
                STY     byte_67D
                STY     byte_694
                STY     byte_68A
                STY     byte_68E
                DEY
                STY     COLOR1
                INC     byte_6A6
                STY     SAVED_COLOR0_3+1

XB:                                     ; CODE XREF: B7-3↑j
                LDA     #13
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

WQ:                                     ; CODE XREF: B7+1A↑j
                LDA     #0              ; Game phase: 4
                STA     byte_B6
                STA     byte_BA
                STA     byte_690

WS:                                     ; CODE XREF: B7-8↑j B7+B4↓j ...
                LDA     #24             ; phase is 24 rows long
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

WR:                                     ; CODE XREF: B7+1E↑j
                LDA     #COLOR_INTENSITY_6|COLOR_GRAY ; Game phase: 5
                STA     COLOR2
                STA     SAVED_COLOR0_3+2
                LDA     #COLOR_INTENSITY_4|COLOR_GRAY
                STA     COLOR4

                JSR     CLEAR           ; Clear one row of playfield with default character
                JSR     DFHNGR          ; Define Hangar – restore the font characters for the hangar
                JSR     DFTNK
                JSR     DFBLDG          ; Final target phase: define skyscraper buildings

                LDX     #7              ; Set new anti-airgraft gun battery graphics at character $31

_1:                                     ; CODE XREF: B7+B2↓j
                LDA     ADJ,X           ; Final city anti-aircraft gun battery. Replaces character $31 (standard anti-aircraft gun battery)
                STA     ADK,X           ; $31: Anti-Aircraft Battery
                DEX
                BPL     _1
                JMP     WS              ; phase is 24 rows long
; ---------------------------------------------------------------------------

WT:                                     ; CODE XREF: B7:ADL↑j
                LDA     #COLOR_INTENSITY_0|COLOR_GOLD ; Game phase: 6
                STA     COLOR3
                STA     SAVED_COLOR0_3+3
                LDA     #COLOR_INTENSITY_0|COLOR_RED_ORANGE
                STA     COLOR0          ; COLOR 0
                STA     SAVED_COLOR0_3

                LDA     RANDOM          ; Random Number Generator
                AND     #31
                ORA     #64             ; Length: 64-95 rows
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

U8:                                     ; CODE XREF: B7:YM↑j
                LDA     #36             ; Game phase: 7
                STA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                RTS
; ---------------------------------------------------------------------------

WV:                                     ; CODE XREF: B7:U9↑j
                LDA     #COLOR_INTENSITY_4|COLOR_GREEN ; Game phase: 8
                STA     COLOR0          ; COLOR 0
                STA     SAVED_COLOR0_3
                LDA     #COLOR_INTENSITY_4|COLOR_GRAY
                STA     SAVED_COLOR0_3+3
                STA     COLOR3

                DEC     byte_6A6
                PLA
                PLA
                JMP     WS              ; phase is 24 rows long
; End of function B7


; =============== S U B R O U T I N E =======================================

; Check if Wind Warnings are possible and randomly trigger it.

WIND:                                   ; CODE XREF: COMMON+D↑p
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: WIND+2↑j
                LDA     WIND_DURATION   ; Duration during which Wind is in effect
                BNE     ZP
                LDA     RANDOM          ; Random Number Generator
                CMP     DIFF.wind_probability ; Difficulty for the level
                BCS     ZQ              ; => Return
                LDA     RANDOM          ; Random Number Generator
                AND     #11111b
                ORA     #7
                ADC     DIFF.wind_minimum_duration ; Difficulty for the level
                STA     WIND_DURATION   ; Duration during which Wind is in effect
                LDA     #_W|_C_BLUE
                STA     SC_STATUS_LINE.line_1.wind_factor_warning ; "W" character
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     ZR
                LDA     #0
                STA     WIND_ENABLED    ; 50% chance that wind is in effect
                RTS
; ---------------------------------------------------------------------------

ZR:                                     ; CODE XREF: WIND+26↑j
                STA     WIND_ENABLED    ; 50% chance that wind is in effect

ZQ:                                     ; CODE XREF: WIND+F↑j
                                        ; WIND+45↓j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

ZP:                                     ; CODE XREF: WIND+7↑j
                DEC     WIND_DURATION   ; Duration during which Wind is in effect
                BNE     ZS
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_1.wind_factor_warning ; "W" character
                RTS
; ---------------------------------------------------------------------------

ZS:                                     ; CODE XREF: WIND+34↑j
                LDA     WIND_ENABLED    ; 50% chance that wind is in effect
                BNE     ZT
                LDY     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CPY     #PLANE_MAX_X_POSITION ; max. allowed X position for the plane
                BEQ     ZQ              ; => Return
                INC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                INY

ZU:                                     ; CODE XREF: WIND+5A↓j
                STY     HPOSP0          ; Player Plane (Horizontal Position – first color)
                STY     HPOSP1          ; Player Plane (Horizontal Position – second color)
                RTS
; ---------------------------------------------------------------------------

ZT:                                     ; CODE XREF: WIND+3F↑j
                LDY     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CPY     #PLANE_MIN_XorY_POSITION ; min. allowed X position for the plane
                BEQ     ZQ              ; => Return
                DEC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                DEY
                JMP     ZU
; End of function WIND


; =============== S U B R O U T I N E =======================================


BLDGL:                                  ; CODE XREF: CITY+F↑p
                LDA     CURRENT_GAME_PHASE
                CMP     #5
                BCC     YY              ; => Return
                CMP     #8
                BCC     YZ

YY:                                     ; CODE XREF: BLDGL+4↑j
                                        ; BLDGL+D↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

YZ:                                     ; CODE XREF: BLDGL+8↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     YY              ; => Return
                LDX     #4

ZA:                                     ; CODE XREF: BLDGL+1C↓j
                LDA     DIRECTION_A,X
                PHA
                LDA     byte_686,X
                STA     DIRECTION_A,X
                DEX
                BNE     ZA
                LDX     #4

ZB:                                     ; CODE XREF: BLDGL+2B↓j
                LDA     DIRECTION_B,X
                PHA
                LDA     byte_68A,X
                STA     DIRECTION_B,X
                DEX
                BNE     ZB
                LDX     #5

ZC:                                     ; CODE XREF: BLDGL+38↓j
                LDA     GAME_PHASE_ROWS,X ; Length of a game phase in remaining rows
                PHA
                LDA     byte_68E,X
                STA     GAME_PHASE_ROWS,X ; Length of a game phase in remaining rows
                DEX
                BNE     ZC
                DEC     byte_694
                JSR     ZE
                INC     byte_694
                LDX     #0

ZF:                                     ; CODE XREF: BLDGL+50↓j
                LDA     byte_B9,X
                STA     byte_68F,X
                PLA
                STA     byte_B9,X
                INX
                CPX     #5
                BNE     ZF
                LDX     #0

ZG:                                     ; CODE XREF: BLDGL+61↓j
                LDA     byte_681,X
                STA     byte_68B,X
                PLA
                STA     byte_681,X
                INX
                CPX     #4
                BNE     ZG
                LDX     #0

ZH:                                     ; CODE XREF: BLDGL+72↓j
                LDA     byte_67A,X
                STA     byte_687,X
                PLA
                STA     byte_67A,X
                INX
                CPX     #4
                BNE     ZH
                RTS
; End of function BLDGL


; =============== S U B R O U T I N E =======================================


SHBNE:                                  ; CODE XREF: PRIOR__:loc_33BE↓p
                LDX     #8
                LDA     #0
                LDY     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow

ZL:                                     ; CODE XREF: SHBNE+B↓j
                STA     P1+7,Y          ; Player Plane (BLACK parts)
                DEY
                DEX
                BNE     ZL
                RTS
; End of function SHBNE


; =============== S U B R O U T I N E =======================================


PRIOR__:                                ; CODE XREF: CITY+12↑p
                LDA     byte_685
                BEQ     loc_3380
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     locret_339F     ; => Return
                LDA     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
                AND     #1001b
                BNE     locret_339F     ; => Return
                STA     byte_685
                STA     byte_C5

loc_3380:                               ; CODE XREF: PRIOR__+3↑j
                LDA     byte_686
                BNE     locret_339F     ; => Return
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_8
                BCC     loc_33A0
                LDA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                AND     #1001b
                BEQ     loc_33A0
                LDA     #1
                STA     byte_686
                STA     GPRIOR          ; PRIO = Players first, then Playfield
                STA     byte_C5
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1

locret_339F:                            ; CODE XREF: PRIOR__+9↑j
                                        ; PRIOR__+10↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_33A0:                               ; CODE XREF: PRIOR__+20↑j
                                        ; PRIOR__+27↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LSR     A
                CLC
                ADC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                STA     byte_6EA
                CMP     #213
                BCC     loc_33BA
                CMP     #243
                BCS     loc_33BE
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1
                LDA     #4
                STA     GPRIOR          ; PRIO = Playfield first, then Players
                RTS
; ---------------------------------------------------------------------------

loc_33BA:                               ; CODE XREF: PRIOR__+42↑j
                CMP     #150
                BCS     loc_33D9

loc_33BE:                               ; CODE XREF: PRIOR__+46↑j
                JSR     SHBNE
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #82
                BCS     loc_33DC
                LDX     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                BEQ     loc_33DC
                SBC     #2
                STA     byte_654
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1
                JMP     CRASH           ; Plane was crashed
; ---------------------------------------------------------------------------

loc_33D9:                               ; CODE XREF: PRIOR__+53↑j
                JSR     SHDW_SUB        ; Copy Plane Shadow into P1

loc_33DC:                               ; CODE XREF: PRIOR__+5E↑j
                                        ; PRIOR__+63↑j
                LDA     #1
                STA     GPRIOR          ; PRIO = Players first, then Playfield
                RTS
; End of function PRIOR__


; =============== S U B R O U T I N E =======================================


BLDGC:                                  ; CODE XREF: CITY+C↑p
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     YE              ; => Return
                CMP     #GAME_PHASE_8
                BCC     YF

YE:                                     ; CODE XREF: BLDGC+4↑j
                                        ; BLDGC+D↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

YF:                                     ; CODE XREF: BLDGC+8↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     YE              ; => Return
; End of function BLDGC


; =============== S U B R O U T I N E =======================================


ZE:                                     ; CODE XREF: BLDGL+3D↑p

; FUNCTION CHUNK AT 3464 SIZE 00000097 BYTES

                LDA     byte_67D
                BEQ     YG
                DEC     byte_67D
                RTS
; ---------------------------------------------------------------------------

YG:                                     ; CODE XREF: ZE+3↑j
                LDA     byte_BA
                BNE     YL
                JSR     END
                LDA     #6
                STA     byte_67B
                STA     byte_BA

YL:                                     ; CODE XREF: ZE+B↑j
                INC     byte_B9
                LDX     byte_B9
                CPX     #4
                BCC     XK
                LDA     byte_684
                BNE     YQ
                JSR     B77
                CPX     #7
                BNE     loc_3473
                LDA     #100
                STA     byte_67D
                RTS
; ---------------------------------------------------------------------------

YQ:                                     ; CODE XREF: ZE+22↑j
                DEC     byte_67A
                LDY     byte_67A
                LDA     #L_RUNWAY_CENTER_12|L_C_0
                CLC
                ADC     byte_BB
                LDX     #3

XO:                                     ; CODE XREF: ZE+42↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     XO
                JSR     XYZ
                LDX     byte_B9
                CPX     #7
                BNE     XQ
                STX     byte_BA
; End of function ZE


; =============== S U B R O U T I N E =======================================


YI:                                     ; CODE XREF: ZE+7E↓j ZE+E4↓p
                LDX     byte_67B

XR:                                     ; CODE XREF: YI+7↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     XR
                LDA     byte_BA
                CMP     #6
                BEQ     YH              ; => Return
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_7
                BNE     YS
                LDA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                CMP     #13
                BCS     YS
                LDA     #0
                STA     byte_684

YS:                                     ; CODE XREF: YI+13↑j YI+19↑j
                JSR     END

YH:                                     ; CODE XREF: YI+D↑j
                RTS                     ; => Return
; End of function YI

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR ZE

XK:                                     ; CODE XREF: ZE+1D↑j
                JMP     loc_34A3
; ---------------------------------------------------------------------------

XQ:                                     ; CODE XREF: ZE+4B↑j
                PHA
                LDA     byte_BA
                CMP     #7
                BEQ     loc_3472
                PLA
                JMP     YI
; ---------------------------------------------------------------------------

loc_3472:                               ; CODE XREF: ZE+7B↑j
                PLA

loc_3473:                               ; CODE XREF: ZE+29↑j
                CPX     #6
                BEQ     loc_3487
                LDA     #18
                CLC
                ADC     byte_681+1
                CPX     #5
                BEQ     loc_3484
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

loc_3484:                               ; CODE XREF: ZE+8E↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

loc_3487:                               ; CODE XREF: ZE+84↑j
                LDA     #L_65|L_C_0
                CLC
                ADC     byte_681
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDX     byte_67C
                INX
                INX
                INX
                LDA     #L_WATER_60|L_C_0

loc_3498:                               ; CODE XREF: ZE+AB↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_3498
                LDA     #L_61|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

loc_34A3:                               ; CODE XREF: ZE:XK↑j
                LDY     byte_67A
                LDA     byte_684
                BNE     loc_34B1
                JSR     B77
                JMP     loc_34D9
; ---------------------------------------------------------------------------

loc_34B1:                               ; CODE XREF: ZE+B8↑j
                LDA     #L_62|L_C_0
                CLC
                ADC     byte_BD
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDA     #L_RUNWAY_CENTER_12|L_C_0
                CLC
                ADC     byte_BB
                CPX     #1
                BEQ     loc_34CC
                CPX     #2
                BEQ     loc_34C9
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

loc_34C9:                               ; CODE XREF: ZE+D3↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

loc_34CC:                               ; CODE XREF: ZE+CF↑j
                JSR     XYZ
                LDX     byte_BA
                CPX     #6
                BNE     loc_34D9
                JSR     YI
                RTS
; ---------------------------------------------------------------------------

loc_34D9:                               ; CODE XREF: ZE+BD↑j ZE+E2↑j
                LDA     #L_RUNWAY_CENTER_12|L_C_0
                CLC
                ADC     byte_681+1
                LDX     #3

loc_34E1:                               ; CODE XREF: ZE+F4↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_34E1
                LDA     byte_67C
                CLC
                ADC     #4
                TAX
                LDA     #L_64|L_C_0
                CLC
                ADC     byte_681+2

loc_34F4:                               ; CODE XREF: ZE+107↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_34F4
                RTS
; END OF FUNCTION CHUNK FOR ZE

; =============== S U B R O U T I N E =======================================


XYZ:                                    ; CODE XREF: ZE+44↑p
                                        ; ZE:loc_34CC↑p
                LDA     #L_64|L_C_0
                LDX     #4
                CLC
                ADC     byte_BC

loc_3502:                               ; CODE XREF: XYZ+B↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     loc_3502
                RTS
; End of function XYZ


; =============== S U B R O U T I N E =======================================


END:                                    ; CODE XREF: ZE+D↑p YI:YS↑p
                LDA     byte_67B
                STA     byte_67C
                LDA     byte_BD
                STA     byte_681
                LDA     byte_BB
                STA     byte_681+1
                LDA     byte_BC
                STA     byte_681+2
                LDA     #$3D ; '='
                LDX     byte_694
                BNE     loc_3528
                SEC
                SBC     #$25 ; '%'

loc_3528:                               ; CODE XREF: END+1A↑j
                STA     byte_67A
                LDA     RANDOM          ; Random Number Generator
                AND     #3
                CLC
                ADC     #3
                STA     byte_67B
                LDA     #0
                STA     byte_B9
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     loc_3546
                LDX     CURRENT_GAME_PHASE
                CPX     #GAME_PHASE_6
                BEQ     loc_3560

loc_3546:                               ; CODE XREF: END+35↑j
                AND     #3
                BNE     loc_3555
                LDA     #0
                STA     byte_BD
                STA     byte_BC
                LDA     #$51 ; 'Q'
                STA     byte_BB
                RTS
; ---------------------------------------------------------------------------

loc_3555:                               ; CODE XREF: END+3F↑j
                LDA     #4
                STA     byte_BD
                LDA     #0
                STA     byte_BC
                STA     byte_BB
                RTS
; ---------------------------------------------------------------------------

loc_3560:                               ; CODE XREF: END+3B↑j
                AND     #3
                BEQ     loc_3577
                CMP     #1
                BEQ     loc_3582
                CMP     #2
                BEQ     loc_358D
                LDA     #$80
                STA     byte_BD
                STA     byte_BC
                LDA     #$D1
                STA     byte_BB
                RTS
; ---------------------------------------------------------------------------

loc_3577:                               ; CODE XREF: END+59↑j
                LDA     #$84
                STA     byte_BD
                LDA     #$80
                STA     byte_BB
                STA     byte_BC
                RTS
; ---------------------------------------------------------------------------

loc_3582:                               ; CODE XREF: END+5D↑j
                LDA     #6
                STA     byte_BD
                STA     byte_BC
                LDA     #$55 ; 'U'
                STA     byte_BB
                RTS
; ---------------------------------------------------------------------------

loc_358D:                               ; CODE XREF: END+61↑j
                LDA     #$86
                STA     byte_BD
                STA     byte_BC
                LDA     #$D5
                STA     byte_BB
                RTS
; End of function END


; =============== S U B R O U T I N E =======================================


B77:                                    ; CODE XREF: ZE+24↑p ZE+BA↑p
                LDY     byte_67A
                INX
                INX
                INX
                INX

loc_359F:                               ; CODE XREF: B77+9↓j
                DEY
                DEX
                BNE     loc_359F
                LDX     byte_B9
                RTS
; End of function B77


; =============== S U B R O U T I N E =======================================


FBTGN:                                  ; CODE XREF: SRT+27↑p
                                        ; CKLAND+2B↑p

; FUNCTION CHUNK AT 35AD SIZE 00000035 BYTES

                LDA     byte_BF
                CMP     #188
                BEQ     A3
                RTS
; End of function FBTGN

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FTNKGN
;   ADDITIONAL PARENT FUNCTION FBTGN

A3:                                     ; CODE XREF: FBTGN+4↑j
                                        ; FTNKGN:B4↓j
                LDY     byte_65F
                BNE     A7
                JSR     CKFGN

G3:                                     ; CODE XREF: FBRGN:ZW↑j
                                        ; FBRGN+51↑j
                LDA     MISSLE_3_X_POS2
                SEC
                SBC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                BCC     A4
                CMP     #20
                BCS     A9
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT
                JMP     A6
; ---------------------------------------------------------------------------

A9:                                     ; CODE XREF: FTNKGN-1F0↑j
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT2

A6:                                     ; CODE XREF: FTNKGN-1EC↑j
                                        ; FTNKGN-1D8↓j ...
                STA     VAR_MISSLE_3_STATE
                LDX     MISSLE_3_X_POS2
                JMP     SX              ; Set missile 3 X position
; ---------------------------------------------------------------------------

A4:                                     ; CODE XREF: FTNKGN-1F4↑j
                CMP     #240
                BCC     G1
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_NOTHING
                JMP     A6
; ---------------------------------------------------------------------------

G1:                                     ; CODE XREF: FTNKGN-1DC↑j
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_RIGHT
                JMP     A6
; ---------------------------------------------------------------------------

A7:                                     ; CODE XREF: FTNKGN-1FF↑j
                JMP     SM
; END OF FUNCTION CHUNK FOR FTNKGN

; =============== S U B R O U T I N E =======================================


CKFGN:                                  ; CODE XREF: FBRGN+9↑p
                                        ; FTNKGN-1FD↑p
                LDX     byte_661
                BEQ     A5
                LDA     byte_664
                BNE     A5
                LDY     byte_65D
                CPY     #166
                BCS     A5
                CPY     #70
                BCC     A5
                RTS
; ---------------------------------------------------------------------------

A5:                                     ; CODE XREF: CKFGN+3↑j
                                        ; CKFGN+8↑j ...
                PLA
                PLA
                RTS
; End of function CKFGN


; =============== S U B R O U T I N E =======================================


B3:                                     ; CODE XREF: B5+2E↓p
                                        ; GUNC-5C4↓j ...
                ASL     A
                ASL     A
                STA     MSHIP_BULLET_X_POS
                STA     byte_698
                LDA     #50
                STA     byte_699
                LDA     #45
                STA     byte_69A
                RTS
; End of function B3


; =============== S U B R O U T I N E =======================================


M2GPOS:                                 ; CODE XREF: COMMON+54↑p
                LDA     byte_698
                BNE     B6
                RTS
; ---------------------------------------------------------------------------

B8:                                     ; CODE XREF: M2GPOS+1D↓j
                                        ; M2GPOS+24↓j
                LDA     #0
                STA     byte_698
                RTS
; ---------------------------------------------------------------------------

B6:                                     ; CODE XREF: M2GPOS+3↑j
                LDA     byte_699
                BEQ     B9
                DEC     byte_699
                RTS
; ---------------------------------------------------------------------------

B9:                                     ; CODE XREF: M2GPOS+F↑j
                INC     byte_69A
                LDY     byte_69A
                CPY     #210
                BEQ     B8
                LDA     MSHIP_BULLET_X_POS
                CMP     #50
                BCC     B8
                DEC     byte_69B
                LDA     byte_69B
                LSR     A
                BCS     C0              ; => Return
                DEC     MSHIP_BULLET_X_POS

C0:                                     ; CODE XREF: M2GPOS+2D↑j
                RTS                     ; => Return
; End of function M2GPOS


; =============== S U B R O U T I N E =======================================


CKFM2:                                  ; CODE XREF: FM2GN+5↓p
                LDA     byte_FD
                BEQ     loc_364D
                CMP     #20
                BEQ     loc_364D
                CMP     #5
                BNE     loc_366E

loc_364D:                               ; CODE XREF: CKFM2+2↑j
                                        ; CKFM2+6↑j
                LDX     byte_698
                BEQ     loc_366E
                LDY     byte_69A
                CPY     #166
                BCS     loc_366E
                CPY     #70
                BCC     loc_366E
                LDA     byte_699
                BNE     loc_366E
                LDA     byte_FD
                CMP     #20
                BEQ     locret_366D     ; => Return
                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                STA     PCOLR2          ; P2 COLOR

locret_366D:                            ; CODE XREF: CKFM2+25↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_366E:                               ; CODE XREF: CKFM2+A↑j
                                        ; CKFM2+F↑j ...
                PLA
                PLA
                RTS
; End of function CKFM2


; =============== S U B R O U T I N E =======================================


FM2GN:                                  ; CODE XREF: COMMON+57↑p

; FUNCTION CHUNK AT 2B98 SIZE 0000000E BYTES
; FUNCTION CHUNK AT 3758 SIZE 0000001D BYTES

                LDY     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                BNE     C2

                JSR     CKFM2
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_6
                BCC     _1
                CMP     #GAME_PHASE_8
                BCS     _1
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_RIGHT
                JMP     C5
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: FM2GN+C↑j
                                        ; FM2GN+10↑j
                LDA     MSHIP_BULLET_X_POS

loc_368B:                               ; CODE XREF: FSHGN+1C↓j
                SEC
                SBC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                BCC     C3
                CMP     #20
                BCS     C4
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT
                JMP     C5
; ---------------------------------------------------------------------------

C4:                                     ; CODE XREF: FM2GN+21↑j
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT2

C5:                                     ; CODE XREF: FM2GN+14↑j
                                        ; FM2GN+25↑j ...
                STA     ENEMY_BULLET_MOVEMENT ; Movement pattern (state machine) for the bullet
                LDX     MSHIP_BULLET_X_POS
                JMP     C6
; ---------------------------------------------------------------------------

C3:                                     ; CODE XREF: FM2GN+1D↑j
                CMP     #240
                BCC     G2
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_NOTHING
                JMP     C5
; ---------------------------------------------------------------------------

G2:                                     ; CODE XREF: FM2GN+35↑j
                LDA     #ENEMY_BULLET_MOVEMENT_TYPES_RIGHT
                JMP     C5
; ---------------------------------------------------------------------------

C6:                                     ; CODE XREF: FM2GN+30↑j
                STX     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                STX     ENEMY_BULLET_X_POS ; X position of an enemy bullet (0=none)
                STY     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                LDA     #100000b
                STA     MISSLE,Y
                STA     MISSLE-1,Y
                LDA     RANDOM          ; Random Number Generator
                AND     #1111b
                ADC     #15
                STA     byte_69F
                LDA     #12
                STA     AUDIO4_GUN_SND_COUNTER
                RTS
; ---------------------------------------------------------------------------

C2:                                     ; CODE XREF: FM2GN+3↑j
                LDA     ENEMY_BULLET_MOVEMENT ; Movement pattern (state machine) for the bullet
                BEQ     C7
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_LEFT2
                BNE     C8
                DEC     ENEMY_BULLET_X_POS ; X position of an enemy bullet (0=none)

C7:                                     ; CODE XREF: FM2GN+65↑j
                                        ; FM2GN+8C↓j
                DEC     ENEMY_BULLET_X_POS ; X position of an enemy bullet (0=none)

G6:                                     ; CODE XREF: FM2GN+85↓j
                LDA     ENEMY_BULLET_X_POS ; X position of an enemy bullet (0=none)
                STA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                JMP     C9
; ---------------------------------------------------------------------------

C8:                                     ; CODE XREF: FM2GN+69↑j
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_NOTHING
                BEQ     C9
                CMP     #ENEMY_BULLET_MOVEMENT_TYPES_RIGHT
                BNE     G7
                INC     ENEMY_BULLET_X_POS ; X position of an enemy bullet (0=none)
                JMP     G6
; ---------------------------------------------------------------------------

G7:                                     ; CODE XREF: FM2GN+80↑j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     C7

C9:                                     ; CODE XREF: FM2GN+77↑j
                                        ; FM2GN+7C↑j
                LDA     byte_69F
                BEQ     D0
                DEC     byte_69F
                BNE     D1
                LDA     AUDIO3_SOUND_COUNTER
                BNE     D2
                LDA     #2
                LDX     #AUDIO_CONTROL_VOL_7|AUDIO_CONTROL_DIST_1
                JSR     XXX             ; Start Audio 3 sound effect

D2:                                     ; CODE XREF: FM2GN+9B↑j
                LDA     #25
                STA     byte_6A0
                LDA     #100000b
                JMP     D3
; ---------------------------------------------------------------------------

D1:                                     ; CODE XREF: FM2GN+96↑j
                LDA     #0
                STA     MISSLE,Y
                DEY
                STA     MISSLE,Y
                DEY
                STY     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                LDA     #100000b
                STA     MISSLE,Y
                STA     MISSLE-1,Y
                JSR     CLG20
                RTS
; End of function FM2GN


; =============== S U B R O U T I N E =======================================

; Remove bullet image at Y

D4:                                     ; CODE XREF: FM2GN+EA↓j
                                        ; CLG20:ADH↓p ...
                LDA     #0
                STA     MISSLE,Y
                STA     MISSLE-1,Y
                STA     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                STA     MISSLE-2,Y
                STA     MISSLE-3,Y
                STA     MISSLE-4,Y
                LDA     #11001111b
                AND     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size
                RTS
; End of function D4

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR FM2GN

D0:                                     ; CODE XREF: FM2GN+91↑j
                DEC     byte_6A0
                BEQ     D4              ; Remove bullet image at Y
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                LSR     A
                LSR     A
                BCC     D5
                JSR     CLG20
                RTS
; ---------------------------------------------------------------------------

D5:                                     ; CODE XREF: FM2GN+F2↑j
                LDA     #110000b
                ORA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size
                RTS
; END OF FUNCTION CHUNK FOR FM2GN

; =============== S U B R O U T I N E =======================================


CLG20:                                  ; CODE XREF: FM2GN+C3↑p
                                        ; FM2GN+F4↑p
                LDA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                AND     #1
                BNE     D6
                LDA     #11001111b
                AND     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM_SHADOW    ; Shadow Register for SIZEM
                STA     SIZEM           ; Missle Size

D7:                                     ; CODE XREF: CLG20+31↓j
                RTS                     ;  => Return
; ---------------------------------------------------------------------------

D6:                                     ; CODE XREF: CLG20+5↑j
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     _1
                CMP     #GAME_PHASE_8
                BCC     ADH

_1:                                     ; CODE XREF: CLG20+17↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                ADC     DIFF.field_3    ; Difficulty for the level
                LDX     byte_FD
                BNE     J4
                SBC     byte_69A
                JMP     J5
; ---------------------------------------------------------------------------

J4:                                     ; CODE XREF: CLG20+24↑j
                SBC     ENEMY_Y_POS     ; Enemy Y position

J5:                                     ; CODE XREF: CLG20+29↑j
                CMP     DIFF.field_4    ; Difficulty for the level
                BCS     D7              ;  => Return

ADH:                                    ; CODE XREF: CLG20+1B↑j
                JSR     D4              ; Remove bullet image at Y
                JSR     SV
                RTS
; End of function CLG20


; =============== S U B R O U T I N E =======================================


FTNKGN:                                 ; CODE XREF: COMMON+51↑p

; FUNCTION CHUNK AT 2B4F SIZE 00000049 BYTES
; FUNCTION CHUNK AT 2BA6 SIZE 00000019 BYTES
; FUNCTION CHUNK AT 2BDF SIZE 0000001D BYTES
; FUNCTION CHUNK AT 35AD SIZE 00000035 BYTES

                LDA     byte_BF
                CMP     #45
                BEQ     B4
                RTS
; ---------------------------------------------------------------------------

B4:                                     ; CODE XREF: FTNKGN+4↑j
                JMP     A3
; End of function FTNKGN


; =============== S U B R O U T I N E =======================================


B5:                                     ; CODE XREF: QN+78↑p
                                        ; ENRUN:H4↑j ...
                LDA     CURRENT_GAME_PHASE
                BEQ     B0
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts

B2:                                     ; CODE XREF: B5+25↓j
                CLC
                ADC     byte_6A3
                JSR     A2
                STA     byte_BF
                RTS
; ---------------------------------------------------------------------------

B0:                                     ; CODE XREF: B5+2↑j
                LDA     byte_FE
                CMP     #10
                BCC     B1
                LDA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                CMP     #10
                BCC     B1
                LDA     byte_661
                BNE     B1
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                JMP     B2
; ---------------------------------------------------------------------------

B1:                                     ; CODE XREF: B5+15↑j B5+1C↑j ...
                LDA     RIVER_RIGHT_X_POS ; Right position of the river

H3:                                     ; CODE XREF: ENRUN+10B↑j
                                        ; BLDG+10F↑j
                CLC
                ADC     byte_6A3
                JSR     B3
                RTS
; End of function B5


; =============== S U B R O U T I N E =======================================

; Draw the runway on the map

DRUN__DRAW_RUNWAY:                      ; CODE XREF: SRT+9↑p
                                        ; CKLAND+19↑p ...
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     EV
                RTS
; ---------------------------------------------------------------------------

EV:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+2↑j
                LDA     byte_638
                BEQ     LY
                DEC     byte_62C
                LDA     byte_62C
                LSR     A
                BCC     EW              ; => Return
                DEC     byte_638
                RTS
; ---------------------------------------------------------------------------

MC:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+B7↓j
                LDY     #255
                STY     byte_B6
                INY
                LDA     byte_FD
                CMP     #255
                BNE     PE
                STY     byte_FD

PE:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+20↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ADC     byte_6CF
                STA     byte_638

EW:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+11↑j
                                        ; DRUN__DRAW_RUNWAY+37↓j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

LY:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+8↑j
                LDA     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                BNE     MB
                LDA     byte_FE
                BEQ     EW              ; => Return
                LDA     #100
                STA     byte_FE
                LDA     RIVER_BOAT_ROW_FLAG ; !=0 boat top row drawn, ==0 boat bottom row drawn
                BNE     EW              ; => Return
                LDA     #120
                STA     RIVER_BOAT_NEXT_COUNTER ; how many rows, till the next boat might show up? (15 = default, 16-31 after the first one)
                LDA     byte_FD
                CMP     #255
                BEQ     MD
                CMP     #5
                BEQ     R3
                CMP     #0
                BNE     EW              ; => Return

R3:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+4F↑j
                LDX     #255
                STX     byte_FD
                INX
                STX     CAN_LAND_FLAG   ; set to 0
                LDA     #_R|_C_BLACK
                STA     byte_C4
                STA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                STA     byte_6B6
                LSR     A
                STA     RUN_SOUND_COUNTER ; 0=Run sound off, otherwise a count down timer for the effect

MD:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+4B↑j
                JSR     FLSH
                LDY     RIVER_RIGHT_X_POS ; Right position of the river
                CPY     #40
                BCS     LZ
                DEX
                STX     byte_610
                CPY     #30
                BCS     EW              ; => Return
                JMP     MA
; ---------------------------------------------------------------------------

LZ:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+72↑j
                LDA     #64
                STA     byte_610
                CPY     #65
                BCC     EW              ; => Return

MA:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+7C↑j
                LDA     #2
                STA     byte_B6
                LDA     #45
                STA     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                LDA     RANDOM          ; Random Number Generator
                AND     #7
                STA     RUNWAY_POS_X_INDEX ; Right position where the runway starts
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #50
                BCS     EX
                LDA     #44
                ADC     RUNWAY_POS_X_INDEX ; Right position where the runway starts
                JMP     EY
; ---------------------------------------------------------------------------

EX:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+9D↑j
                LDA     #37
                SBC     RUNWAY_POS_X_INDEX ; Right position where the runway starts

EY:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+A4↑j
                STA     RUNWAY_POS_X_INDEX ; Right position where the runway starts
                JMP     FI              ; Start hangar creation
; ---------------------------------------------------------------------------

MB:                                     ; CODE XREF: EB+3↑p
                                        ; DRUN__DRAW_RUNWAY+33↑j
                DEC     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                BNE     SH
                JMP     MC
; ---------------------------------------------------------------------------

SH:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+B5↑j
                JSR     FLSH

                LDY     RUNWAY_POS_X_INDEX ; Right position where the runway starts
                LDA     #L_RUNWAY_RIGHT_11|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDX     #9
                LDA     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                CMP     #1
                BEQ     EZ              ; Draw a horizontal runway marker line
                CMP     #4
                BEQ     EZ              ; Draw a horizontal runway marker line
                CMP     #44
                BEQ     NB
                LDA     #L_RUNWAY_CENTER|L_C_1
                JMP     FA
; ---------------------------------------------------------------------------

NB:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+D4↑j
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #45
                BCS     EZ              ; Draw a horizontal runway marker line
                LDA     #255
                STA     byte_610

EZ:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+CC↑j
                                        ; DRUN__DRAW_RUNWAY+D0↑j ...
                LDA     #2              ; Draw a horizontal runway marker line
                STA     byte_B6
                LDA     #L_RUNWAY_MARKER_14|L_C_1

FA:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+D8↑j
                                        ; DRUN__DRAW_RUNWAY+F0↓j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     FA
                LDA     #L_RUNWAY_LEFT_13|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY

                LDA     RUNWAY_POS_Y_INDEX ; Runway is 45 characters long, this is an index used for drawing the correct line
                CMP     #26
                BEQ     FI              ; Start hangar creation
                CMP     #23
                BEQ     FB              ; Draw HNGR1
                CMP     #22
                BEQ     FC              ; Draw HNGR2
                CMP     #21
                BEQ     FD              ; Draw HNGR3 A
                CMP     #20
                BEQ     FD              ; Draw HNGR3 A
                CMP     #19
                BEQ     FD              ; Draw HNGR3 A
                CMP     #18
                BEQ     FF              ; Draw HNGR3 B
                CMP     #17
                BEQ     FE              ; Draw HNGR5
                CMP     #2
                BEQ     V2
                RTS
; ---------------------------------------------------------------------------

FI:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+AF↑j
                                        ; DRUN__DRAW_RUNWAY+FC↑j
                LDA     #0              ; Start hangar creation
                STA     byte_B6
                JMP     DFHNGR          ; Define Hangar – restore the font characters for the hangar
; ---------------------------------------------------------------------------

FB:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+100↑j
                LDA     #2              ; Draw HNGR1
                STA     byte_B6
                STA     byte_6F9
                JMP     UE              ; Draw HNGR1 - first row of the hangar
; ---------------------------------------------------------------------------

FC:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+104↑j
                JMP     UF              ; Draw HNGR2
; ---------------------------------------------------------------------------

FD:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+108↑j
                                        ; DRUN__DRAW_RUNWAY+10C↑j ...
                JMP     UG              ; Draw HNGR3 A
; ---------------------------------------------------------------------------

FF:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+114↑j
                JMP     UH              ; Draw HNGR3 B
; ---------------------------------------------------------------------------

FE:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+118↑j
                JMP     UI              ; Draw HNGR5
; ---------------------------------------------------------------------------

V2:                                     ; CODE XREF: DRUN__DRAW_RUNWAY+11C↑j
                LDY     #_SPACE|_C_BLACK
                STY     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                STY     byte_6B6
                INY
                STY     CAN_LAND_FLAG   ; set to 1
                RTS
; End of function DRUN__DRAW_RUNWAY


; =============== S U B R O U T I N E =======================================

; Flash background of control display to signal damage

COLRDM__COLOR_DAMAGE:                   ; CODE XREF: COMMON+60↑p
                LDA     PLANE_HIT_FLASH_COUNTER ; !=0 => counter to signal damage via flashing
                BNE     D8
                RTS
; ---------------------------------------------------------------------------

D8:                                     ; CODE XREF: COLRDM__COLOR_DAMAGE+2↑j
                DEC     PLANE_HIT_FLASH_COUNTER ; !=0 => counter to signal damage via flashing
                BNE     D9              ; Hit by enemy gun or anti-aircraft
                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                JMP     E0
; ---------------------------------------------------------------------------

D9:                                     ; CODE XREF: COLRDM__COLOR_DAMAGE+7↑j
                LDA     #COLOR_INTENSITY_0|COLOR_RED_ORANGE ; Hit by enemy gun or anti-aircraft

E0:                                     ; CODE XREF: COLRDM__COLOR_DAMAGE+B↑j
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                RTS
; End of function COLRDM__COLOR_DAMAGE


; =============== S U B R O U T I N E =======================================


FTURN:                                  ; CODE XREF: LF+9↑p
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                BNE     L8
                LDA     RANDOM          ; Random Number Generator
                AND     #$3F ; '?'
                BEQ     L9

M0:                                     ; CODE XREF: FTURN+11↓j
                                        ; FTURN+15↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

L9:                                     ; CODE XREF: FTURN+A↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #35
                BCC     M0              ; => Return
                CPY     #130
                BCS     M0              ; => Return
                INC     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                LDX     #10
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     M1
                INX

M8:                                     ; CODE XREF: FTURN+2B↓j
                LDA     FTL-1,X         ; enemy plane turning left
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     M8
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDA     #1000000b
                STA     P3+5,Y          ; Enemy (second color)
                RTS
; ---------------------------------------------------------------------------

M1:                                     ; CODE XREF: FTURN+20↑j
                INC     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any

N0:                                     ; CODE XREF: FTURN+40↓j
                LDA     FTR-1,X         ; enemy plane turning right
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     N0
                LDX     ENEMY_Y_POS     ; Enemy Y position
                LSR     P3+4,X          ; Enemy (second color)
                LSR     P3+6,X          ; Enemy (second color)
                LDA     #100000b
                STA     P3+5,X          ; Enemy (second color)
                RTS
; ---------------------------------------------------------------------------

L8:                                     ; CODE XREF: FTURN+3↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CMP     #2
                BNE     M5
                LDX     #11

M6:                                     ; CODE XREF: FTURN+66↓j
                LDA     P2+9,Y          ; Enemy (first color)
                STA     P2+$A,Y         ; Enemy (first color)
                LDA     P3+9,Y          ; Enemy (second color)
                STA     P3+$A,Y         ; Enemy (second color)
                DEY
                DEX
                BNE     M6
                INC     ENEMY_Y_POS     ; Enemy Y position
                LDY     byte_C2
                LDX     #9

M7:                                     ; CODE XREF: FTURN+76↓j
                LDA     P3+7,Y          ; Enemy (second color)
                STA     P3+8,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     M7
                INC     byte_C2
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                CMP     #3
                BCC     N2
                LDA     #1010000b
                STA     P2+7,Y          ; Enemy (first color)
                LDA     #0
                STA     P2+8,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

N2:                                     ; CODE XREF: FTURN+81↑j
                LDA     #100000b
                STA     P2+7,Y          ; Enemy (first color)
                STA     P2+8,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

M5:                                     ; CODE XREF: FTURN+54↑j
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                CMP     #3
                BCC     N1
                LDA     #10111000b
                STA     P2+5,Y          ; Enemy (first color)
                LDA     #1001100b
                STA     P2+7,Y          ; Enemy (first color)
                LDA     #1100b
                STA     P2+6,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

N1:                                     ; CODE XREF: FTURN+9C↑j
                LDA     #111000b
                STA     P2+5,Y          ; Enemy (first color)
                LDA     #10001100b
                STA     P2+6,Y          ; Enemy (first color)
                LDA     #101100b
                STA     P2+7,Y          ; Enemy (first color)
                RTS
; End of function FTURN


; =============== S U B R O U T I N E =======================================


BTURN:                                  ; CODE XREF: L6+F5↑p
                LDA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                BNE     K2
                JSR     TRACK
                LDA     RANDOM          ; Random Number Generator
                AND     #$3F ; '?'
                BEQ     K3

L1:                                     ; CODE XREF: BTURN+14↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

K3:                                     ; CODE XREF: BTURN+D↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #90
                BCS     L1              ; => Return
                LDA     #TURN_MODE_LEFT
                STA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                LDX     #10
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     K4

K5:                                     ; CODE XREF: BTURN+2B↓j
                                        ; TRACK:_3↓j
                LDA     P1IMAGE+7,X     ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     K5
                JMP     K6
; ---------------------------------------------------------------------------

K4:                                     ; CODE XREF: BTURN+21↑j
                                        ; BTURN+38↓j ...
                LDA     P1IMAGE+$11,X   ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                STA     P2+9,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     K4
                INC     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any

K6:                                     ; CODE XREF: BTURN+2D↑j
                LDY     byte_C2
                LDA     #10b
                STA     P3,Y            ; Enemy (second color)
                LDA     #1000000b
                STA     P3+7,Y          ; Enemy (second color)
                RTS
; ---------------------------------------------------------------------------

K2:                                     ; CODE XREF: BTURN+3↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CMP     #2
                BEQ     K7
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                CMP     #3
                BCC     K9
                LDA     #0
                STA     P2,Y            ; Enemy (first color)
                LDA     #1000b
                STA     P2+1,Y          ; Enemy (first color)
                LDA     #10b
                STA     P2+2,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

K9:                                     ; CODE XREF: BTURN+55↑j
                LDA     #100b
                STA     P2,Y            ; Enemy (first color)
                STA     P2+1,Y          ; Enemy (first color)
                LDA     #0
                STA     P2+2,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

K7:                                     ; CODE XREF: BTURN+4E↑j
                LDA     PROPELLER_PHASE ; Propeller phase (typically 0-4)
                CMP     #3
                BCC     L0
                LDA     #11000000b
                STA     P2,Y            ; Enemy (first color)
                LDA     #1001000b
                STA     P2+1,Y          ; Enemy (first color)
                LDA     #1100010b
                STA     P2+2,Y          ; Enemy (first color)
                RTS
; ---------------------------------------------------------------------------

L0:                                     ; CODE XREF: BTURN+7A↑j
                LDA     #11000100b
                STA     P2,Y            ; Enemy (first color)
                LDA     #1000100b
                STA     P2+1,Y          ; Enemy (first color)
                LDA     #1100000b
                STA     P2+2,Y          ; Enemy (first color)
                RTS
; End of function BTURN


; =============== S U B R O U T I N E =======================================

; Draw a car in the middle of a vertial/diagnal road

DRCAR:                                  ; CODE XREF: DROAD+3C↑p
                LDA     RANDOM          ; Random Number Generator
                AND     #1111b
                BEQ     J6

J8:                                     ; CODE XREF: DRCAR+15↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

J6:                                     ; CODE XREF: DRCAR+5↑j
                LDY     ROAD_RIGHT_X_POS ; right X position where the road starts
                DEY
                DEY                     ; x-4 => car is centered on the road
                DEY
                DEY
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_ROAD_HARD_RIGHT_3
                BEQ     J7
                BCS     J8              ; => Return
                CMP     #GAME_PHASE_DIAGNOAL_ROAD_2
                BEQ     J7
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     J7
                LDA     #L_STREET_CAR_RIGHT_COLOR_A|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDA     #L_STREET_CAR_LEFT_COLOR_A|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; ---------------------------------------------------------------------------

J7:                                     ; CODE XREF: DRCAR+13↑j
                                        ; DRCAR+19↑j ...
                LDA     #L_STREET_CAR_RIGHT_COLOR_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                LDA     #L_STREET_CAR_LEFT_COLOR_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; End of function DRCAR


; =============== S U B R O U T I N E =======================================

; Draw a moving ship

SHIP:                                   ; CODE XREF: SRT+18↑p
                LDA     byte_FD
                BEQ     I3
                CMP     #15
                BEQ     I2
                RTS
; ---------------------------------------------------------------------------

I3:                                     ; CODE XREF: SHIP+2↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #$F
                BNE     I4              ; => Return
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #60
                BCS     I4              ; => Return
                CMP     #29
                BCC     I4              ; => Return
                LDY     byte_FE
                CPY     #12
                BCC     I4              ; => Return
                CPY     #25
                BCS     I4              ; => Return
                SBC     #6
                ASL     A
                ASL     A
                ADC     #27
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDY     #15
                STY     ENEMY_Y_POS     ; Enemy Y position
                STY     byte_FD
                LDX     #12

I5:                                     ; CODE XREF: SHIP+48↓j
                LDA     SHPIM-1,X       ; moving ship
                STA     P2,Y            ; Enemy (first color)
                LDA     SHPIM1-1,X      ; moving ship black highlight color
                STA     P3+2,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     I5
                LDA     byte_C4
                BNE     P6
                LDA     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                STA     PCOLR2          ; P2 COLOR
                DEC     byte_C4
                JMP     P7
; ---------------------------------------------------------------------------

P6:                                     ; CODE XREF: SHIP+4C↑j
                LDA     #COLOR_INTENSITY_2|COLOR_GRAY
                STA     PCOLR2          ; P2 COLOR

P7:                                     ; CODE XREF: SHIP+55↑j
                LDA     #3
                STA     byte_6DC
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     I6
                STY     MSHIP_VAR_62B
                RTS
; ---------------------------------------------------------------------------

I6:                                     ; CODE XREF: SHIP+66↑j
                STX     MSHIP_VAR_62B

I4:                                     ; CODE XREF: SHIP+E↑j
                                        ; SHIP+14↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

I2:                                     ; CODE XREF: SHIP+6↑j
                JSR     XSHP
                JSR     FSHGN           ; Fire movable ship gun
                JSR     SHP23
                JSR     P0SHP
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCS     I4              ; => Return
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #194
                BCC     I7
                LDX     #15
                LDA     #0

I8:                                     ; CODE XREF: SHIP+94↓j
                STA     P2+2,Y          ; Enemy (first color)
                STA     P3+2,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     I8
                STA     byte_FD
                RTS
; ---------------------------------------------------------------------------

I7:                                     ; CODE XREF: SHIP+86↑j
                LDA     MSHIP_VAR_62B
                BNE     J0
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     I4              ; => Return
                JMP     MVSHP           ; Move a movable ship: Y+2, X-1
; ---------------------------------------------------------------------------

J0:                                     ; CODE XREF: SHIP+9C↑j
                JSR     MVSHP           ; Move a movable ship: Y+2, X-1
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     I4              ; => Return
                LDY     ENEMY_Y_POS     ; Enemy Y position
; End of function SHIP


; =============== S U B R O U T I N E =======================================

; Move a movable ship: Y+2, X-1

MVSHP:                                  ; CODE XREF: SHIP+A2↑j
                                        ; SHIP:J0↑p ...
                LDX     #16

I9:                                     ; CODE XREF: MVSHP+10↓j
                LDA     P2,Y            ; Enemy (first color)
                STA     P2+2,Y          ; Enemy (first color)
                LDA     P3+2,Y          ; Enemy (second color)
                STA     P3+4,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     I9
                INC     ENEMY_Y_POS     ; Enemy Y position
                INC     ENEMY_Y_POS     ; Enemy Y position
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                RTS
; End of function MVSHP


; =============== S U B R O U T I N E =======================================

; Fire movable ship gun

FSHGN:                                  ; CODE XREF: SHIP+73↑p
                LDY     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                BEQ     J1

J2:                                     ; CODE XREF: FSHGN+A↓j
                                        ; FSHGN+E↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

J1:                                     ; CODE XREF: FSHGN+3↑j
                LDA     ENEMY_Y_POS     ; Enemy Y position
                CMP     #70
                BCC     J2              ; => Return
                CMP     #178
                BCS     J2              ; => Return
                SEC
                SBC     #7
                TAY
                LDA     ENEMY_X_POS     ; Enemy X position
                CLC
                ADC     #2
                STA     MSHIP_BULLET_X_POS
                JMP     loc_368B
; End of function FSHGN


; =============== S U B R O U T I N E =======================================


TNK:                                    ; CODE XREF: SRT+15↑p

; FUNCTION CHUNK AT 3BD3 SIZE 00000006 BYTES
; FUNCTION CHUNK AT 3BD9 SIZE 0000001C BYTES
; FUNCTION CHUNK AT 3BF5 SIZE 000000BD BYTES

                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     E1
                RTS
; ---------------------------------------------------------------------------

E1:                                     ; CODE XREF: TNK+2↑j
                LDA     byte_6A1
                BEQ     E9
                DEC     byte_6A1
                RTS
; End of function TNK

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR TNKC1
;   ADDITIONAL PARENT FUNCTION TNK

E2:                                     ; CODE XREF: TNK+1E↓j TNK+2E↓j ...
                LDA     #10
                STA     byte_6A1
                RTS
; END OF FUNCTION CHUNK FOR TNKC1
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR TNK

E9:                                     ; CODE XREF: TNK+8↑j
                LDA     byte_6A2
                BNE     E3
                LDA     byte_638
                CMP     #4
                BCC     E2
                LDA     byte_FE
                CMP     #2
                BCS     F1
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #58
                BCS     F1
                CMP     #30
                BCS     E2
; END OF FUNCTION CHUNK FOR TNK
; START OF FUNCTION CHUNK FOR TNKC1
;   ADDITIONAL PARENT FUNCTION TNK

F1:                                     ; CODE XREF: TNK+24↑j TNK+2A↑j ...
                LDA     byte_650
                CMP     #2
                BCS     _1
                LDA     CURRENT_GAME_PHASE
                BNE     E2
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #45
                BCC     E2

_1:                                     ; CODE XREF: TNKC1-C1↑j
                LDA     byte_6A2
                BNE     E3
                INC     byte_6A2
                STA     byte_B6
                LDA     #4
                STA     byte_676
                RTS
; ---------------------------------------------------------------------------

E3:                                     ; CODE XREF: TNK+17↑j
                                        ; TNKC1-B2↑j ...
                DEC     byte_6A2
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                ORA     #$10
                STA     byte_6A1
                LDA     byte_676
                CMP     #4
                BNE     E4
                LDA     #$FF
                STA     byte_B6

E4:                                     ; CODE XREF: TNKC1-93↑j
                LDA     CURRENT_GAME_PHASE
                BEQ     F4
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                CMP     byte_669
                BNE     F5
                LDX     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CPX     #160
                BCC     _1_0
                CLC
                ADC     #20
                LDX     #20
                JMP     F0
; ---------------------------------------------------------------------------

_1_0:                                   ; CODE XREF: TNKC1-7D↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                LSR     A
                ADC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                CMP     #120
                BCS     _2
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #18
                LDX     #238
                JMP     F0
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: TNKC1-6C↑j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     F3
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                JMP     F5
; ---------------------------------------------------------------------------

F3:                                     ; CODE XREF: TNKC1-5B↑j
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #8
                LDX     #$F8
                JMP     F0
; ---------------------------------------------------------------------------

F4:                                     ; CODE XREF: TNKC1-8B↑j
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #44
                BCS     loc_3C81

F5:                                     ; CODE XREF: TNKC1-83↑j
                                        ; TNKC1-56↑j
                CLC
                ADC     #10
                LDX     #10
                JMP     F0
; ---------------------------------------------------------------------------

loc_3C81:                               ; CODE XREF: TNKC1-44↑j
                SEC
                SBC     #24
                LDX     #232

F0:                                     ; CODE XREF: TNKC1-76↑j
                                        ; TNKC1-62↑j ...
                STX     byte_6A3
                TAY
                LDX     #3

E8:                                     ; CODE XREF: TNKC1-17↓j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     E6
                LDA     #L_TANK_RIGHT_A|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #L_TANK_LEFT_A|L_C_1
                JMP     E7
; ---------------------------------------------------------------------------

E6:                                     ; CODE XREF: TNKC1-2B↑j
                LDA     #L_GRAS_BEFORE_BUILDING|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.

E7:                                     ; CODE XREF: TNKC1-23↑j
                DEY
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                DEY
                DEX
                BNE     E8
                DEY
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     TH
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                JMP     F2
; END OF FUNCTION CHUNK FOR TNKC1
; ---------------------------------------------------------------------------
                RTS
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR TNKC1

TH:                                     ; CODE XREF: TNKC1-10↑j
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_1

F2:                                     ; CODE XREF: TNKC1-C↑j
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                JSR     B5
                RTS
; END OF FUNCTION CHUNK FOR TNKC1

; =============== S U B R O U T I N E =======================================


TNKC1:                                  ; CODE XREF: AREA+21↑p

; FUNCTION CHUNK AT 3BD3 SIZE 00000006 BYTES
; FUNCTION CHUNK AT 3BF5 SIZE 000000BD BYTES
; FUNCTION CHUNK AT 3CB3 SIZE 00000008 BYTES

                LDA     byte_6A1
                BEQ     TI
                DEC     byte_6A1
                RTS
; ---------------------------------------------------------------------------

TI:                                     ; CODE XREF: TNKC1+3↑j
                LDA     byte_6A2
                BNE     NI
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_4
                BCS     NO
                LDA     ENEMY_RUNWAY_START ; How many lines till the enemy runway will appear
                CMP     #2
                BCC     NO
                LDA     byte_B2
                CMP     #2
                BCC     NO
                JMP     F1
; ---------------------------------------------------------------------------

NI:                                     ; CODE XREF: TNKC1+C↑j
                JMP     E3
; ---------------------------------------------------------------------------

NO:                                     ; CODE XREF: TNKC1+12↑j
                                        ; TNKC1+19↑j ...
                JMP     E2
; End of function TNKC1


; =============== S U B R O U T I N E =======================================


AKA:                                    ; CODE XREF: EB+150↑p B7-16↑p
                LDA     byte_C4
                CMP     #5
                BNE     locret_3CF1     ; => Return
                LDA     #0
                STA     byte_FD
                STA     byte_C4

locret_3CF1:                            ; CODE XREF: AKA+4↑j
                RTS                     ; => Return
; End of function AKA


; =============== S U B R O U T I N E =======================================

; Flicker PCOLR2

TRGTP2:                                 ; CODE XREF: COMMON+6F↑p
                LDA     PCOLR2          ; P2 COLOR
                CMP     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                BEQ     _1
                CMP     #COLOR_INTENSITY_8|COLOR_TURQUOISE
                BEQ     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: TRGTP2+5↑j
                                        ; TRGTP2+9↑j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                LSR     A
                LSR     A
                LSR     A
                BCC     V6
                LDA     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                JMP     V5
; ---------------------------------------------------------------------------

V6:                                     ; CODE XREF: TRGTP2+13↑j
                LDA     #COLOR_INTENSITY_8|COLOR_TURQUOISE

V5:                                     ; CODE XREF: TRGTP2+17↑j
                STA     PCOLR2          ; P2 COLOR
                RTS
; End of function TRGTP2


; =============== S U B R O U T I N E =======================================

; Select previous tile row

UPXP:                                   ; CODE XREF: Y7__HIT_RW_PLANE_TR:Z1__HIT_RW_PLANE_BL↓p
                                        ; X8__HIT_BOAT_TR:Y1__HIT_BOAT_BL↓p ...
                LDA     TEMP_PREVIOUS_ROW_PTR
                STA     PREVIOUS_TILE_ROW_PTR
                LDA     TEMP_PREVIOUS_ROW_PTR+1
                STA     PREVIOUS_TILE_ROW_PTR+1
                RTS
; End of function UPXP


; =============== S U B R O U T I N E =======================================

; Select next tile row (mark, if there is none)

DNXP:                                   ; CODE XREF: Y7__HIT_RW_PLANE_TR:Y9__HIT_RW_PLANE_TL↓p
                                        ; X8__HIT_BOAT_TR:X9__HIT_BOAT_TL↓p ...
                LDA     byte_639
                CMP     #168
                BCS     _1
                LDA     TEMP_NEXT_ROW_PTR
                STA     PREVIOUS_TILE_ROW_PTR
                LDA     TEMP_NEXT_ROW_PTR+1
                STA     PREVIOUS_TILE_ROW_PTR+1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: DNXP+5↑j
                LDA     #255
                STA     PREVIOUS_TILE_ROW_PTR+1
                RTS
; End of function DNXP


; =============== S U B R O U T I N E =======================================


Y7__HIT_RW_PLANE_TR:                    ; CODE XREF: CKCHAR+2↓j
                DEC     VAR_EXPLOSION_X_POS

Y9__HIT_RW_PLANE_TL:                    ; CODE XREF: CKCHAR+6↓j
                JSR     DNXP            ; Select next tile row (mark, if there is none)
                JMP     Z2
; ---------------------------------------------------------------------------

Z0__HIT_RW_PLANE_BR:                    ; CODE XREF: CKCHAR+A↓j
                DEC     VAR_EXPLOSION_X_POS

Z1__HIT_RW_PLANE_BL:                    ; CODE XREF: CKCHAR+E↓j
                JSR     UPXP            ; Select previous tile row

Z2:                                     ; CODE XREF: Y7__HIT_RW_PLANE_TR+6↑j
                PLA
                PLA
                LDA     #EXPLOSITION_TARGET_RUNWAY_PLANE
                STA     VAR_EXPLOSION_TARGET
                JSR     S10__SCORE_ADD_10 ; Score: add 10
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                JMP     W1
; End of function Y7__HIT_RW_PLANE_TR


; =============== S U B R O U T I N E =======================================

; HIT: fixed boat top-right

X8__HIT_BOAT_TR:                        ; CODE XREF: CKCHAR+16↓j
                DEC     VAR_EXPLOSION_X_POS

X9__HIT_BOAT_TL:                        ; CODE XREF: CKCHAR+12↓j
                JSR     DNXP            ; HIT: fixed boat top-left
                JMP     Y4
; ---------------------------------------------------------------------------

Y0__HIT_BOAT_BR:                        ; CODE XREF: CKCHAR+1E↓j
                DEC     VAR_EXPLOSION_X_POS ; HIT: fixed boat bottom-right

Y1__HIT_BOAT_BL:                        ; CODE XREF: CKCHAR+1A↓j
                JSR     UPXP            ; HIT: fixed boat bottom-left

Y4:                                     ; CODE XREF: X8__HIT_BOAT_TR+6↑j
                JSR     Y8              ; Trigger explosion in water with sound
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                PLA
                PLA
                LDA     #EXPLOSITION_TARGET_BOAT
                STA     VAR_EXPLOSION_TARGET
                JMP     W1
; End of function X8__HIT_BOAT_TR


; =============== S U B R O U T I N E =======================================

; HIT: empty piece of road at high speed

X5:                                     ; CODE XREF: CKCHAR+25↓j
                LDA     #EXPLOSITION_TARGET_EMPTY_ROAD
                STA     VAR_EXPLOSION_TARGET
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_2|_C_BLUE
                BCC     _1
                JSR     S10__SCORE_ADD_10 ; Score: add 10

_1:                                     ; CODE XREF: X5+A↑j
                PLA
                PLA
                JMP     W1
; End of function X5


; =============== S U B R O U T I N E =======================================

; Check if a tile based target in A was hit

CKCHAR:                                 ; CODE XREF: XPLSN+35↑p
                CMP     #L_RUNWAY_PLANE_TOP_RIGHT|L_C_1
                BEQ     Y7__HIT_RW_PLANE_TR ; HIT: runway plane top-right
                CMP     #L_RUNWAY_PLANE_TOP_LEFT|L_C_1
                BEQ     Y9__HIT_RW_PLANE_TL ; HIT: runway plane top-left
                CMP     #L_RUNWAY_PLANE_BOTTOM_RIGHT|L_C_1
                BEQ     Z0__HIT_RW_PLANE_BR ; HIT: runway plane bottom-right
                CMP     #L_RUNWAY_PLANE_BOTTOM_LEFT|L_C_1
                BEQ     Z1__HIT_RW_PLANE_BL ; HIT: runway plane bottom-left
                CMP     #L_FIXED_BOAT_TOP_LEFT|L_C_1
                BEQ     X9__HIT_BOAT_TL ; HIT: fixed boat top-left
                CMP     #L_FIXED_BOAT_TOP_RIGHT|L_C_1
                BEQ     X8__HIT_BOAT_TR ; HIT: fixed boat top-right
                CMP     #L_FIXED_BOAT_BOTTOM_LEFT|L_C_1
                BEQ     Y1__HIT_BOAT_BL ; HIT: fixed boat bottom-left
                CMP     #L_FIXED_BOAT_BOTTOM_RIGHT|L_C_1
                BEQ     Y0__HIT_BOAT_BR ; HIT: fixed boat bottom-right

                LDX     #8

_9:                                     ; CODE XREF: CKCHAR+28↓j
                CMP     AAE-1,X         ; Targets: roads
                BEQ     X5              ; HIT: empty piece of road at high speed
                DEX
                BNE     _9
                LDX     #10

T6:                                     ; CODE XREF: CKCHAR+32↓j
                CMP     AAA-1,X         ; Targets: building
                BEQ     W4
                DEX
                BNE     T6
                LDX     #14

T8:                                     ; CODE XREF: CKCHAR+3C↓j
                CMP     AAB-1,X         ; Targets: skyscraper
                BEQ     W7
                DEX
                BNE     T8
                LDX     #7

U0:                                     ; CODE XREF: CKCHAR+46↓j
                CMP     AAC-1,X         ; Targets: lower parts of a bridge
                BEQ     T9
                DEX
                BNE     U0
                LDX     #3

_1:                                     ; CODE XREF: CKCHAR+50↓j
                CMP     AAD-1,X         ; Targets: upper parts of a bridge
                BEQ     V9
                DEX
                BNE     _1
                JMP     Z3
; ---------------------------------------------------------------------------

W4:                                     ; CODE XREF: CKCHAR+2F↑j
                LDX     VAR_PRIMARY_TARGET_SUBTYPE
                CPX     #PRIMARY_TARGET_SUBTYPE_BUILDING
                BNE     U1
                INC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                LDY     byte_6AB
                JSR     U2
                JSR     S50__SCORE_ADD_50 ; Score: add 50

U1:                                     ; CODE XREF: CKCHAR+5A↑j
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                PLA
                PLA
                LDA     #EXPLOSITION_TARGET_BUILDING
                STA     VAR_EXPLOSION_TARGET
                JMP     W1
; ---------------------------------------------------------------------------

W7:                                     ; CODE XREF: CKCHAR+39↑j
                LDX     VAR_PRIMARY_TARGET_SUBTYPE
                CPX     #PRIMARY_TARGET_SUBTYPE_SKYSCRAPER
                BNE     _1_0
                INC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                LDY     byte_6AB
                JSR     U2
                JSR     S50__SCORE_ADD_50 ; Score: add 50

_1_0:                                   ; CODE XREF: CKCHAR+7A↑j
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                PLA
                PLA
                LDA     #EXPLOSITION_TARGET_SKYSCRAPER
                STA     VAR_EXPLOSION_TARGET
                JMP     W1
; ---------------------------------------------------------------------------

T9:                                     ; CODE XREF: CKCHAR+43↑j
                JSR     UPXP            ; Select previous tile row

W0:                                     ; CODE XREF: CKCHAR+C3↓j
                LDA     #EXPLOSITION_TARGET_BRIDGE
                STA     VAR_EXPLOSION_TARGET
                LDX     VAR_PRIMARY_TARGET_SUBTYPE
                CPX     #PRIMARY_TARGET_SUBTYPE_BRIDGE
                BNE     U5
                INC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                LDY     byte_6AB
                JSR     U2
                JSR     S50__SCORE_ADD_50 ; Score: add 50

U5:                                     ; CODE XREF: CKCHAR+A2↑j
                DEC     byte_6F2
                BNE     _1_
                JSR     S50__SCORE_ADD_50 ; Score: add 50

_1_:                                    ; CODE XREF: CKCHAR+B3↑j
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                PLA
                PLA
                JMP     W1
; ---------------------------------------------------------------------------

V9:                                     ; CODE XREF: CKCHAR+4D↑j
                JSR     DNXP            ; Select next tile row (mark, if there is none)
                JMP     W0
; End of function CKCHAR


; =============== S U B R O U T I N E =======================================


XSHP:                                   ; CODE XREF: SHIP:I2↑p
                LDA     byte_B1
                BEQ     S8
                RTS
; ---------------------------------------------------------------------------

S8:                                     ; CODE XREF: XSHP+2↑j
                DEC     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                BEQ     S9
                LDA     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                LSR     A
                LSR     A
                LSR     A
                BCC     T0
                LDY     #COLOR_INTENSITY_12|COLOR_ORANGE
                JMP     T1
; ---------------------------------------------------------------------------

T0:                                     ; CODE XREF: XSHP+10↑j
                LDY     #COLOR_INTENSITY_6|COLOR_RED_ORANGE

T1:                                     ; CODE XREF: XSHP+14↑j
                STY     PCOLR2          ; P2 COLOR
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #194
                BCS     S9
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCS     T2
                PLA
                PLA
                JMP     MVSHP           ; Move a movable ship: Y+2, X-1
; ---------------------------------------------------------------------------

S9:                                     ; CODE XREF: XSHP+8↑j
                                        ; XSHP+20↑j
                INC     byte_B1
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDX     #15
                LDA     #0

T3:                                     ; CODE XREF: XSHP+3A↓j
                STA     P2+2,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     T3
                STA     byte_FD

T2:                                     ; CODE XREF: XSHP+26↑j
                PLA
                PLA
                RTS
; End of function XSHP


; =============== S U B R O U T I N E =======================================


BMBSHP:                                 ; CODE XREF: BOMB:HL↑p
                LDA     byte_FD
                CMP     #15
                BNE     S5              ; => Return
                LDA     M1PL            ; Missle to Player 1 Collision
                AND     #1100b
                BEQ     S5              ; => Return

                LDA     #EXPLOSITION_TARGET_WATER
                STA     VAR_EXPLOSION_TARGET
                JSR     ABA             ; Save current color palette, because we start the flashing animation

Z6:                                     ; CODE XREF: SHP23+24↓j
                                        ; P0SHP+14↓p
                LDY     ENEMY_Y_POS     ; Set enemy to explosion graphics
                LDX     #13

S6:                                     ; CODE XREF: BMBSHP+26↓j
                LDA     XSHPIM-1,X      ; moving ship explosion
                STA     P2,Y            ; Enemy (first color)
                LDA     #0
                STA     P3+2,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     S6

                LDA     #255
                STA     PLANE_GUN_SOUND_TIMER ; Timer for the repeating gun sound from the plane
                LDY     ENEMY_BULLET_Y_POS ; Y position of an enemy bullet (0=none)
                JSR     D4              ; Remove bullet image at Y
                JSR     SL              ; Trigger explosion sound effect
                JMP     S7              ; X is ==0
; ---------------------------------------------------------------------------

XP23:                                   ; CODE XREF: DRP23+6↑p
                LDA     byte_B1
                BEQ     R5

                LDA     ENEMY_Y_POS     ; Enemy Y position
                CMP     #70
                BCC     S5              ; => Return
                LDA     P2PF_HPOSM2     ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
                AND     #10b            ; Enemy collision with player?
                BNE     R6              ; Player and enemy collision
                LDA     P3PF_HPOSM3     ; Missile 3 Horizontal Position / Player 3 to Playfield Collision
                AND     #10b            ; Enemy collision with player?
                BNE     R6              ; Player and enemy collision

S5:                                     ; CODE XREF: BMBSHP+4↑j
                                        ; BMBSHP+B↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

R6:                                     ; CODE XREF: BMBSHP+48↑j
                                        ; BMBSHP+4F↑j ...
                LDX     #10             ; Player and enemy collision
                LDY     ENEMY_Y_POS     ; Enemy Y position

R8:                                     ; CODE XREF: BMBSHP+63↓j
                LDA     XCRIM-1,X
                STA     P2+8,Y          ; Enemy (first color)
                LDA     #0
                STA     P3+8,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     R8
                PLA
                PLA

S7:                                     ; CODE XREF: BMBSHP+36↑j
                STX     byte_B1         ; X is ==0
                LDA     PCOLR2          ; P2 COLOR
                CMP     #COLOR_INTENSITY_12|COLOR_DARK_PURPLE
                BEQ     V3              ; Primary target hit
                CMP     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                BEQ     V3              ; Primary target hit
                CMP     #COLOR_INTENSITY_8|COLOR_TURQUOISE
                BNE     R7

V3:                                     ; CODE XREF: BMBSHP+6E↑j
                                        ; BMBSHP+72↑j
                INC     PRIMARY_TARGETS_HIT ; Primary target hit
                JSR     S100__SCORE_ADD_100 ; Score: add 100
                JSR     S100__SCORE_ADD_100 ; Score: add 100

R7:                                     ; CODE XREF: BMBSHP+76↑j
                LDA     #120
                STA     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                JSR     S100__SCORE_ADD_100 ; Score: add 100
                LDA     #50
                LDX     #AUDIO_CONTROL_VOL_12|AUDIO_CONTROL_DIST_1
                JMP     XXX             ; Start Audio 3 sound effect
; ---------------------------------------------------------------------------

R5:                                     ; CODE XREF: BMBSHP+3B↑j
                DEC     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                BMI     S4
                LDA     PCOLR2_FLASH_COUNTER ; Duration for PCOLR2 flash (enemy got hit)
                LSR     A
                LSR     A
                LSR     A
                BCC     S0
                LDY     #COLOR_INTENSITY_12|COLOR_ORANGE
                JMP     S1
; ---------------------------------------------------------------------------

S0:                                     ; CODE XREF: BMBSHP+9B↑j
                LDY     #COLOR_INTENSITY_6|COLOR_RED_ORANGE

S1:                                     ; CODE XREF: BMBSHP+9F↑j
                STY     PCOLR2          ; P2 COLOR

S4:                                     ; CODE XREF: BMBSHP+93↑j
                LDY     ENEMY_Y_POS     ; Enemy Y position
                CPY     #185
                BCS     R9
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     S2
                PLA
                PLA
                RTS
; ---------------------------------------------------------------------------

S2:                                     ; CODE XREF: BMBSHP+B1↑j
                LDX     #12

S3:                                     ; CODE XREF: BMBSHP+C0↓j
                LDA     P2+8,Y          ; Enemy (first color)
                STA     P2+$A,Y         ; Enemy (first color)
                DEY
                DEX
                BNE     S3
                INC     ENEMY_Y_POS     ; Enemy Y position
                INC     ENEMY_Y_POS     ; Enemy Y position
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                PLA
                PLA
                RTS
; ---------------------------------------------------------------------------

R9:                                     ; CODE XREF: BMBSHP+AB↑j
                INC     byte_B1
                PLA
                PLA
                JMP     JG
; End of function BMBSHP


; =============== S U B R O U T I N E =======================================


GNSGHT:                                 ; CODE XREF: DRBR__DRAW_BRIDGE+87↑j
                                        ; QN+D4↑j ...
                STY     byte_6AB
                ASL     A
                ASL     A
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                LDX     #9

Q1:                                     ; CODE XREF: GNSGHT+14↓j
                LDA     GNST-1,X        ; red-white flashing bullseye target
                STA     P2,Y            ; Enemy (first color)
                DEY
                DEX
                BNE     Q1
                LDA     #253
                STA     byte_C4
                INC     byte_FD
                RTS
; End of function GNSGHT


; =============== S U B R O U T I N E =======================================


TRGT:                                   ; CODE XREF: COMMON+10↑p
                LDA     byte_C4
                CMP     #253
                BEQ     N9
                CMP     #10
                BEQ     Q5
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BEQ     O0
                RTS
; ---------------------------------------------------------------------------

N9:                                     ; CODE XREF: TRGT+4↑j
                JMP     Z9
; ---------------------------------------------------------------------------

O0:                                     ; CODE XREF: TRGT+C↑j
                LDA     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                CMP     REQUIRED_TARGETS ; Number of required primary targets to progress (8 or 9 by random)
                BCS     R2              ; => Return
                LDA     byte_6A6
                BNE     R2              ; => Return
                LDA     byte_638
                BEQ     R2              ; => Return
                LDA     byte_C4
                BEQ     R2              ; => Return
                CMP     #5
                BEQ     R2              ; => Return
                LDA     byte_6AA
                BEQ     O2
                DEC     byte_6AA
                RTS
; ---------------------------------------------------------------------------

O3:                                     ; CODE XREF: TRGT+48↓j
                LDA     #0
                STA     byte_C4

O7:                                     ; CODE XREF: TRGT+8D↓j
                LDA     RANDOM          ; Random Number Generator
                ORA     #$40 ; '@'
                AND     #$7F
                STA     byte_6AA
                RTS
; ---------------------------------------------------------------------------

O2:                                     ; CODE XREF: TRGT+2F↑j
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     O3

Q5:                                     ; CODE XREF: TRGT+8↑j
                LDA     byte_FD
                BEQ     Q6

Q7:                                     ; CODE XREF: TRGT+60↓j
                                        ; TRGT+6C↓j ...
                LDA     #10
                STA     byte_C4
                LDA     byte_FD
                CMP     #5
                BNE     R2              ; => Return
                LDA     #0
                STA     byte_FD

R2:                                     ; CODE XREF: TRGT+18↑j
                                        ; TRGT+1D↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

Q6:                                     ; CODE XREF: TRGT+4C↑j
                LDA     byte_650
                BEQ     Q7
                CMP     #20
                BCC     Q2
                LDA     CURRENT_GAME_PHASE
                BNE     Q8
                LDA     byte_FE
                BEQ     Q7
                CMP     #15
                BCS     Q7
                LDA     RIVER_RIGHT_X_POS ; Right position of the river
                CMP     #30
                BCC     R2              ; => Return
                CMP     #58
                BCS     R2              ; => Return
                JMP     Q2
; ---------------------------------------------------------------------------

Q8:                                     ; CODE XREF: TRGT+68↑j
                LDA     byte_B2
                BEQ     Q7
                CMP     #25
                BCS     Q7

Q2:                                     ; CODE XREF: TRGT+64↑j
                                        ; TRGT+7C↑j
                LDA     #5
                STA     byte_C4
                STA     byte_FD
                JMP     O7
; ---------------------------------------------------------------------------

Z9:                                     ; CODE XREF: TRGT:N9↑j
                LDY     byte_6AB
                CPY     #190
                BCC     O5

U2:                                     ; CODE XREF: CKCHAR+62↑p
                                        ; CKCHAR+82↑p ...
                DEC     byte_C4
                LDX     #12
                LDA     #0

O6:                                     ; CODE XREF: TRGT+A2↓j
                STA     P2+1,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     O6
                STA     byte_FD
                STA     VAR_PRIMARY_TARGET_SUBTYPE

O8:                                     ; CODE XREF: TRGT+AE↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

O5:                                     ; CODE XREF: TRGT+95↑j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCS     O8              ; => Return
                LDX     #11

O9:                                     ; CODE XREF: TRGT+BA↓j
                LDA     P2,Y            ; Enemy (first color)
                STA     P2+2,Y          ; Enemy (first color)
                DEY
                DEX
                BNE     O9
                INC     byte_6AB
                INC     byte_6AB
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                LSR     A
                LSR     A
                LSR     A
                BCC     Q4
                LDA     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                STA     PCOLR2          ; P2 COLOR
                RTS
; ---------------------------------------------------------------------------

Q4:                                     ; CODE XREF: TRGT+CC↑j
                LDA     #COLOR_INTENSITY_14|COLOR_GRAY
                STA     PCOLR2          ; P2 COLOR
                RTS
; End of function TRGT


; =============== S U B R O U T I N E =======================================

; Fix one broken part per call (F, B, M, G)

FIX:                                    ; CODE XREF: REFUEL:N8↑p
                INC     WORKING_PARTS   ; # of working part (4): fuel, bomb, maneuverabiity, gun
                LDA     SC_STATUS_LINE.line_0.fuel_leak ; "F" character
                BEQ     loc_4069
                LDA     #_SPACE|_C_BLACK
                STA     SC_STATUS_LINE.line_0.fuel_leak ; "F" character
                RTS
; ---------------------------------------------------------------------------

loc_4069:                               ; CODE XREF: FIX+6↑j
                LDY     SC_STATUS_LINE.line_0.bomb_gear_damaged ; "B" character
                BEQ     loc_4072
                STA     SC_STATUS_LINE.line_0.bomb_gear_damaged ; "B" character
                RTS
; ---------------------------------------------------------------------------

loc_4072:                               ; CODE XREF: FIX+11↑j
                LDY     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                BEQ     loc_407B
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                RTS
; ---------------------------------------------------------------------------

loc_407B:                               ; CODE XREF: FIX+1A↑j
                STA     SC_STATUS_LINE.line_0.machine_gun_damaged ; "G" character
                RTS
; End of function FIX


; =============== S U B R O U T I N E =======================================


TRACK:                                  ; CODE XREF: BTURN+5↑p
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_5
                BEQ     _1

_2:                                     ; CODE XREF: TRACK+B↓j
                                        ; TRACK+10↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: TRACK+5↑j
                LDA     byte_6A8
                BEQ     _2              ; => Return
                LDA     byte_6A7
                BEQ     _2              ; => Return
                LDA     #TURN_MODE_LEFT
                STA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                PLA
                PLA
                LDX     #10
                LDY     ENEMY_Y_POS     ; Enemy Y position
                LDA     byte_C2
                CLC
                ADC     ENEMY_X_POS     ; Enemy X position
                BCC     loc_40A5
                LDA     #$FF

loc_40A5:                               ; CODE XREF: TRACK+22↑j
                STA     TEMP_B0
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                CLC
                ADC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                BCC     _4
                LDA     #$FF

_4:                                     ; CODE XREF: TRACK+2D↑j
                CMP     TEMP_B0
                BCC     _3
                JMP     K4
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: TRACK+33↑j
                JMP     K5
; End of function TRACK


; =============== S U B R O U T I N E =======================================


CPTL:                                   ; CODE XREF: CITY+26↑p
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_6
                BEQ     _1
                CMP     #GAME_PHASE_7
                BEQ     _1

_12:                                    ; CODE XREF: CPTL+17↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: CPTL+4↑j CPTL+8↑j
                JSR     XCPTL
                LDY     CAPITAL_Y_POS
                BNE     _2
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_7
                BEQ     _12             ; => Return

                LDA     GAME_COMPLETION_MASK
                LDX     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                CPX     #63
                BEQ     _8
                CPX     #32
                BEQ     _9
                CPX     #1
                BNE     _3              ; => Return
                AND     #FINAL_TARGET_3
                BNE     _3              ; => Return
                LDA     #COLOR_INTENSITY_0|COLOR_PURPLE_BLUE
                JMP     _10
; ---------------------------------------------------------------------------

_8:                                     ; CODE XREF: CPTL+20↑j
                AND     #FINAL_TARGET_1
                BNE     _3              ; => Return
                LDA     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                JMP     _10
; ---------------------------------------------------------------------------

_9:                                     ; CODE XREF: CPTL+24↑j
                AND     #FINAL_TARGET_2
                BNE     _3              ; => Return
                LDA     #COLOR_INTENSITY_0|COLOR_DARK_PURPLE

_10:                                    ; CODE XREF: CPTL+30↑j
                                        ; CPTL+39↑j
                STA     PCOLR2          ; P2 COLOR
                LDA     #1
                STA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                STA     M3PL_SIZEP3     ; Missle to Player 3 Collision / Player 3 Size
                LDY     #20
                STY     byte_FD
                STY     CAPITAL_Y_POS
                STY     byte_6C1
                LDX     #13

_4:                                     ; CODE XREF: CPTL+67↓j
                LDA     AAH-1,X         ; final targets (main color)
                STA     P2,Y            ; Enemy (first color)
                LDA     AAI-1,X         ; final targets (black color)
                STA     P3-2,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     _4
                LDA     #176
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                STA     ENEMY_X_POS     ; Enemy X position

_3:                                     ; CODE XREF: CPTL+28↑j
                                        ; CPTL+2C↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: CPTL+11↑j
                LDA     VBL_DOWN_COUNTER ; VBL down counter, running countinously during the game
                LSR     A
                BCC     _3              ; => Return
                CPY     #196
                BCC     _5
                DEC     byte_6C1
                BNE     _7
                LDA     #0
                STA     CAPITAL_Y_POS
                STA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                STA     M3PL_SIZEP3     ; Missle to Player 3 Collision / Player 3 Size
                STA     byte_6C5
                STA     byte_FD
                RTS
; ---------------------------------------------------------------------------

_7:                                     ; CODE XREF: CPTL+81↑j
                LDA     #0
                STA     P2,Y            ; Enemy (first color)
                STA     P3,Y            ; Enemy (second color)

_5:                                     ; CODE XREF: CPTL+7C↑j
                LDX     #20

_6:                                     ; CODE XREF: CPTL+AC↓j
                LDA     P2,Y            ; Enemy (first color)
                STA     P2+2,Y          ; Enemy (first color)
                LDA     P3,Y            ; Enemy (second color)
                STA     P3+2,Y          ; Enemy (second color)
                DEY
                DEX
                BNE     _6
                DEC     ENEMY_X_POS     ; Enemy X position
                LDA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDA     CAPITAL_Y_POS
                CMP     #196
                BCS     _3              ; => Return
                INC     CAPITAL_Y_POS
                INC     CAPITAL_Y_POS
                RTS
; End of function CPTL


; =============== S U B R O U T I N E =======================================

; Score: add 10

S10__SCORE_ADD_10:                      ; CODE XREF: Y7__HIT_RW_PLANE_TR+16↑p
                                        ; X5+C↑p ...
                INC     SC_STATUS_LINE.line_2.score_digit_1
                LDA     SC_STATUS_LINE.line_2.score_digit_1
                CMP     #KEYCODE_9+1
                BEQ     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: S10__SCORE_ADD_10+8↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_2.score_digit_1
; End of function S10__SCORE_ADD_10


; =============== S U B R O U T I N E =======================================

; Score: add 100

S100__SCORE_ADD_100:                    ; CODE XREF: TURN+C2↑p
                                        ; COLM02+23↑p ...
                INC     SC_STATUS_LINE.line_2.score_digit_10
                LDA     SC_STATUS_LINE.line_2.score_digit_10
                CMP     #KEYCODE_9+1
                BEQ     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: S100__SCORE_ADD_100+8↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_2.score_digit_10

S1000__SCORE_ADD_1000:                  ; CODE XREF: S500__SCORE_ADD_500+14↓j
                INC     SC_STATUS_LINE.line_2.score_digit_100
                LDA     SC_STATUS_LINE.line_2.score_digit_100
                CMP     #KEYCODE_9+1
                BEQ     S10000__SCORE_ADD_10000
                RTS
; ---------------------------------------------------------------------------

S10000__SCORE_ADD_10000:                ; CODE XREF: S100__SCORE_ADD_100+18↑j
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_2.score_digit_100
                LDA     SC_STATUS_LINE.line_2.score_digit_1000
                BNE     _1_
                LDA     #_0|_C_BLUE
                STA     SC_STATUS_LINE.line_2.score_digit_1000

_1_:                                    ; CODE XREF: S100__SCORE_ADD_100+23↑j
                INC     SC_STATUS_LINE.line_2.score_digit_1000
                RTS
; End of function S100__SCORE_ADD_100


; =============== S U B R O U T I N E =======================================

; Score: add 500

S500__SCORE_ADD_500:                    ; CODE XREF: BMCPTL+33↓p
                LDA     SC_STATUS_LINE.line_2.score_digit_10
                CLC
                ADC     #5
                CMP     #KEYCODE_9+1
                BCS     _1
                STA     SC_STATUS_LINE.line_2.score_digit_10
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: S500__SCORE_ADD_500+8↑j
                SEC
                SBC     #10
                STA     SC_STATUS_LINE.line_2.score_digit_10
                JMP     S1000__SCORE_ADD_1000
; End of function S500__SCORE_ADD_500


; =============== S U B R O U T I N E =======================================

; Score: add 50

S50__SCORE_ADD_50:                      ; CODE XREF: Y7__HIT_RW_PLANE_TR+19↑p
                                        ; X8__HIT_BOAT_TR+12↑p ...
                LDA     SC_STATUS_LINE.line_2.score_digit_1
                CLC
                ADC     #5
                CMP     #KEYCODE_9+1
                BCS     Z8
                STA     SC_STATUS_LINE.line_2.score_digit_1
                RTS
; ---------------------------------------------------------------------------

Z8:                                     ; CODE XREF: S50__SCORE_ADD_50+8↑j
                                        ; S30__SCORE_ADD_30+8↓j
                SEC
                SBC     #10
                STA     SC_STATUS_LINE.line_2.score_digit_1
                JMP     S100__SCORE_ADD_100 ; Score: add 100
; End of function S50__SCORE_ADD_50


; =============== S U B R O U T I N E =======================================

; Score: add 30

S30__SCORE_ADD_30:                      ; CODE XREF: Z3+3A↓p Z3:_8↓p
                LDA     SC_STATUS_LINE.line_2.score_digit_1
                CLC
                ADC     #3
                CMP     #KEYCODE_9+1
                BCS     Z8
                STA     SC_STATUS_LINE.line_2.score_digit_1
                RTS
; End of function S30__SCORE_ADD_30


; =============== S U B R O U T I N E =======================================


SHP23:                                  ; CODE XREF: DRP23+9↑p
                                        ; SHIP+76↑p
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #28
                BCC     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: SHP23+6↑j
                LDA     M0PL            ; Missle to Player 0 Collision
                AND     #1100b          ; Player bullet collision with an enemy?
                BNE     _2

_4:                                     ; CODE XREF: SHP23+22↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: SHP23+E↑j
                LDY     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                JSR     HG              ; Remove plane bullet
                LDA     byte_FD
                CMP     #1
                BNE     _3
                JMP     R6              ; Player and enemy collision
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: SHP23+1A↑j
                DEC     byte_6DC
                BNE     _4              ; => Return
                JMP     Z6              ; Set enemy to explosion graphics
; End of function SHP23


; =============== S U B R O U T I N E =======================================


P0SHP:                                  ; CODE XREF: SHIP+79↑p
                LDA     P1PL            ; Player Graphics Register 0
                AND     #1100b          ; Collisition with the enemy? (Player 2/3)
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: P0SHP+5↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #20             ; too close to the ground?
                BCC     _2
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: P0SHP+E↑j
                STA     byte_654
                JSR     Z6              ; Set enemy to explosion graphics
                PLA
                PLA
                JMP     CRASH           ; Plane was crashed
; End of function P0SHP


; =============== S U B R O U T I N E =======================================

; Flash the screen colors after e.g. a crash

XFLSH:                                  ; CODE XREF: COMMON+63↑p
                                        ; TURN+121↑p ...
                LDA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: XFLSH+3↑j
                DEC     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                LDA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                LSR     A
                LSR     A
                BCC     _2              ; Restore previously saved color palette
                LDA     #COLOR_INTENSITY_8|COLOR_RED_ORANGE
                STA     COLOR3
                LDA     #COLOR_INTENSITY_14|COLOR_ORANGE
                STA     COLOR2
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     _3
                LDA     #COLOR_INTENSITY_4|COLOR_RED_ORANGE
                STA     COLOR0          ; COLOR 0
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE
                STA     COLOR1
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: XFLSH+1E↑j
                LDA     #COLOR_INTENSITY_12|COLOR_ORANGE
                STA     COLOR0          ; COLOR 0
                LDA     #COLOR_INTENSITY_6|COLOR_RED_ORANGE
                STA     COLOR1
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: XFLSH+E↑j
                LDX     #4              ; Restore previously saved color palette

_4:                                     ; CODE XREF: XFLSH+3F↓j
                LDA     SAVED_COLOR0_3-1,X
                STA     COLOR0-1,X      ; COLOR 0
                DEX
                BNE     _4
                RTS
; End of function XFLSH


; =============== S U B R O U T I N E =======================================

; Save current color palette, because we start the flashing animation

ABA:                                    ; CODE XREF: TURN+7F↑p
                                        ; COLM02+5D↑p ...
                LDA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                BNE     ADF             ; => Return
                LDA     #COLOR_INTENSITY_12|COLOR_GRAY
                STA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                LDA     #18
                STA     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                LDX     #4

ADG:                                    ; CODE XREF: ABA+18↓j
                LDA     COLOR0-1,X      ; COLOR 0
                STA     SAVED_COLOR0_3-1,X
                DEX
                BNE     ADG

ADF:                                    ; CODE XREF: ABA+3↑j
                RTS                     ; => Return
; End of function ABA


; =============== S U B R O U T I N E =======================================


W1:                                     ; CODE XREF: Y7__HIT_RW_PLANE_TR+1C↑j
                                        ; X8__HIT_BOAT_TR+1C↑j ...
                JSR     ABA             ; Save current color palette, because we start the flashing animation
                JMP     Z7
; End of function W1


; =============== S U B R O U T I N E =======================================


Z3:                                     ; CODE XREF: CKCHAR+52↑j
                LDX     #12

_1:                                     ; CODE XREF: Z3+8↓j
                CMP     AAF,X           ; Targets: all parts of a hangar
                BEQ     _2
                DEX
                BNE     _1

                LDX     byte_6EB
                BNE     _11
                CMP     #254
                BEQ     _4
                LDX     #2
                STX     TEMP_B0

_9:                                     ; CODE XREF: Z3+26↓j
                LDX     #11

_7:                                     ; CODE XREF: Z3+1F↓j
                CMP     AAG-1,X         ; Targets: all cars, tanks, ait-aircraft battery on the playfield
                BEQ     _8              ; Hit a minor target (+30 points)
                DEX
                BNE     _7
                INY
                LDA     (CURRENT_TILE_ROW_PTR),Y
                DEC     TEMP_B0
                BNE     _9
                DEY
                DEY
                RTS
; ---------------------------------------------------------------------------

_11:                                    ; CODE XREF: Z3+D↑j
                CPX     #1
                BEQ     _12
                LDA     #0
                STA     CURRENT_TILE_ROW_PTR+1
                JMP     DT
; ---------------------------------------------------------------------------

_12:                                    ; CODE XREF: Z3+2D↑j
                CMP     #96
                BNE     _13
                JSR     S30__SCORE_ADD_30 ; Score: add 30
                LDA     #EXPLOSITION_TARGET_15
                STA     VAR_EXPLOSION_TARGET
                PLA
                PLA
                JMP     W1
; ---------------------------------------------------------------------------

_13:                                    ; CODE XREF: Z3+38↑j
                PLA
                PLA
                LDA     #0
                STA     CURRENT_TILE_ROW_PTR+1
                LDA     AUDIO2_DROPSND_FREQ_SAVED
                STA     AUDIO2_DROPSND_FREQ
                INC     byte_6ED

_78:                                    ; CODE XREF: Z3+5A↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: Z3+5↑j
                LDA     byte_6F9
                BEQ     _78             ; => Return
                LDA     #0
                STA     byte_6F9
                PLA
                PLA
                LDA     #EXPLOSITION_TARGET_AIRPORT_HANGAR
                STA     VAR_EXPLOSION_TARGET
                LDA     COLOR1
                CMP     #COLOR_INTENSITY_4|COLOR_LIGHT_BLUE
                BNE     _3
                LDA     byte_FD
                CMP     #254
                BEQ     _77
                LDA     RANDOM          ; Random Number Generator
                STA     SDLSTL          ; SAVE DISPLAY LIST LOW BYTE

_3:                                     ; CODE XREF: Z3+6D↑j
                JSR     S100__SCORE_ADD_100 ; Score: add 100

_77:                                    ; CODE XREF: Z3+73↑j
                JMP     W1
; ---------------------------------------------------------------------------

_8:                                     ; CODE XREF: Z3+1C↑j
                JSR     S30__SCORE_ADD_30 ; Hit a minor target (+30 points)
                JSR     ABA             ; Save current color palette, because we start the flashing animation
                JMP     U3
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: Z3+11↑j
                LDA     #EXPLOSITION_TARGET_10
                STA     VAR_EXPLOSION_TARGET
                PLA
                PLA
                JMP     Z7
; End of function Z3


; =============== S U B R O U T I N E =======================================


FLSH:                                   ; CODE XREF: DRUN__DRAW_RUNWAY:MD↑p
                                        ; DRUN__DRAW_RUNWAY:SH↑p
                LDA     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                CMP     REQUIRED_TARGETS ; Number of required primary targets to progress (8 or 9 by random)
                BCS     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: FLSH+6↑j
                DEC     byte_6B7
                LDA     byte_6B7
                LSR     A
                LSR     A
                BCC     _2
                LDA     #_SPACE|_C_BLUE
                STA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                LDA     GAME_COMPLETION_MASK
                CMP     #FINAL_TARGET_ALL
                BNE     _4
                LDA     byte_6B6
                BEQ     _4
                LDA     #COLOR_INTENSITY_4|COLOR_GREEN
                STA     DL_IRQ_BACKGROUND_COLOR ; mission complete! – and land and receive award

_4:                                     ; CODE XREF: FLSH+1D↑j
                                        ; FLSH+22↑j ...
                LDA     #0
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: FLSH+11↑j
                LDA     GAME_COMPLETION_MASK
                CMP     #FINAL_TARGET_ALL
                BNE     _5
                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ

_5:                                     ; CODE XREF: FLSH+34↑j
                LDA     byte_6B6
                STA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                BEQ     _4
                LDA     #AUDIO_CONTROL_VOL_2|AUDIO_CONTROL_DIST_4
                STA     AUDC4           ; Audio 4 Channel Control Register
                LDA     #AUDIO_CONTROL_VOL_15
                STA     AUDF4           ; Audio 4 Frequency Register
                RTS
; End of function FLSH


; =============== S U B R O U T I N E =======================================

; 2x2 water explosion

Y6:                                     ; CODE XREF: ID:Y5↑j
                LDA     EXPLOSION_TILE_ANIMATION
                CMP     #1
                BEQ     _2
                LSR     A
                LSR     A
                LSR     A
                BCC     loc_43A2
                LDA     #L_EXPLOSION_WATER_4|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                LDA     #L_EXPLOSION_WATER_3|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CPBT            ; Check if previous tile row is still visible, exit if not
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                DEY
                LDA     #L_EXPLOSION_STREET_2|L_C_1
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

loc_43A2:                               ; CODE XREF: Y6+A↑j
                LDA     #L_EXPLOSION_WATER_2|L_C_0
                JMP     X3
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: Y6+5↑j
                LDA     #L_WATER|L_C_0
                JMP     X3
; ---------------------------------------------------------------------------

X7:                                     ; CODE XREF: ID:X6↑j
                LDA     EXPLOSION_TILE_ANIMATION ; 2x1 street explosion
                LSR     A
                LSR     A
                LSR     A
                BCC     loc_43BC
                LDA     #L_EXPLOSION_STREET_1|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

loc_43BC:                               ; CODE XREF: Y6+30↑j
                LDA     #L_EXPLOSION_STREET_2|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                LDA     #L_EXPLOSION_STREET_3|L_C_1
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

W6:                                     ; CODE XREF: ID:W5↑j
                LDA     EXPLOSION_TILE_ANIMATION ; 2x2 runway tile explosion
                LSR     A
                LSR     A
                LSR     A
                BCC     X4
                LDA     #L_EXPLOSION_STREET_1|L_C_1

X3:                                     ; CODE XREF: Y6+22↑j Y6+27↑j
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CPBT            ; Check if previous tile row is still visible, exit if not
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                DEY
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                RTS
; ---------------------------------------------------------------------------

X4:                                     ; CODE XREF: Y6+4A↑j
                CLC
                LDA     #L_EXPLOSION_STREET_2|L_C_1
                JMP     _5
; ---------------------------------------------------------------------------

_5:                                     ; CODE XREF: Y6+5F↑j
                STA     (CURRENT_TILE_ROW_PTR),Y
                ADC     #1
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                JSR     CPBT            ; Check if previous tile row is still visible, exit if not
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                DEY
                SEC
                SBC     #1
                STA     (PREVIOUS_TILE_ROW_PTR),Y
                RTS
; End of function Y6


; =============== S U B R O U T I N E =======================================

; Check if previous tile row is still visible, exit if not

CPBT:                                   ; CODE XREF: V8+11↑p V8+25↑p ...
                LDX     PREVIOUS_TILE_ROW_PTR+1
                CPX     #255            ; previous row no longer visible?
                BNE     _1              ; => Return
                PLA
                PLA                     ; then leave the subroutine above

_1:                                     ; CODE XREF: CPBT+4↑j
                RTS                     ; => Return
; End of function CPBT

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR GUNC

TB:                                     ; CODE XREF: GUNC:ADC↓j
                DEC     byte_6B1
                LDA     byte_6B1
                CMP     #18
                BEQ     loc_4414
                CMP     #6
                BEQ     loc_440F
                RTS
; ---------------------------------------------------------------------------

loc_440F:                               ; CODE XREF: GUNC-5F0↑j
                LDA     #30
                STA     byte_6B1

loc_4414:                               ; CODE XREF: GUNC-5F4↑j
                LDA     #45
                STA     byte_BF
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #10
                TAY
                LDA     #L_FLASHING_MARKER|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                TYA
                CLC
                ADC     #7
                JSR     A2
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                CLC
                ADC     #1
                TAY
                LDA     #L_FLASHING_MARKER|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                TYA
                ADC     #7
                JMP     B3
; END OF FUNCTION CHUNK FOR GUNC

; =============== S U B R O U T I N E =======================================

; Player collision with enemy?

COLCPTL:                                ; CODE XREF: XCPTL↓p
                LDA     P1PL            ; Player Graphics Register 0
                AND     #1100b          ; Collisition with the enemy? (Player 2/3)
                BNE     _1

_2:                                     ; CODE XREF: COLCPTL+E↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: COLCPTL+5↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #25
                BCS     _2              ; => Return
                STA     byte_654
                JMP     CRASH           ; Plane was crashed
; End of function COLCPTL


; =============== S U B R O U T I N E =======================================

; Check if the plane is too low to the ground. Warn via control display color and sound effect.

LOW:                                    ; CODE XREF: COMMON+45↑p
                LDA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                BEQ     _5
                CMP     #COLOR_INTENSITY_6|COLOR_ORANGE ; Flashing yellow = flying too low - a crash is imminent!
                BEQ     _5
                CMP     #COLOR_INTENSITY_2|COLOR_GOLD ; strafing altitude
                BNE     _2              ; => Return

_5:                                     ; CODE XREF: LOW+3↑j LOW+7↑j
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SEC
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #24
                BCC     _6              ; 24-29 => strafing altitude
                CMP     #29
                BCC     _3

_8:                                     ; CODE XREF: LOW+35↓j
                LDA     #COLOR_INTENSITY_0|COLOR_GRAY
                JMP     _4
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: LOW+18↑j
                LDA     LOW_SND_FREQ    ; Sound flag when the plane is low to the ground
                BEQ     _12             ; strafing altitude
                LDA     #0
                STA     LOW_SND_FREQ    ; Sound flag when the plane is low to the ground
                STA     AUDC2           ; Audio 2 Channel Control Register

_12:                                    ; CODE XREF: LOW+22↑j
                LDA     #COLOR_INTENSITY_2|COLOR_GOLD ; strafing altitude

_4:                                     ; CODE XREF: LOW+1C↑j LOW+5A↓j ...
                STA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ

_2:                                     ; CODE XREF: LOW+B↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: LOW+14↑j
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BEQ     _8
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LSR     A
                LSR     A
                LSR     A
                LSR     A
                BCC     _10
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_2|_C_BLUE
                BCC     _10
                LDA     #0
                STA     AUDIO2_DURATION_COUNTER
                LDA     #SND_FREQ_10
                STA     AUDF2           ; Audio 2 Frequency Register
                STA     LOW_SND_FREQ    ; Sound flag when the plane is low to the ground
                LDA     #AUDIO_CONTROL_VOL_6|AUDIO_CONTROL_DIST_4
                STA     AUDC2           ; Audio 2 Channel Control Register
                LDA     #COLOR_INTENSITY_6|COLOR_ORANGE ; Flashing yellow = flying too low - a crash is imminent!
                BNE     _4

_10:                                    ; CODE XREF: LOW+3D↑j LOW+44↑j
                LDA     #0
                STA     AUDC2           ; Audio 2 Channel Control Register
                BEQ     _4
; End of function LOW


; =============== S U B R O U T I N E =======================================

; Shoot plane bullet. Check if something was hit.

SHBT:                                   ; CODE XREF: TRIG__TRIGGER_MACHINE_GUN+61↑p
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #28
                BCC     _1

_2:                                     ; CODE XREF: SHBT+3D↓j
                                        ; SHBT+43↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: SHBT+6↑j
                LDA     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                STA     TEMP_ADR+1
                LDA     PLANE_BULLET_X_POS ; X-Position of the current bullet from the plane
                STA     TEMP_ADR
                JSR     ADA             ; Convert a X/Y position into an address to screen memory
                LDA     (TEMP_ADR),Y
                CMP     #L_TANK_LEFT_A|L_C_1
                BEQ     _7
                CMP     #L_TANK_RIGHT_A|L_C_1
                BEQ     _6
                CMP     #L_STREET_CAR_LEFT_COLOR_A|L_C_1
                BEQ     _7
                CMP     #L_STREET_CAR_LEFT_COLOR_B|L_C_1
                BEQ     _7
                CMP     #L_STREET_CAR_RIGHT_COLOR_A|L_C_1
                BEQ     _6
                CMP     #L_STREET_CAR_RIGHT_COLOR_B|L_C_1
                BEQ     _6
                CMP     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                BEQ     _10
                CMP     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_1
                BEQ     _10
                CMP     #L_FIXED_BOAT_BOTTOM_LEFT|L_C_1
                BEQ     _5
                CMP     #L_FIXED_BOAT_BOTTOM_RIGHT|L_C_1
                BNE     _2              ; => Return
                DEY

_5:                                     ; CODE XREF: SHBT+39↑j
                DEC     RIVER_BOAT_HIT_COUNTER ; The boat requires 2 hits to be destroyed
                BNE     _2              ; => Return
                LDA     #0
                STA     byte_661
                LDA     DL-3,X
                STA     PREVIOUS_TILE_ROW_PTR
                LDA     DL-2,X
                STA     PREVIOUS_TILE_ROW_PTR+1
                JSR     S50__SCORE_ADD_50 ; Score: add 50
                JSR     SL              ; Trigger explosion sound effect
                LDA     #EXPLOSITION_TARGET_BOAT

_8:                                     ; CODE XREF: SHBT+73↓j
                STA     VAR_EXPLOSION_TARGET
                JSR     ADP
                JMP     Z7
; ---------------------------------------------------------------------------

_10:                                    ; CODE XREF: SHBT+31↑j
                                        ; SHBT+35↑j
                LDA     #0
                STA     byte_661
                STA     byte_698

_6:                                     ; CODE XREF: SHBT+1D↑j
                                        ; SHBT+29↑j ...
                DEY

_7:                                     ; CODE XREF: SHBT+19↑j
                                        ; SHBT+21↑j ...
                JSR     S10__SCORE_ADD_10 ; Score: add 10
                LDA     #EXPLOSITION_TARGET_GRAS
                JMP     _8
; End of function SHBT


; =============== S U B R O U T I N E =======================================


ADP:                                    ; CODE XREF: SHBT+5F↑p
                STY     VAR_EXPLOSION_X_POS
                LDA     PLANE_BULLET_Y_POS ; Y-Position of the current bullet from the plane
                TAY
                ADC     #30
                STA     byte_639
                JSR     HG              ; Remove plane bullet
                LDA     TEMP_ADR
                STA     CURRENT_TILE_ROW_PTR
                LDA     TEMP_ADR+1
                STA     CURRENT_TILE_ROW_PTR+1
                JSR     ABA             ; Save current color palette, because we start the flashing animation
                RTS
; End of function ADP


; =============== S U B R O U T I N E =======================================

; Convert a X/Y position into an address to screen memory

ADA:                                    ; CODE XREF: XPLSN+D↑p
                                        ; SHBT+12↑p
                LDA     TEMP_ADR
                SEC
                SBC     #26
                LSR     A
                LSR     A
                SEC
                SBC     #2
                TAY
                LDA     TEMP_ADR+1
                SEC
                SBC     #8
                LSR     A
                LSR     A
                LSR     A
                STA     TEMP_B0
                ASL     A
                CLC
                ADC     TEMP_B0
                TAX
                LDA     DL,X
                STA     TEMP_ADR
                LDA     DL+1,X
                STA     TEMP_ADR+1
                RTS
; End of function ADA


; =============== S U B R O U T I N E =======================================


CKSC:                                   ; CODE XREF: COMMON+66↑p
                LDY     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                CPY     #GAME_LEVEL_ADVANCED
                BEQ     locret_45A4     ; => Return

                LDA     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                LDX     #6
                CMP     REQUIRED_TARGETS ; Number of required primary targets to progress (8 or 9 by random)
                BCS     loc_459B
                LDA     SC_STATUS_LINE.line_2.score_digit_1000
                BNE     loc_459B
                LDA     SC_STATUS_LINE.line_2.score_digit_100
                SEC
                SBC     #_0|_C_BLUE
                CLC
                ADC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                BEQ     locret_45A4     ; => Return
                CMP     #3
                BCC     loc_45A5
                CMP     #5
                BCC     loc_45B3
                CMP     #7
                BCC     loc_45C1
                CMP     #9
                BCC     loc_45CB

loc_459B:                               ; CODE XREF: CKSC+F↑j
                                        ; CKSC+14↑j ...
                LDA     EAS9,X          ; Advanced level variables
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     loc_459B

locret_45A4:                            ; CODE XREF: CKSC+5↑j
                                        ; CKSC+20↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_45A5:                               ; CODE XREF: CKSC+24↑j
                                        ; CKSC+47↓j
                CPY     #0
                BNE     locret_45A4     ; => Return
                LDA     EAS2,X          ; Wind triggered, if RANDOM < value
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     loc_45A5
                RTS
; ---------------------------------------------------------------------------

loc_45B3:                               ; CODE XREF: CKSC+28↑j
                                        ; CKSC+55↓j
                CPY     #0
                BNE     locret_45A4     ; => Return
                LDA     EAS4,X          ; Wind triggered, if RANDOM < value
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     loc_45B3
                RTS
; ---------------------------------------------------------------------------

loc_45C1:                               ; CODE XREF: CKSC+2C↑j
                                        ; CKSC+5F↓j
                LDA     EAS6,X          ; Intermediate level variables
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     loc_45C1
                RTS
; ---------------------------------------------------------------------------

loc_45CB:                               ; CODE XREF: CKSC+30↑j
                                        ; CKSC+69↓j
                LDA     EAS8,X          ; Wind triggered, if RANDOM < value
                STA     DIFF,X          ; Difficulty for the level
                DEX
                BPL     loc_45CB
                RTS
; End of function CKSC


; =============== S U B R O U T I N E =======================================


XCPTL:                                  ; CODE XREF: CPTL:_1↑p
                JSR     COLCPTL         ; Player collision with enemy?
                LDA     byte_6C5
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: XCPTL+6↑j
                DEC     byte_6C4
                LDA     byte_6C4
                LSR     A
                LSR     A
                BCC     _2
                LDX     #COLOR_INTENSITY_0|COLOR_RED_ORANGE
                JMP     _3
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: XCPTL+11↑j
                LDX     #COLOR_INTENSITY_12|COLOR_ORANGE

_3:                                     ; CODE XREF: XCPTL+15↑j
                STX     PCOLR2          ; P2 COLOR
                LDX     byte_6C6
                LSR     A
                LSR     A
                BCC     _4
                CPX     #1
                BEQ     _6              ; => Return
                LDA     ENEMY_X_POS     ; Enemy X position
                CLC
                ADC     #8
                STA     ENEMY_X_POS     ; Enemy X position
                LDA     #1
                JMP     _5
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: XCPTL+22↑j
                CPX     #3
                BEQ     _6              ; => Return
                LDA     ENEMY_X_POS     ; Enemy X position
                SEC
                SBC     #8
                STA     ENEMY_X_POS     ; Enemy X position
                LDA     #11b

_5:                                     ; CODE XREF: XCPTL+31↑j
                STA     M2PL_SIZEP2     ; Missle to Player 2 Collision / Player 2 Size
                STA     byte_6C6

_6:                                     ; CODE XREF: XCPTL+26↑j
                                        ; XCPTL+36↑j
                RTS                     ; => Return
; End of function XCPTL


; =============== S U B R O U T I N E =======================================


BMCPTL:                                 ; CODE XREF: BOMB+B9↑p
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_6
                BEQ     _1
                CMP     #GAME_PHASE_7
                BEQ     _1

_2:                                     ; CODE XREF: BMCPTL+10↓j
                                        ; BMCPTL+22↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: BMCPTL+4↑j
                                        ; BMCPTL+8↑j
                LDA     M1PL            ; Missle to Player 1 Collision
                AND     #1100b
                BEQ     _2              ; => Return

                LDA     GAME_COMPLETION_MASK
                LDX     PCOLR2          ; P2 COLOR
                CPX     #COLOR_INTENSITY_2|COLOR_RED_ORANGE
                BEQ     _3
                CPX     #COLOR_INTENSITY_0|COLOR_DARK_PURPLE
                BEQ     _4
                CPX     #COLOR_INTENSITY_0|COLOR_PURPLE_BLUE
                BNE     _2              ; => Return
                ORA     #FINAL_TARGET_3
                JMP     _5
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: BMCPTL+1A↑j
                ORA     #FINAL_TARGET_1
                JMP     _5
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: BMCPTL+1E↑j
                ORA     #FINAL_TARGET_2

_5:                                     ; CODE XREF: BMCPTL+26↑j
                                        ; BMCPTL+2B↑j
                STA     GAME_COMPLETION_MASK

                JSR     S500__SCORE_ADD_500 ; Score: add 500
                LDX     #18
                LDY     CAPITAL_Y_POS

_6:                                     ; CODE XREF: BMCPTL+48↓j
                LDA     #0
                STA     P3,Y            ; Enemy (second color)
                LDA     XCPTLIM-1,X     ; explosion off the final targets
                STA     P2,Y            ; Enemy (first color)
                DEY
                DEX
                BNE     _6

                INC     byte_6C3
                LDA     #16
                STA     COLOR_FLASHING  ; Flashing the screen counter (0=flashing disabled, >0:duration of the flashing)
                STA     byte_6C4
                STA     byte_6C5
                LDA     #26
                STA     QUAKE_ANIMATION_COUNTER ; Quake, shake via the scroll register, timer
                LDA     #70
                LDX     #AUDIO_CONTROL_VOL_14|AUDIO_CONTROL_DIST_1
                JMP     XXX             ; Start Audio 3 sound effect
; End of function BMCPTL


; =============== S U B R O U T I N E =======================================

; Skyscraper explosition via tile animation

ACL:                                    ; CODE XREF: ID:ACK↑j
                LDX     #7
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                BCC     _1
                LSR     A
                BCC     _2
                JSR     DFBLDG          ; Final target phase: define skyscraper buildings
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: ACL+A↑j ACL+17↓j
                LDA     ABC,X           ; Tile: explosion 1 on gras
                JSR     ABV
                DEX
                BPL     _2
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: ACL+7↑j ACL+21↓j
                LDA     ABD,X           ; Tile: explosion 2 on gras
                JSR     ABV
                DEX
                BPL     _1
                RTS
; End of function ACL


; =============== S U B R O U T I N E =======================================


ABV:                                    ; CODE XREF: ACL+13↑p ACL+1D↑p
                STA     ABW,X           ; $54:
                STA     ABX,X           ; $56:
                STA     ABY,X           ; $58:
                STA     ABZ,X           ; $5A:
                STA     ACA,X           ; $5C:
                STA     ACB,X           ; $5E:
                STA     ACC,X           ; $55:
                STA     ACD,X           ; $59:
                STA     ACE,X           ; $57:
                STA     ACF,X           ; $5D:
                RTS
; End of function ABV


; =============== S U B R O U T I N E =======================================

; Final target phase: define skyscraper buildings

DFBLDG:                                 ; CODE XREF: BLDG+9A↑p B7+A6↑p ...
                LDX     #7

_1:                                     ; CODE XREF: DFBLDG+3F↓j
                LDA     ACG,X           ; $01: Water (top), Grass
                STA     ABW,X           ; $54:
                LDA     ACH,X           ; $02: Water
                STA     ABX,X           ; $56:
                LDA     ACI,X           ; $60:
                STA     ABY,X           ; $58:
                LDA     ABO,X           ; Tile: building
                STA     ABZ,X           ; $5A:
                LDA     ABP,X           ; Tile: building roof
                STA     ACA,X           ; $5C:
                LDA     ABN,X           ; Tile: building
                STA     ACB,X           ; $5E:
                LDA     ABR,X           ; 8 zero bytes (used for initialization)
                STA     ACC,X           ; $55:
                LDA     ABT,X           ; Tile: building
                STA     ACD,X           ; $59:
                LDA     ACJ,X           ; Tile: target
                STA     ACE,X           ; $57:
                LDA     ABL,X           ; Tile: building wall/window
                STA     ACF,X           ; $5D:
                DEX
                BPL     _1
                RTS
; End of function DFBLDG


; =============== S U B R O U T I N E =======================================

; Buildings explosion via tile animation

ABB:                                    ; CODE XREF: ID:ABF↑j
                LDX     #7
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                BCC     _1
                LSR     A
                BCC     _2
                JSR     DFTNK
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: ABB+A↑j ABB+17↓j
                LDA     ABC,X           ; Tile: explosion 1 on gras
                JSR     ABK
                DEX
                BPL     _2
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: ABB+7↑j ABB+21↓j
                LDA     ABD,X           ; Tile: explosion 2 on gras
                JSR     ABK
                DEX
                BPL     _1
                RTS
; End of function ABB


; =============== S U B R O U T I N E =======================================


ABK:                                    ; CODE XREF: ABB+13↑p ABB+1D↑p
                STA     ABE,X           ; $45:
                STA     ABQ,X           ; $3F: Black tile
                STA     ABG,X           ; $4F:
                STA     ABH,X           ; $49:
                STA     ABI,X           ; $4A:
                STA     ABJ,X           ; $12: Runway, Road
                STA     ABS,X           ; $7F:
                RTS
; End of function ABK


; =============== S U B R O U T I N E =======================================


DFTNK:                                  ; CODE XREF: QN+4C↑p B7+A3↑p ...
                LDX     #7

_1:                                     ; CODE XREF: DFTNK+2D↓j
                LDA     ABL,X           ; Tile: building wall/window
                STA     ABE,X           ; $45:
                LDA     ABM,X           ; $7D:
                STA     ABG,X           ; $4F:
                LDA     ABN,X           ; Tile: building
                STA     ABH,X           ; $49:
                LDA     ABO,X           ; Tile: building
                STA     ABI,X           ; $4A:
                LDA     ABP,X           ; Tile: building roof
                STA     ABJ,X           ; $12: Runway, Road
                LDA     ABR,X           ; 8 zero bytes (used for initialization)
                STA     ABQ,X           ; $3F: Black tile
                LDA     ABT,X           ; Tile: building
                STA     ABS,X           ; $7F:
                DEX
                BPL     _1
                RTS
; End of function DFTNK


; =============== S U B R O U T I N E =======================================


XSHIP:                                  ; CODE XREF: TURN+12D↑p
                LDA     byte_B1
                BEQ     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: XSHIP+2↑j
                LDA     CRASH_EXPLOSION_COUNTER ; Duration counter for the plane explosion
                LSR     A
                LSR     A
                LSR     A
                BCC     _2
                LDA     #COLOR_INTENSITY_10|COLOR_ORANGE
                BNE     _3

_2:                                     ; CODE XREF: XSHIP+A↑j
                LDA     #COLOR_INTENSITY_0|COLOR_RED_ORANGE

_3:                                     ; CODE XREF: XSHIP+E↑j
                STA     PCOLR2          ; P2 COLOR
                RTS
; End of function XSHIP


; =============== S U B R O U T I N E =======================================


PBMB:                                   ; CODE XREF: COMMON+13↑p
                                        ; REFUEL+20↑p ...
                LDA     byte_FD
                CMP     #255
                BEQ     _1
                CMP     #254
                BEQ     _2

_3:                                     ; CODE XREF: PBMB+13↓j
                                        ; PBMB+1D↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: PBMB+4↑j
                STA     VAR_UNKNOWN_STATE
                LDA     VVBLKD          ; DEFERRED VERTICAL BLANK NMI VECTOR
                CMP     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                BEQ     _3              ; => Return
                JSR     BMBR
                LDA     RANDOM          ; Random Number Generator
                AND     #$3F ; '?'
                BNE     _3              ; => Return
                STA     ENEMY_TURN_MODE ; 0=none, 1=left, 2=right, >2=any
                JSR     OG
                LDA     #1
                STA     byte_6A8
                LDA     #70
                STA     byte_62F
                LDA     #UNKNOWNS_STATE_4
                STA     VAR_UNKNOWN_STATE
                LDA     PLANE_VERT_POS  ; Vertical Position of the Plane
                LSR     A
                STA     TEMP_B0
                LDA     PLANE_HORI_POS  ; Horizontal Position of the Plane
                LSR     A
                ADC     TEMP_B0
                ADC     #7
                STA     TEMP_B0
                SBC     #15
                STA     ENEMY_X_POS     ; Enemy X position

_5:                                     ; CODE XREF: PBMB+57↓j
                                        ; PBMB+61↓j
                LDA     RANDOM          ; Random Number Generator
                AND     #$7F
                STA     byte_6E3
                LSR     A
                ADC     #93
                CMP     ENEMY_X_POS     ; Enemy X position
                BCC     _4
                CMP     TEMP_B0
                BCC     _5

_4:                                     ; CODE XREF: PBMB+53↑j
                ADC     #35
                CMP     ENEMY_X_POS     ; Enemy X position
                BCC     _6
                CMP     TEMP_B0
                BCC     _5

_6:                                     ; CODE XREF: PBMB+5D↑j
                LDA     byte_6E3
                STA     ENEMY_X_POS     ; Enemy X position
                STA     HPOSP2          ; Enemy (Horizontal Position – first color)
                STA     HPOSP3          ; Enemy (Horizontal Position – second color)
                LDA     #254
                STA     byte_FD
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: PBMB+8↑j
                LDA     #AUDIO_CONTROL_VOL_3|AUDIO_CONTROL_DIST_6
                STA     AUDC1           ; Audio 1 Channel Control Register
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LSR     A
                BCC     BMBR
                JSR     L6
                LDA     byte_FD
                BNE     BMBR
                LDA     AUDC1_SHADOW
                STA     AUDC1           ; Audio 1 Channel Control Register
                LDA     VVBLKD          ; DEFERRED VERTICAL BLANK NMI VECTOR
                CMP     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                BEQ     BMBR
                DEC     byte_FD
; End of function PBMB


; =============== S U B R O U T I N E =======================================


BMBR:                                   ; CODE XREF: PBMB+15↑p
                                        ; PBMB+7B↑j ...
                JSR     XPLSN
                JSR     SPLASH          ; Splash sound effect on channel 2
                JSR     XFLSH           ; Flash the screen colors after e.g. a crash
                LDY     byte_FA
                BNE     AFS
                LDA     VVBLKD          ; DEFERRED VERTICAL BLANK NMI VECTOR
                CMP     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                BNE     _33
                LDA     EXPLOSION_TILE_ANIMATION
                BEQ     _3              ; => Return
                LDA     #2
                STA     EXPLOSION_TILE_ANIMATION
                RTS
; ---------------------------------------------------------------------------

_33:                                    ; CODE XREF: BMBR+12↑j
                LDA     ENEMY_X_POS     ; Enemy X position
                CMP     #170
                BCS     _3              ; => Return
                LDA     VAR_UNKNOWN_STATE
                CMP     #UNKNOWNS_STATE_5
                BNE     _3              ; => Return
                LDA     TRIGGER_COUNT   ; Increment with each button/trigger press
                CMP     #2
                BCS     _3              ; => Return
                LDA     RANDOM          ; Random Number Generator
                AND     #$1F
                BEQ     _2

_3:                                     ; CODE XREF: BMBR+17↑j
                                        ; BMBR+23↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: BMBR+38↑j
                LDA     ENEMY_X_POS     ; Enemy X position
                SEC
                SBC     PLANE_HORI_POS  ; Horizontal Position of the Plane
                BCC     _82
                CMP     #12
                BCS     _82
                LDA     byte_C2
                SBC     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                CMP     #20
                BCS     _3              ; => Return

_82:                                    ; CODE XREF: BMBR+40↑j
                                        ; BMBR+44↑j
                LDX     #2

_4_:                                    ; CODE XREF: BMBR+58↓j
                LDA     PLANE_HORI_POS,X ; Horizontal Position of the Plane
                PHA
                LDA     ENEMY_X_POS,X   ; Enemy X position
                STA     PLANE_HORI_POS,X ; Horizontal Position of the Plane
                DEX
                BPL     _4_
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     #8
                STA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                JSR     PC
                LDX     #0

_5:                                     ; CODE XREF: BMBR+6B↓j
                PLA
                STA     PLANE_HORI_POS,X ; Horizontal Position of the Plane
                INX
                CPX     #3
                BNE     _5
                RTS
; ---------------------------------------------------------------------------

AFS:                                    ; CODE XREF: BMBR+B↑j
                LDA     VVBLKD          ; DEFERRED VERTICAL BLANK NMI VECTOR
                CMP     #>VBIR__DEFERRED_VBL_DRAW ; Deferred VBL: scroll the playfield and play sound
                BNE     _1
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #20
                BCS     _8              ; => Return
                LDA     EXPLOSION_TILE_ANIMATION
                BEQ     _3_
                LDA     #1
                STA     EXPLOSION_TILE_ANIMATION

_3_:                                    ; CODE XREF: BMBR+80↑j
                JSR     BOMB            ; Trigger bomb drop
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                LSR     A
                BCC     _8              ; => Return
                DEC     byte_623
                LDA     byte_623
                STA     P1PF_HPOSM1     ; Missile 1 Horizontal Position / Player 1 to Playfield Collision

_8:                                     ; CODE XREF: BMBR+7B↑j
                                        ; BMBR+8D↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: BMBR+73↑j
                LDA     M1PL            ; Missle to Player 1 Collision
                AND     #1
                BEQ     _4
                PLA
                PLA
                JMP     CRASH           ; Plane was crashed
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: BMBR+9E↑j
                JMP     BOMB            ; Trigger bomb drop
; End of function BMBR


; =============== S U B R O U T I N E =======================================


CDRP:                                   ; CODE XREF: CITY+2C↑p
                LDA     byte_6ED
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: CDRP+3↑j
                LDA     AUDIO2_DROPSND_FREQ
                CMP     #70
                BCS     AFF
                JMP     DRPSND          ; Bomb drop sound
; End of function CDRP


; =============== S U B R O U T I N E =======================================


AFF:                                    ; CODE XREF: BOMB+24↑p
                                        ; CDRP+B↑j
                LDA     #0
                STA     byte_6ED
                STA     AUDC2           ; Audio 2 Channel Control Register
                JMP     AFE
; End of function AFF


; =============== S U B R O U T I N E =======================================

; 2x1 tile explosion in water

XI:                                     ; CODE XREF: ID:BD↑j
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                BCC     _1
                LDA     #L_WATER_60|L_C_0
                JMP     _2
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: XI+5↑j
                LDA     #L_EXPLOSION_WATER_1|L_C_0

_2:                                     ; CODE XREF: XI+9↑j
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; End of function XI


; =============== S U B R O U T I N E =======================================


AFB:                                    ; CODE XREF: PC+2F↑j
                LDA     byte_C5
                BEQ     _1

_2:                                     ; CODE XREF: AFB+12↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: AFB+2↑j
                LDA     byte_6EA
                CMP     #243
                BCS     _3
                CMP     #150
                BCC     _3
                CMP     #213
                BCC     _2              ; => Return
                STA     byte_6EB
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: AFB+A↑j AFB+E↑j
                LDA     #1
                STA     byte_6EB
                LDA     byte_61F
                SBC     #80
                STA     byte_61F
                RTS
; End of function AFB


; =============== S U B R O U T I N E =======================================

; 2x1 tile explosion wall

AEI:                                    ; CODE XREF: ID:AEH↑j
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                BCC     loc_4922
                LDA     #L_SOLID_WALL|L_C_1
                JMP     loc_4924
; ---------------------------------------------------------------------------

loc_4922:                               ; CODE XREF: AEI+5↑j
                LDA     #L_EXPLOSION_5F|L_C_0

loc_4924:                               ; CODE XREF: AEI+9↑j
                STA     (CURRENT_TILE_ROW_PTR),Y
                INY
                STA     (CURRENT_TILE_ROW_PTR),Y
                RTS
; End of function AEI


; =============== S U B R O U T I N E =======================================

; Airport hangar explosion via tile animation

Z5:                                     ; CODE XREF: ID:Z4↑j
                LDX     #7
                LDA     EXPLOSION_TILE_ANIMATION
                LSR     A
                LSR     A
                BCC     _1
                LSR     A
                BCC     _2
                JMP     DFHNGR          ; Define Hangar – restore the font characters for the hangar
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: Z5+A↑j Z5+16↓j
                LDA     ABC,X           ; Tile: explosion 1 on gras
                JSR     ADR             ; Set line X of the the hangar font characters
                DEX
                BPL     _2
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: Z5+7↑j Z5+20↓j
                LDA     ABD,X           ; Tile: explosion 2 on gras
                JSR     ADR             ; Set line X of the the hangar font characters
                DEX
                BPL     _1
                RTS
; End of function Z5


; =============== S U B R O U T I N E =======================================

; Set line X of the the hangar font characters

ADR:                                    ; CODE XREF: Z5+12↑p Z5+1C↑p
                STA     ADS,X           ; $15: Hangar (A)
                STA     ADT,X           ; $16: Hangar (B)
                STA     ADU,X           ; $17: Hangar (C)
                STA     ADV,X           ; $18: Hangar (D)
                STA     ADW,X           ; $19: Hangar (E)
                STA     ADX,X           ; $1A: Hangar (F)
                STA     ADY,X           ; $1B: Hangar (G)
                STA     ADZ,X           ; $1D: Hangar (I)
                STA     AEA,X           ; $1E: Hangar (J)
                STA     AEB,X           ; $1F: Hangar (K)
                STA     AEC,X           ; $20: Hangar (L)
                STA     AED,X           ; $7E: Hangar (M) Black
                STA     AEE,X           ; $1C: Hangar (H)
                RTS
; End of function ADR


; =============== S U B R O U T I N E =======================================

; Define Hangar – restore the font characters for the hangar

DFHNGR:                                 ; CODE XREF: RESET+277↑p
                                        ; ENRUN+2E↑j ...
                LDX     #7

loc_4977:                               ; CODE XREF: DFHNGR+9↓j
                LDA     ABR,X           ; 8 zero bytes (used for initialization)
                STA     AED,X           ; $7E: Hangar (M) Black
                DEX
                BPL     loc_4977
                LDX     #95

loc_4982:                               ; CODE XREF: DFHNGR+14↓j
                LDA     AEG,X           ; Backup of the hangar font characters
                STA     ADS,X           ; $15: Hangar (A)
                DEX
                BPL     loc_4982
                RTS
; End of function DFHNGR


; =============== S U B R O U T I N E =======================================

; Count individual button presses during a landing

TRIGC__TRIGGER_COUNT:                   ; CODE XREF: REFUEL+29↑p
                                        ; REFUEL:MU↑p ...
                LDA     STRIG0          ; JOYSTICK TRIGGER 0
                CMP     LAST_STRIG0     ; Last STRIG0 value (for debouncing)
                BNE     _1

_2:                                     ; CODE XREF: TRIGC__TRIGGER_COUNT+F↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: TRIGC__TRIGGER_COUNT+6↑j
                STA     LAST_STRIG0     ; Last STRIG0 value (for debouncing)
                LDA     LAST_STRIG0     ; Last STRIG0 value (for debouncing)
                BNE     _2              ; => Return
                INC     TRIGGER_COUNT   ; Increment with each button/trigger press
                RTS
; End of function TRIGC__TRIGGER_COUNT


; =============== S U B R O U T I N E =======================================

; Restore anti-airgraft gun battery graphics at character $31

DFGN:                                   ; CODE XREF: RESET+188↑p
                                        ; B7:U7↑p
                LDX     #7

_1:                                     ; CODE XREF: DFGN+9↓j
                LDA     ADI,X           ; Standard anti-aircraft gun battery. Used to restore after the final city anti-aircraft gun battery was used as  character $31.
                STA     ADK,X           ; $31: Anti-Aircraft Battery
                DEX
                BPL     _1
                RTS
; End of function DFGN


; =============== S U B R O U T I N E =======================================


CTYGN:                                  ; CODE XREF: CITY+15↑p
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BNE     _2              ; => Return
                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_5
                BCC     _2              ; => Return
                BEQ     _3
                CMP     #GAME_PHASE_8
                BCC     _1

_2:                                     ; CODE XREF: CTYGN+2↑j
                                        ; CTYGN+8↑j ...
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: CTYGN+A↑j
                LDA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                CMP     #4
                BNE     _2              ; => Return

_5:                                     ; CODE XREF: CTYGN+2A↓j
                                        ; CTYGN+32↓j ...
                LDY     #25
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #32
                JMP     A2
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: CTYGN+E↑j
                LDA     GAME_PHASE_ROWS ; Length of a game phase in remaining rows
                CMP     #1
                BEQ     _4
                CMP     #13
                BEQ     _5
                CMP     #25
                BEQ     _4
                CMP     #37
                BEQ     _5
                CMP     #49
                BEQ     _4
                CMP     #61
                BEQ     _5
                CMP     #74
                BEQ     _4
                RTS
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: CTYGN+26↑j
                                        ; CTYGN+2E↑j ...
                LDY     #25
                LDA     #L_ANTI_AIRCRAFT_BATTERY_A|L_C_0
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                LDA     #32
                JMP     B3
; End of function CTYGN

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR GUNC

ADC:                                    ; CODE XREF: GUNC+8↓j
                JMP     TB
; END OF FUNCTION CHUNK FOR GUNC

; =============== S U B R O U T I N E =======================================


GUNC:                                   ; CODE XREF: AREA+24↑p

; FUNCTION CHUNK AT 4400 SIZE 0000003B BYTES
; FUNCTION CHUNK AT 49F9 SIZE 00000003 BYTES

                LDA     CURRENT_GAME_PHASE
                CMP     #GAME_PHASE_4
                BEQ     _1
                CMP     #GAME_PHASE_8
                BEQ     ADC

_7:                                     ; CODE XREF: GUNC+1B↓j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: GUNC+4↑j
                DEC     byte_6B1
                LDA     byte_6B1
                CMP     #18
                BEQ     _2
                CMP     #6
                BEQ     _3
                CMP     #4
                BCC     _7              ; => Return
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     _5
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: GUNC+17↑j
                LDA     #30
                STA     byte_6B1

_2:                                     ; CODE XREF: GUNC+13↑j
                LDA     #45
                STA     byte_BF
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SEC
                SBC     #10
                TAY
                LDA     #L_ANTI_AIRCRAFT_BATTERY_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                TYA
                CLC
                ADC     #7
                JSR     A2
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                CLC
                ADC     #1
                TAY
                LDA     #L_ANTI_AIRCRAFT_BATTERY_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                TYA
                ADC     #7
                JMP     B3
; ---------------------------------------------------------------------------

_5:                                     ; CODE XREF: GUNC+21↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #1111b
                STA     TEMP_B0
                LDA     RANDOM          ; Random Number Generator
                LSR     A
                BCC     _6
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                ADC     TEMP_B0
                JMP     _4
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: GUNC+5B↑j
                LDA     ROAD_RIGHT_X_POS ; right X position where the road starts
                SBC     #12
                SBC     TEMP_B0

_4:                                     ; CODE XREF: GUNC+62↑j
                TAY
                LDA     #L_TANK_LEFT_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                INY
                LDA     #L_TANK_RIGHT_B|L_C_1
                STA     (VBL_NEXT_ROW_PTR),Y ; new row to be draw. Set inside the VBL.
                RTS
; End of function GUNC


; =============== S U B R O U T I N E =======================================

; Play gound sound, if enabled

GGNSND:                                 ; CODE XREF: COMMON+5D↑p
                LDA     AUDIO4_GUN_SND_COUNTER
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: GGNSND+3↑j
                DEC     AUDIO4_GUN_SND_COUNTER
                BEQ     _2
                LDA     AUDIO4_GUN_SND_COUNTER
                CMP     #4
                BCC     _3
                LSR     A
                LSR     A
                BCC     _2
                LDA     #AUDIO_CONTROL_VOL_7|AUDIO_CONTROL_DIST_2
                STA     AUDC4           ; Audio 4 Channel Control Register

_4:                                     ; CODE XREF: GGNSND+26↓j
                LDA     #SND_FREQ_60
                STA     AUDF4           ; Audio 4 Frequency Register
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: GGNSND+10↑j
                LDA     #AUDIO_CONTROL_VOL_5|AUDIO_CONTROL_DIST_1
                STA     AUDC4           ; Audio 4 Channel Control Register
                JMP     _4
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: GGNSND+9↑j
                                        ; GGNSND+14↑j
                LDA     #0
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; End of function GGNSND


; =============== S U B R O U T I N E =======================================

; Increment Speed

TKOSPD__INCREMENT_SPEED:                ; CODE XREF: TAKOF__TAKEOFF_LOOP:_8↑p
                                        ; TAKOF__TAKEOFF_LOOP+40↑p
                INC     SC_STATUS_LINE.line_1.speed_digit_1
                LDA     SC_STATUS_LINE.line_1.speed_digit_1
                CMP     #_COLON|_C_ORANGE
                BNE     _2              ; => Return
                LDA     #_0|_C_ORANGE
                STA     SC_STATUS_LINE.line_1.speed_digit_1
                INC     SC_STATUS_LINE.line_1.speed_digit_10
                LDA     SC_STATUS_LINE.line_1.speed_digit_10
                CMP     #_COLON|_C_ORANGE
                BNE     _2              ; => Return
                LDX     #_1|_C_BLUE
                STX     SC_STATUS_LINE.line_1.speed_digit_100
                DEX
                STX     SC_STATUS_LINE.line_1.speed_digit_10
                STX     SC_STATUS_LINE.line_1.speed_digit_1

_2:                                     ; CODE XREF: TKOSPD__INCREMENT_SPEED+8↑j
                                        ; TKOSPD__INCREMENT_SPEED+17↑j
                RTS                     ; => Return
; End of function TKOSPD__INCREMENT_SPEED


; =============== S U B R O U T I N E =======================================

; Display List IRQ during the menu

DLIR1__DLIST_DURING_MENU:               ; DATA XREF: CNSL__CONSOLE+6F↓t
                                        ; CNSL__CONSOLE+74↓t
                PHA
                LDA     #COLOR_INTENSITY_0|COLOR_RED_ORANGE
                STA     WSYNC           ; Wait for Horizontal Blank Synchronisation
                STA     COLBK           ; Background Color
                PLA
                RTI
; End of function DLIR1__DLIST_DURING_MENU


; =============== S U B R O U T I N E =======================================

; Read score from screen memory digits (range: 000-199 in tenths)

CLCSC__READ_SCORE_VALUE:                ; CODE XREF: RNK__DISPLAY_RANK+E↓p
                                        ; RNKX__PRINT_RANK_CLASS+11↓p
                LDA     SC_STATUS_LINE.line_2.score_digit_10
                SEC
                SBC     #_0|_C_BLUE     ; Tenth-digit of the screen
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     SC_STATUS_LINE.line_2.score_digit_100
                SBC     #_0|_C_BLUE     ; Hundreds-digit of the screen
                ASL     A
                STA     TEMP_B0
                ASL     A
                ASL     A
                CLC
                ADC     TEMP_B0
                ADC     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     SC_STATUS_LINE.line_2.score_digit_1000
                BEQ     _3              ; Thousands-digit of the screen
                CMP     #_1|_C_BLUE
                BEQ     _2
                LDA     #255
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: CLCSC__READ_SCORE_VALUE+20↑j
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                CLC
                ADC     #100
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling

_3:                                     ; CODE XREF: CLCSC__READ_SCORE_VALUE+1C↑j
                RTS                     ; => Return
; End of function CLCSC__READ_SCORE_VALUE

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR RNK__DISPLAY_RANK

WORST:                                  ; CODE XREF: RNK__DISPLAY_RANK+1E↓j
                JSR     FTG             ; Print "FLYING TIGER" to screen
                LDA     #L_RUNWAY_LEFT_13|L_C_0
                BNE     AIB

WORST1:                                 ; CODE XREF: RNK__DISPLAY_RANK+24↓j
                JSR     FTG             ; Print "FLYING TIGER" to screen
                LDA     #L_RUNWAY_MARKER_14|L_C_0

AIB:                                    ; CODE XREF: RNK__DISPLAY_RANK-B↑j
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                RTS
; END OF FUNCTION CHUNK FOR RNK__DISPLAY_RANK

; =============== S U B R O U T I N E =======================================

; Display the rank based on difficulty and score

RNK__DISPLAY_RANK:                      ; CODE XREF: STOPL+5C↑p

; FUNCTION CHUNK AT 4B02 SIZE 00000010 BYTES

                JSR     AFH__ERASE_RANK_DISPLAY ; Erase rank text lines
                LDX     #10

loc_4B17:                               ; CODE XREF: RNK__DISPLAY_RANK+C↓j
                LDA     RNKI,X          ; "RANK: CLASS"
                STA     SC_STATUS_LINE.line_0.fuel_digit_100,X
                DEX
                BPL     loc_4B17
                JSR     CLCSC__READ_SCORE_VALUE ; Read score from screen memory digits (range: 000-199 in tenths)
                LDA     RTCLOK+1        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                SEC
                SBC     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                BCS     _30
                LDX     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                BEQ     _1
                DEC     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                BNE     WORST

_30:                                    ; CODE XREF: RNK__DISPLAY_RANK+16↑j
                STA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                LDA     RTCLOK          ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                BNE     WORST1
                LDA     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                ASL     A
                ASL     A
                CLC
                ADC     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                ASL     A
                ASL     A
                STA     TEMP_B0
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                SEC
                SBC     TEMP_B0
                BCC     _1
                CMP     #200
                BCS     _10
                CMP     #160
                BCS     _9
                PHA
                JSR     SQLD__PRINT_SQUADRON_LEADER ; Print "SQUADRON LEADER" to screen
                PLA
                CMP     #120
                BCS     _8
                CMP     #100
                BCS     _7
                CMP     #80
                BCS     _6
                CMP     #60
                BCS     _5
                PHA
                JSR     BLUE__PRINT_RANK_CLASS ; Print "RANK: CLASS" to screen
                JSR     BLMX__PRINT_BLUE_MAX ; Print "BLUE MAX" to screen
                PLA
                CMP     #40
                BCS     _4
                CMP     #20
                BCS     _3
                LDA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                BEQ     _3
                LDA     #_2|_C_LBLUE

_2:                                     ; CODE XREF: RNK__DISPLAY_RANK+7F↓j
                                        ; RNK__DISPLAY_RANK+83↓j ...
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: RNK__DISPLAY_RANK+1A↑j
                                        ; RNK__DISPLAY_RANK+38↑j
                JSR     BLUE__PRINT_RANK_CLASS ; Print "RANK: CLASS" to screen
                JSR     BLMX__PRINT_BLUE_MAX ; Print "BLUE MAX" to screen
                LDA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                BEQ     _3
                CMP     #GAME_LEVEL_INTERMEDIATE
                BEQ     _2
                LDA     #_1|_C_LBLUE
                BNE     _2

_9:                                     ; CODE XREF: RNK__DISPLAY_RANK+40↑j
                JSR     FTG             ; Print "FLYING TIGER" to screen
                LDA     #_1|_C_BLACK
                BNE     _2

_10:                                    ; CODE XREF: RNK__DISPLAY_RANK+3C↑j
                JSR     FTG             ; Print "FLYING TIGER" to screen
                LDA     #_2|_C_BLACK
                BNE     _2

_8:                                     ; CODE XREF: RNK__DISPLAY_RANK+49↑j
                LDA     #_4|_C_BLACK
                BNE     _2

_7:                                     ; CODE XREF: RNK__DISPLAY_RANK+4D↑j
                LDA     #_3|_C_BLACK
                BNE     _2

_6:                                     ; CODE XREF: RNK__DISPLAY_RANK+51↑j
                LDA     #_2|_C_BLACK
                BNE     _2

_5:                                     ; CODE XREF: RNK__DISPLAY_RANK+55↑j
                LDA     #_1|_C_BLACK
                BNE     _2

_4:                                     ; CODE XREF: RNK__DISPLAY_RANK+61↑j
                LDA     #_4|_C_LBLUE
                BNE     _2

_3:                                     ; CODE XREF: RNK__DISPLAY_RANK+65↑j
                                        ; RNK__DISPLAY_RANK+6A↑j ...
                LDA     #_3|_C_LBLUE
                BNE     _2
; End of function RNK__DISPLAY_RANK


; =============== S U B R O U T I N E =======================================

; Print "BLUE MAX" to screen

BLMX__PRINT_BLUE_MAX:                   ; CODE XREF: RNK__DISPLAY_RANK+5B↑p
                                        ; RNK__DISPLAY_RANK+75↑p
                LDX     #15

_1:                                     ; CODE XREF: BLMX__PRINT_BLUE_MAX+B↓j
                LDA     DEMI-1,X        ; "BLUE MAX" / "  BY BOB POLIN" / "    (C)SYNSOFT 1983"
                ORA     #_SPACE|_C_LBLUE
                STA     SC_STATUS_LINE.line_1.field_6,X
                DEX
                BNE     _1
                STX     SC_STATUS_LINE.line_1.field_6
                STX     SC_STATUS_LINE.line_1.field_5
                STX     SC_STATUS_LINE.line_1.field_4
                RTS
; End of function BLMX__PRINT_BLUE_MAX


; =============== S U B R O U T I N E =======================================

; Print "RANK: CLASS" to screen

BLUE__PRINT_RANK_CLASS:                 ; CODE XREF: RNK__DISPLAY_RANK+58↑p
                                        ; RNK__DISPLAY_RANK:_1↑p
                LDX     #10

_1:                                     ; CODE XREF: BLUE__PRINT_RANK_CLASS+B↓j
                LDA     RNKI,X          ; "RANK: CLASS"
                ORA     #_SPACE|_C_BLUE
                STA     SC_STATUS_LINE.line_0.fuel_digit_100,X
                DEX
                BPL     _1
                RTS
; End of function BLUE__PRINT_RANK_CLASS


; =============== S U B R O U T I N E =======================================

; Print "SQUADRON LEADER" to screen

SQLD__PRINT_SQUADRON_LEADER:            ; CODE XREF: RNK__DISPLAY_RANK+43↑p
                LDX     #14

_1:                                     ; CODE XREF: SQLD__PRINT_SQUADRON_LEADER+9↓j
                LDA     SQLDI,X         ; "SQUADRON LEADER"
                STA     SC_STATUS_LINE.line_1.field_4,X
                DEX
                BPL     _1
                RTS
; End of function SQLD__PRINT_SQUADRON_LEADER


; =============== S U B R O U T I N E =======================================

; Erase rank text lines

AFH__ERASE_RANK_DISPLAY:                ; CODE XREF: RNK__DISPLAY_RANK↑p
                                        ; RNKX__PRINT_RANK_CLASS↓p
                LDA     #0
                LDX     #43

_1:                                     ; CODE XREF: AFH__ERASE_RANK_DISPLAY+8↓j
                STA     SC_STATUS_LINE.line_0.fuel_F,X
                DEX
                BPL     _1
                STA     SC_STATUS_LINE.line_2.landing_flag ; "L" character
                RTS
; End of function AFH__ERASE_RANK_DISPLAY


; =============== S U B R O U T I N E =======================================

; Print Rank Class on screen

RNKX__PRINT_RANK_CLASS:                 ; CODE XREF: TURN:_7↑p
                JSR     AFH__ERASE_RANK_DISPLAY ; Erase rank text lines
                LDX     #10

_3:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+F↓j
                LDA     RNKI,X          ; "RANK: CLASS"
                CLC
                ADC     #_SPACE|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.fuel_digit_100,X
                DEX
                BPL     _3

                JSR     CLCSC__READ_SCORE_VALUE ; Read score from screen memory digits (range: 000-199 in tenths)
                LDA     DISABLE_MAP_GENERATION ; !=0 Disable generation of new map data. Reset during VBL scrolling
                CMP     #2              ; More than 20 points?
                BCS     _88
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BEQ     _88
                LDA     #_1|_C_ORANGE
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                LDX     #15

_2:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+2D↓j
                LDA     KMKZI,X         ; "KAMIKAZE TRAINEE"
                STA     SC_STATUS_LINE.line_1.field_4,X
                DEX
                BPL     _2
                RTS
; ---------------------------------------------------------------------------

_88:                                    ; CODE XREF: RNKX__PRINT_RANK_CLASS+18↑j
                                        ; RNKX__PRINT_RANK_CLASS+1D↑j
                LDA     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                ASL     A
                CLC
                ADC     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                ASL     A
                ASL     A
                ADC     DISABLE_MAP_GENERATION ; Score = Score + (level * 4) + (gravity * 8)
                ADC     PRIMARY_TARGETS_HIT ; Number of primary targets hit
                BCC     _1

_4:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+4C↓j
                JSR     RD4__PRINT_4    ; Print "4" for class to screen
                JMP     FTG             ; Print "FLYING TIGER" to screen
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+3F↑j
                LDX     GAME_COMPLETION_MASK
                CPX     #FINAL_TARGET_ALL
                BEQ     _4
                CMP     #3
                BCC     _5
                CMP     #6
                BCC     _6
                CMP     #10
                BCC     _7
                CMP     #20
                BCC     _8
                CMP     #33
                BCC     _9
                CMP     #48
                BCC     _10
                CMP     #65
                BCC     _11
                JSR     RD1__PRINT_1    ; Print "1" for class to screen
                BNE     ACDT            ; Print "AIR CADET" to screen

_5:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+50↑j
                JSR     RD4__PRINT_4    ; Print "4" for class to screen
                BNE     RSW             ; Print "RUNWAY SWEEPER" to screen

_6:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+54↑j
                JSR     RD3__PRINT_3    ; Print "3" for class to screen
                BNE     RSW             ; Print "RUNWAY SWEEPER" to screen

_7:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+58↑j
                JSR     RD2__PRINT_2    ; Print "2" for class to screen
                BNE     RSW             ; Print "RUNWAY SWEEPER" to screen

_8:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+5C↑j
                JSR     RD1__PRINT_1    ; Print "1" for class to screen
                BNE     RSW             ; Print "RUNWAY SWEEPER" to screen

_9:                                     ; CODE XREF: RNKX__PRINT_RANK_CLASS+60↑j
                JSR     RD4__PRINT_4    ; Print "4" for class to screen
                BNE     ACDT            ; Print "AIR CADET" to screen

_10:                                    ; CODE XREF: RNKX__PRINT_RANK_CLASS+64↑j
                JSR     RD3__PRINT_3    ; Print "3" for class to screen
                BNE     ACDT            ; Print "AIR CADET" to screen

_11:                                    ; CODE XREF: RNKX__PRINT_RANK_CLASS+68↑j
                JSR     RD2__PRINT_2    ; Print "2" for class to screen

ACDT:                                   ; CODE XREF: RNKX__PRINT_RANK_CLASS+6D↑j
                                        ; RNKX__PRINT_RANK_CLASS+86↑j ...
                LDX     #8              ; Print "AIR CADET" to screen

_1_0:                                   ; CODE XREF: RNKX__PRINT_RANK_CLASS+99↓j
                LDA     ACDI,X          ; "AIR CADET"
                STA     SC_STATUS_LINE.line_1.speed_digit_100,X
                DEX
                BPL     _1_0
                RTS
; ---------------------------------------------------------------------------

RSW:                                    ; CODE XREF: RNKX__PRINT_RANK_CLASS+72↑j
                                        ; RNKX__PRINT_RANK_CLASS+77↑j ...
                LDX     #13             ; Print "RUNWAY SWEEPER" to screen

_1_1:                                   ; CODE XREF: RNKX__PRINT_RANK_CLASS+A5↓j
                LDA     RSWI,X          ; "RUNWAY SWEEPER"
                STA     SC_STATUS_LINE.line_1.field_4,X
                DEX
                BPL     _1_1
                RTS
; ---------------------------------------------------------------------------

FTG:                                    ; CODE XREF: RNK__DISPLAY_RANK:WORST↑p
                                        ; RNK__DISPLAY_RANK:WORST1↑p ...
                LDX     #11             ; Print "FLYING TIGER" to screen

_1_2:                                   ; CODE XREF: RNKX__PRINT_RANK_CLASS+B1↓j
                LDA     FTGI,X          ; "FLYING TIGER"
                STA     SC_STATUS_LINE.line_1.field_5,X
                DEX
                BPL     _1_2
                RTS
; End of function RNKX__PRINT_RANK_CLASS


; =============== S U B R O U T I N E =======================================

; Print "1" for class to screen

RD1__PRINT_1:                           ; CODE XREF: RNKX__PRINT_RANK_CLASS+6A↑p
                                        ; RNKX__PRINT_RANK_CLASS:_8↑p
                LDA     #_1|_C_ORANGE
                BNE     BAA
; End of function RD1__PRINT_1


; =============== S U B R O U T I N E =======================================

; Print "2" for class to screen

RD2__PRINT_2:                           ; CODE XREF: RNKX__PRINT_RANK_CLASS:_7↑p
                                        ; RNKX__PRINT_RANK_CLASS:_11↑p
                LDA     #_2|_C_ORANGE
                BNE     BAA
; End of function RD2__PRINT_2


; =============== S U B R O U T I N E =======================================

; Print "3" for class to screen

RD3__PRINT_3:                           ; CODE XREF: RNKX__PRINT_RANK_CLASS:_6↑p
                                        ; RNKX__PRINT_RANK_CLASS:_10↑p
                LDA     #_3|_C_ORANGE
                BNE     BAA
; End of function RD3__PRINT_3


; =============== S U B R O U T I N E =======================================

; Print "4" for class to screen

RD4__PRINT_4:                           ; CODE XREF: RNKX__PRINT_RANK_CLASS:_4↑p
                                        ; RNKX__PRINT_RANK_CLASS:_5↑p ...
                LDA     #_4|_C_ORANGE

BAA:                                    ; CODE XREF: RD1__PRINT_1+2↑j
                                        ; RD2__PRINT_2+2↑j ...
                STA     SC_STATUS_LINE.line_0.decreased_maneuverability ; "M" character
                RTS
; End of function RD4__PRINT_4


; =============== S U B R O U T I N E =======================================

; Clear Player-Missile Graphics

CLRPM__CLEAR_PMGRAPHICS:                ; CODE XREF: RESET+106↑p
                                        ; CNSL__CONSOLE+2C↓p
                LDA     #<MISSLE
                STA     byte_FA
                LDA     #>MISSLE
                STA     CURRENT_TILE_ROW_PTR
                LDX     #5
                LDA     #0

_1:                                     ; CODE XREF: CLRPM__CLEAR_PMGRAPHICS+16↓j
                LDY     #0

_2:                                     ; CODE XREF: CLRPM__CLEAR_PMGRAPHICS+11↓j
                STA     (byte_FA),Y
                DEY
                BNE     _2
                INC     CURRENT_TILE_ROW_PTR
                DEX
                BNE     _1
                RTS
; End of function CLRPM__CLEAR_PMGRAPHICS


; =============== S U B R O U T I N E =======================================

; Reset deferred vertial blank IRQ

XSCRL__RESET_VBL:                       ; CODE XREF: CNSL__CONSOLE:_1↓p
                                        ; CNSL__CONSOLE+37↓p
                LDA     #SETVBV_VVBLKD
                LDX     #>XITVBV        ; EXIT VERTICAL BLANK CALCULATIONS
                LDY     #<XITVBV        ; EXIT VERTICAL BLANK CALCULATIONS
                JSR     SETVBV          ; SET SYSTEM TIMERS ROUTINE
                LDA     #$C0
                STA     NMIEN           ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                RTS
; End of function XSCRL__RESET_VBL


; =============== S U B R O U T I N E =======================================

; Sound: stop all audio output

QUIET__STOP_ALL_SOUNDS:                 ; CODE XREF: RESET+18B↑p
                                        ; CNSL__CONSOLE+34↓p
                LDA     #0
                STA     AUDC1           ; Audio 1 Channel Control Register
                STA     AUDC2           ; Audio 2 Channel Control Register
                STA     AUDC3           ; Audio 3 Channel Control Register
                STA     AUDC4           ; Audio 4 Channel Control Register
                RTS
; End of function QUIET__STOP_ALL_SOUNDS


; =============== S U B R O U T I N E =======================================

; Console for option selection and to start the game

CNSL__CONSOLE:                          ; CODE XREF: EB:AFY↑p EB+A1↑p ...
                LDA     CONSOL          ; Console Switch Port
                CMP     #110b
                BEQ     _1              ; START key pressed
                CMP     #11b
                BEQ     _5              ; OPTION key pressed
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: CNSL__CONSOLE+5↑j
                JSR     XSCRL__RESET_VBL ; START key pressed
                PLA
                PLA
                LDA     #0
                STA     CDTMV1          ; COUNT DOWN TIMER 1 - used for music playback
                STA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                LDA     #COLOR_INTENSITY_14|COLOR_LIGHT_BLUE
                STA     DL_IRQ_COLPF1   ; COLPF1 color set in the DL IRQ
                JMP     START
; ---------------------------------------------------------------------------

_5:                                     ; CODE XREF: CNSL__CONSOLE+9↑j
                STA     MENU_LAST_CONSOL_6E9 ; OPTION key pressed
                LDA     #0
                STA     SDMCTL          ; SAVE DMACTL REGISTER
                STA     CDTMV1          ; COUNT DOWN TIMER 1 - used for music playback
                JSR     CLRPM__CLEAR_PMGRAPHICS ; Clear Player-Missile Graphics
                LDA     #$E0
                STA     CHBAS           ; Select the ROM font
                JSR     QUIET__STOP_ALL_SOUNDS ; Sound: stop all audio output
                JSR     XSCRL__RESET_VBL ; Reset deferred vertial blank IRQ
                LDX     #0
                LDA     #_SPACE|_C_BLACK
                STA     MENU_OPTION_INDEX_6E8 ; MENU: currently selected option

_2:                                     ; CODE XREF: CNSL__CONSOLE+48↓j
                STA     SC-1,X          ; Screen memory
                STA     byte_64C3+5,X
                DEX
                BNE     _2
                LDX     #17

_6:                                     ; CODE XREF: CNSL__CONSOLE+53↓j
                LDA     OPTIM,X         ; Display List for the menu
                STA     DL,X
                DEX
                BPL     _6
                LDA     #>SC            ; Screen memory
                STA     DL+2
                LDA     #<SC            ; Screen memory
                STA     DL+3
                LDA     #>DL
                STA     DL+$11
                STA     SDLSTL          ; SAVE DISPLAY LIST LOW BYTE
                LDA     #<DL
                STA     DL+$12
                STA     SDLSTH          ; SAVE DISPLAY LIST HI BYTE
                LDA     #>DLIR1__DLIST_DURING_MENU ; Display List IRQ during the menu
                STA     VDSLST          ; DISPLAY LIST NMI VECTOR
                LDA     #<DLIR1__DLIST_DURING_MENU ; Display List IRQ during the menu
                STA     VDSLST+1        ; DISPLAY LIST NMI VECTOR
                LDA     #COLOR_INTENSITY_0|COLOR_RED_PINK_PURPLE
                STA     COLOR4
                LDA     #COLOR_INTENSITY_14|COLOR_GRAY
                STA     COLOR0          ; COLOR 0
                LDA     #COLOR_INTENSITY_8|COLOR_PURPLE_BLUE
                STA     COLOR1
                LDX     #6

_95:                                    ; CODE XREF: CNSL__CONSOLE+91↓j
                LDA     OPTI,X          ; "OPTIONS"
                STA     SC+$2E,X        ; Screen memory
                DEX
                BPL     _95
                LDA     #$3E ; '>'
                STA     SDMCTL          ; SAVE DMACTL REGISTER

                LDX     #11
                LDA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                BEQ     _7
                CMP     #GAME_LEVEL_INTERMEDIATE
                BEQ     _14
                JSR     VET__PRINT_ADVANCED ; Print "ADVANCED    " to screen
                JMP     _8
; ---------------------------------------------------------------------------

_7:                                     ; CODE XREF: CNSL__CONSOLE+9D↑j
                JSR     NOV__PRINT_NOVICE ; Print "NOVICE      " to screen
                JMP     _8
; ---------------------------------------------------------------------------

_14:                                    ; CODE XREF: CNSL__CONSOLE+A1↑j
                JSR     INT__PRINT_INTERMEDIATE ; Print "INTERMEDIATE" to screen

_8:                                     ; CODE XREF: CNSL__CONSOLE+A6↑j
                                        ; CNSL__CONSOLE+AC↑j
                LDX     #11
                LDA     DIRECTION_A
                CMP     #13
                BNE     _9
                JSR     NOR__PRINT_NORMAL ; Print "NORMAL CTRL " to screen
                JMP     _10
; ---------------------------------------------------------------------------

_9:                                     ; CODE XREF: CNSL__CONSOLE+B9↑j
                JSR     RVS__PRINT_REVERSED_CTRL ; Print "REVERSED CTRL" to screen

_10:                                    ; CODE XREF: CNSL__CONSOLE+BE↑j
                LDX     #9
                LDA     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                BNE     _11
                JSR     NGRV__PRINT_NO_GRAVITY ; Print "NO GRAVITY" to screen
                JMP     _12
; ---------------------------------------------------------------------------

_11:                                    ; CODE XREF: CNSL__CONSOLE+C9↑j
                JSR     GRV__PRINT_GRAVITY ; Print "GRAVITY   " to screen

_12:                                    ; CODE XREF: CNSL__CONSOLE+CE↑j
                LDA     #_ASTERIX|_C_BLUE
                STA     byte_6441+$39

_13:                                    ; CODE XREF: CNSL__CONSOLE+DC↓j
                JSR     MENU__CHECK_KEYS ; Check for keys during the options menu
                JMP     _13             ; Endless menu selection loop. Exit via stack cleanup and JMP
; End of function CNSL__CONSOLE


; =============== S U B R O U T I N E =======================================

; Print "NOVICE      " to screen

NOV__PRINT_NOVICE:                      ; CODE XREF: CNSL__CONSOLE:_7↑p
                                        ; NOV__PRINT_NOVICE+7↓j ...
                LDA     NOVI,X          ; "NOVICE      "
                STA     byte_6441+$3B,X
                DEX
                BPL     NOV__PRINT_NOVICE ; Print "NOVICE      " to screen
                RTS
; End of function NOV__PRINT_NOVICE


; =============== S U B R O U T I N E =======================================

; Print "ADVANCED    " to screen

VET__PRINT_ADVANCED:                    ; CODE XREF: CNSL__CONSOLE+A3↑p
                                        ; VET__PRINT_ADVANCED+7↓j ...
                LDA     VETI,X          ; "ADVANCED    "
                STA     byte_6441+$3B,X
                DEX
                BPL     VET__PRINT_ADVANCED ; Print "ADVANCED    " to screen
                RTS
; End of function VET__PRINT_ADVANCED


; =============== S U B R O U T I N E =======================================

; Print "INTERMEDIATE" to screen

INT__PRINT_INTERMEDIATE:                ; CODE XREF: CNSL__CONSOLE:_14↑p
                                        ; INT__PRINT_INTERMEDIATE+7↓j ...
                LDA     INTI,X          ; "INTERMEDIATE"
                STA     byte_6441+$3B,X
                DEX
                BPL     INT__PRINT_INTERMEDIATE ; Print "INTERMEDIATE" to screen
                RTS
; End of function INT__PRINT_INTERMEDIATE


; =============== S U B R O U T I N E =======================================

; Print "NORMAL CTRL " to screen

NOR__PRINT_NORMAL:                      ; CODE XREF: CNSL__CONSOLE+BB↑p
                                        ; NOR__PRINT_NORMAL+7↓j ...
                LDA     NORI,X          ; "NORMAL CTRL "
                STA     byte_6482+$36,X
                DEX
                BPL     NOR__PRINT_NORMAL ; Print "NORMAL CTRL " to screen
                RTS
; End of function NOR__PRINT_NORMAL


; =============== S U B R O U T I N E =======================================

; Print "REVERSED CTRL" to screen

RVS__PRINT_REVERSED_CTRL:               ; CODE XREF: CNSL__CONSOLE:_9↑p
                                        ; RVS__PRINT_REVERSED_CTRL+7↓j ...
                LDA     RVSI,X          ; "REVERSE CTRL"
                STA     byte_6482+$36,X
                DEX
                BPL     RVS__PRINT_REVERSED_CTRL ; Print "REVERSED CTRL" to screen
                RTS
; End of function RVS__PRINT_REVERSED_CTRL


; =============== S U B R O U T I N E =======================================

; Print "NO GRAVITY" to screen

NGRV__PRINT_NO_GRAVITY:                 ; CODE XREF: CNSL__CONSOLE+CB↑p
                                        ; NGRV__PRINT_NO_GRAVITY+7↓j ...
                LDA     NGRVI,X         ; "NO GRAVITY   "
                STA     byte_64C3+$31,X
                DEX
                BPL     NGRV__PRINT_NO_GRAVITY ; Print "NO GRAVITY" to screen
                RTS
; End of function NGRV__PRINT_NO_GRAVITY


; =============== S U B R O U T I N E =======================================

; Print "GRAVITY   " to screen

GRV__PRINT_GRAVITY:                     ; CODE XREF: CNSL__CONSOLE:_11↑p
                                        ; GRV__PRINT_GRAVITY+7↓j ...
                LDA     NGRVI+3,X       ; "NO GRAVITY   "
                STA     byte_64C3+$31,X
                DEX
                BPL     GRV__PRINT_GRAVITY ; Print "GRAVITY   " to screen
                RTS
; End of function GRV__PRINT_GRAVITY


; =============== S U B R O U T I N E =======================================

; Check for keys during the options menu

MENU__CHECK_KEYS:                       ; CODE XREF: CNSL__CONSOLE:_13↑p
                LDA     CONSOL          ; Console Switch Port
                CMP     MENU_LAST_CONSOL_6E9 ; Last value of CONSOL in the MENU selection
                BNE     _1
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: MENU__CHECK_KEYS+6↑j
                STA     MENU_LAST_CONSOL_6E9 ; Last value of CONSOL in the MENU selection
                CMP     #11b
                BEQ     _2              ; OPTION key pressed
                CMP     #110b
                BEQ     _3              ; START key pressed
                CMP     #101b
                BEQ     _6              ; SELECT key pressed
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: MENU__CHECK_KEYS+12↑j
                PLA                     ; START key pressed
                PLA                     ; Pop return addresses from stack
                PLA
                PLA
                LDA     #0
                STA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                LDA     #COLOR_INTENSITY_14|COLOR_LIGHT_BLUE
                STA     DL_IRQ_COLPF1   ; COLPF1 color set in the DL IRQ
                JMP     START
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: MENU__CHECK_KEYS+E↑j
                LDA     MENU_OPTION_INDEX_6E8 ; OPTION key pressed
                BEQ     _4
                CMP     #1
                BEQ     _5
                LDA     #0
                STA     MENU_OPTION_INDEX_6E8 ; MENU: currently selected option
                STA     byte_64C3+$2F
                LDA     #_ASTERIX|_C_BLUE
                STA     byte_6441+$39
                RTS
; ---------------------------------------------------------------------------

_4:                                     ; CODE XREF: MENU__CHECK_KEYS+2D↑j
                INC     MENU_OPTION_INDEX_6E8 ; MENU: currently selected option
                LDA     #_SPACE|_C_BLACK
                STA     byte_6441+$39
                LDA     #_ASTERIX|_C_BLUE
                STA     byte_6482+$34
                RTS
; ---------------------------------------------------------------------------

_5:                                     ; CODE XREF: MENU__CHECK_KEYS+31↑j
                INC     MENU_OPTION_INDEX_6E8 ; MENU: currently selected option
                LDA     #_SPACE|_C_BLACK
                STA     byte_6482+$34
                LDA     #_ASTERIX|_C_BLUE
                STA     byte_64C3+$2F
                RTS
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: MENU__CHECK_KEYS+16↑j
                LDA     MENU_OPTION_INDEX_6E8 ; SELECT key pressed
                BEQ     _7              ; Option 0 was selected
                CMP     #1
                BEQ     _8              ; Option 1 was selected
                LDX     #9
                LDA     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                BEQ     _9
                DEC     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                JMP     NGRV__PRINT_NO_GRAVITY ; Print "NO GRAVITY" to screen
; ---------------------------------------------------------------------------

_9:                                     ; CODE XREF: MENU__CHECK_KEYS+6B↑j
                INC     MODE_GRAVITY_FLAG ; Gravity? 0=No, 1=Yes
                JMP     GRV__PRINT_GRAVITY ; Print "GRAVITY   " to screen
; ---------------------------------------------------------------------------

_7:                                     ; CODE XREF: MENU__CHECK_KEYS+60↑j
                LDX     #11             ; Option 0 was selected
                LDA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                BEQ     _10
                CMP     #GAME_LEVEL_INTERMEDIATE
                BEQ     _15
                LDA     #0
                STA     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                JMP     NOV__PRINT_NOVICE ; Print "NOVICE      " to screen
; ---------------------------------------------------------------------------

_10:                                    ; CODE XREF: MENU__CHECK_KEYS+7E↑j
                INC     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                JMP     INT__PRINT_INTERMEDIATE ; Print "INTERMEDIATE" to screen
; ---------------------------------------------------------------------------

_15:                                    ; CODE XREF: MENU__CHECK_KEYS+82↑j
                INC     MODE_LEVEL      ; Level: 0=Novice, 1=Intermediate, 2=Advanced
                JMP     VET__PRINT_ADVANCED ; Print "ADVANCED    " to screen
; ---------------------------------------------------------------------------

_8:                                     ; CODE XREF: MENU__CHECK_KEYS+64↑j
                LDX     #11             ; Option 1 was selected
                LDA     DIRECTION_A
                LDY     DIRECTION_B
                STA     DIRECTION_B
                STY     DIRECTION_A
                CMP     #JOYSTICK_DOWN
                BEQ     _12
                JMP     NOR__PRINT_NORMAL ; Print "NORMAL CTRL " to screen
; ---------------------------------------------------------------------------

_12:                                    ; CODE XREF: MENU__CHECK_KEYS+A8↑j
                JMP     RVS__PRINT_REVERSED_CTRL ; Print "REVERSED CTRL" to screen
; End of function MENU__CHECK_KEYS


; =============== S U B R O U T I N E =======================================

; Demo Bomb release

DEMO__DEMO_TRIGGER:                     ; CODE XREF: COMMON+A↑p
                LDA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BEQ     _1              ; => Return
                JSR     DJOY__DEMO_JOYSTICK_INPUT ; Get Demo Joystick Movement
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_2|_C_BLUE
                BCC     loc_4EE1        ; button is not prssed
                JSR     DBMB__DEMO_BOMB_RELEASE ; Get Demo Bomb Release

_1:                                     ; CODE XREF: DEMO__DEMO_TRIGGER+3↑j
                RTS                     ; => Return
; ---------------------------------------------------------------------------

loc_4EE1:                               ; CODE XREF: DEMO__DEMO_TRIGGER+D↑j
                LDA     #1              ; button is not prssed
                STA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                RTS
; End of function DEMO__DEMO_TRIGGER


; =============== S U B R O U T I N E =======================================

; Get Demo Bomb Release

DBMB__DEMO_BOMB_RELEASE:                ; CODE XREF: DEMO__DEMO_TRIGGER+F↑p
                LDA     byte_FA
                BEQ     _1
                LDA     #1              ; button is not prssed
                STA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                RTS
; ---------------------------------------------------------------------------

_1:                                     ; CODE XREF: DBMB__DEMO_BOMB_RELEASE+2↑j
                LDA     P0PF_HPOSM0     ; Player Machine Gun Bullet (Horizontal Position)
                CMP     #100b
                BEQ     _9
                CMP     #1000b
                BNE     _2              ; button is pressed

_9:                                     ; CODE XREF: DBMB__DEMO_BOMB_RELEASE+E↑j
                LDA     DIRECTION_A
                STA     STICK0_COPY     ; JOYSTICK 0 copy
                LDA     #0              ; button is pressed
                STA     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: DBMB__DEMO_BOMB_RELEASE+12↑j
                LDX     #0              ; button is pressed
                LDA     DL_IRQ_BACKGROUND_COLOR ; Background color set in the DL IRQ
                BNE     _3
                INX                     ; button is not pressed, if color is BLACK

_3:                                     ; CODE XREF: DBMB__DEMO_BOMB_RELEASE+23↑j
                STX     STRIG0_COPY     ; 0=: joystick button is pressed, !=0: button is not pressed
                RTS
; End of function DBMB__DEMO_BOMB_RELEASE


; =============== S U B R O U T I N E =======================================

; Get Demo Joystick Movement

DJOY__DEMO_JOYSTICK_INPUT:              ; CODE XREF: DEMO__DEMO_TRIGGER+5↑p
                JSR     DFLSH__DEMO_FLASH_BLUEMAX ; Demo: Pulsate "BLUE MAX" in blue
                LDA     IS_DEMO_MODE    ; 0=Demo Mode active
                BEQ     _10
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #25
                BCS     _2
                JSR     UP              ; Move Plane up, if possible
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+E↑j
                LDA     DEMO_STICK0     ; Demo mode: joystick movement
                CMP     #JOYSTICK_NOTHING
                BEQ     _3
                LDA     DEMO_STICK0     ; Demo mode: joystick movement
                CMP     DIRECTION_A
                BNE     _15
                LDA     PLANE_VERT_SHADOW_POS ; Vertical Position of the Plane Shadow
                SBC     PLANE_VERT_POS  ; Vertical Position of the Plane
                CMP     #27
                BCC     _10

_15:                                    ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+21↑j
                DEC     DEMO_JOY_TIMER  ; Demo mode: timer for joystick input
                BNE     _6

_10:                                    ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+6↑j
                                        ; DJOY__DEMO_JOYSTICK_INPUT+29↑j
                LDA     #JOYSTICK_NOTHING
                STA     STICK0_COPY     ; JOYSTICK 0 copy
                STA     DEMO_STICK0     ; Demo mode: joystick movement
                RTS
; ---------------------------------------------------------------------------

_6:                                     ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+2E↑j
                LDA     DEMO_STICK0     ; Demo mode: joystick movement
                STA     STICK0_COPY     ; JOYSTICK 0 copy
                RTS
; ---------------------------------------------------------------------------

_3:                                     ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+19↑j
                LDA     RANDOM          ; Random Number Generator
                AND     #111111b
                BEQ     _31
                LDA     #JOYSTICK_NOTHING
                BNE     _32

_31:                                    ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+43↑j
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                AND     #11111b
                ADC     #10
                STA     DEMO_JOY_TIMER  ; Demo mode: timer for joystick input

_5:                                     ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+59↓j
                                        ; DJOY__DEMO_JOYSTICK_INPUT+5D↓j
                LDA     RANDOM          ; Random Number Generator
                AND     #1111b
                CMP     #JOYSTICK_DOWN_RIGHT
                BCC     _5
                CMP     #JOYSTICK_NOTHING
                BEQ     _5

_32:                                    ; CODE XREF: DJOY__DEMO_JOYSTICK_INPUT+47↑j
                STA     STICK0_COPY     ; JOYSTICK 0 copy
                STA     DEMO_STICK0     ; Demo mode: joystick movement
                RTS
; End of function DJOY__DEMO_JOYSTICK_INPUT


; =============== S U B R O U T I N E =======================================

; Demo: Pulsate "BLUE MAX" in blue

DFLSH__DEMO_FLASH_BLUEMAX:              ; CODE XREF: EB+73↑p EB+A7↑p ...
                LDA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BEQ     _1              ; => Return
                LDA     RTCLOK+2        ; REAL TIME CLOCK (IN 16 MSEC UNITS)
                AND     #1110b
                ADC     #COLOR_INTENSITY_0|COLOR_LIGHT_BLUE
                STA     DL_IRQ_COLPF1   ; COLPF1 color set in the DL IRQ

_1:                                     ; CODE XREF: DFLSH__DEMO_FLASH_BLUEMAX+3↑j
                RTS                     ; => Return
; End of function DFLSH__DEMO_FLASH_BLUEMAX


; =============== S U B R O U T I N E =======================================

; Demo: plane take-off at speed 100

DTKOF__DEMO_TAKE_OFF:                   ; CODE XREF: TAKOF__TAKEOFF_LOOP+18↑p
                LDA     DEMO_IS_ACTIVE  ; 0:normal game play, 1=demo mode active
                BEQ     _1              ; => Return
                JSR     DFLSH__DEMO_FLASH_BLUEMAX ; Demo: Pulsate "BLUE MAX" in blue
                LDA     SC_STATUS_LINE.line_1.speed_digit_100
                CMP     #_1|_C_BLUE     ; Speed 1xx reached?
                BNE     _1              ; => Return
                JSR     UP              ; Move Plane up, if possible
                PLA
                PLA

_1:                                     ; CODE XREF: DTKOF__DEMO_TAKE_OFF+3↑j
                                        ; DTKOF__DEMO_TAKE_OFF+D↑j
                RTS                     ; => Return
; End of function DTKOF__DEMO_TAKE_OFF


; =============== S U B R O U T I N E =======================================

; Sound: Start playing the title music

PLAY_IT:                                ; CODE XREF: EB+6D↑p
                                        ; STOPL:_35↑p
                LDX     #2

_0:                                     ; CODE XREF: PLAY_IT+B↓j
                LDA     #1
                STA     DUR1,X          ; Duration Voice 1
                STA     V_STAT,X        ; Note Status Channel 1-3
                DEX
                BPL     _0
                LDA     #<VOICE_1
                STA     VV1             ; Sound: Voice 1 Music Playback Note Ptr
                LDA     #>VOICE_1
                STA     VV1+1           ; Sound: Voice 1 Music Playback Note Ptr
                LDA     #<VOICE_2
                STA     VV2             ; Sound: Voice 2 Music Playback Note Ptr
                LDA     #>VOICE_2
                STA     VV2+1           ; Sound: Voice 2 Music Playback Note Ptr
                LDA     #<VOICE_3
                STA     VV3             ; Sound: Voice 3 Music Playback Note Ptr
                LDA     #>VOICE_3
                STA     VV3+1           ; Sound: Voice 3 Music Playback Note Ptr
                LDA     #>_1__SOUND_TIMER_IRQ ; Sound: Playback Interrupt via Timer 1
                STA     CDTMA1          ; COUNT DOWN TIMER 1 JSR ADDRESS
                LDA     #<_1__SOUND_TIMER_IRQ ; Sound: Playback Interrupt via Timer 1
                STA     CDTMA1+1        ; COUNT DOWN TIMER 1 JSR ADDRESS
                LDX     #1
                STX     CDTMV1          ; COUNT DOWN TIMER 1 - used for music playback
                DEX
                STX     CDTMV1+1        ; COUNT DOWN TIMER 1 - used for music playback
                RTS
; End of function PLAY_IT


; =============== S U B R O U T I N E =======================================

; Sound: Playback Interrupt via Timer 1

_1__SOUND_TIMER_IRQ:                    ; DATA XREF: PLAY_IT+25↑t
                                        ; PLAY_IT+2A↑t
                PHA
                TXA
                PHA
                TYA
                PHA
                LDA     #3
                STA     SKSTAT          ; Serial Port control Register
                LDA     #0
                STA     AUDCTL          ; Audio Control Register
                JSR     PLAY_NOTE       ; Sound: Play a multichannel notes – call via the IRQ
                LDA     #0
                LDX     #2

_2:                                     ; CODE XREF: _1__SOUND_TIMER_IRQ+1A↓j
                ORA     V_STAT,X        ; Note Status Channel 1-3
                DEX
                BPL     _2
                STA     CDTMV1          ; COUNT DOWN TIMER 1 - used for music playback
                TAX
                BNE     _3
                JSR     STOP_SN         ; Sound: Stop
                STA     SOUND_MUSIC_ACTIVE_6FF ; Sound: Music playback is active, when != 0

_3:                                     ; CODE XREF: _1__SOUND_TIMER_IRQ+20↑j
                PLA
                TAY
                PLA
                TAX
                PLA
                RTS
; End of function _1__SOUND_TIMER_IRQ


; =============== S U B R O U T I N E =======================================

; Sound: Play a multichannel notes – call via the IRQ

PLAY_NOTE:                              ; CODE XREF: _1__SOUND_TIMER_IRQ+F↑p
                LDA     V_STAT          ; Note Status Channel 1-3
                BEQ     D22
                DEC     DUR1            ; DO VOICE 0
                LDA     DUR1            ; Duration Voice 1
                BNE     DD2

                LDY     #0
                STY     TIE
                LDA     (VV1),Y         ; Sound: Voice 1 Music Playback Note Ptr
                CMP     #255
                BNE     _1_0
                LDA     #0
                STA     V_STAT          ; Note Status Channel 1-3
                JMP     D22
; ---------------------------------------------------------------------------

_1_0:                                   ; CODE XREF: PLAY_NOTE+16↑j
                JSR     GET_AUDF        ; Sound: Get Audio Frequency
                STA     AUDF1           ; Audio 1 Frequency Register
                TXA
                BEQ     _2_
                ORA     #1000b          ; VOLUME1

_2_:                                    ; CODE XREF: PLAY_NOTE+27↑j
                STA     VOL1            ; Volume Voice 1
                STA     AUDC1           ; Audio 1 Channel Control Register
                INY
                LDA     (VV1),Y         ; Sound: Voice 1 Music Playback Note Ptr
                BPL     NOTIE
                AND     #1111111b
                LDX     #1
                STX     TIE

NOTIE:                                  ; CODE XREF: PLAY_NOTE+34↑j
                JSR     MULT            ; Sound: Convert Tempo to Duration
                STA     DUR1            ; Duration Voice 1
                LDA     VV1             ; Sound: Voice 1 Music Playback Note Ptr
                CLC
                ADC     #2
                STA     VV1             ; Sound: Voice 1 Music Playback Note Ptr
                LDA     VV1+1           ; Sound: Voice 1 Music Playback Note Ptr
                ADC     #0
                STA     VV1+1           ; Sound: Voice 1 Music Playback Note Ptr
                JMP     D22
; ---------------------------------------------------------------------------

DD2:                                    ; CODE XREF: PLAY_NOTE+B↑j
                CMP     #8
                BCS     D22
                LDA     TIE
                BNE     D22
                LDA     VOL1            ; Volume Voice 1
                AND     #1111b
                BEQ     _1_1
                DEC     VOL1            ; Volume Voice 1
                LDA     VOL1            ; Volume Voice 1

_1_1:                                   ; CODE XREF: PLAY_NOTE+61↑j
                STA     AUDC1           ; Audio 1 Channel Control Register

D22:                                    ; CODE XREF: PLAY_NOTE+3↑j
                                        ; PLAY_NOTE+1D↑j ...
                LDA     V_STAT+1        ; Note Status Channel 1-3
                BEQ     D33
                DEC     DUR2            ; Duration Voice 2
                LDA     DUR2            ; Duration Voice 2
                BNE     DD3
                LDY     #0
                STY     TIE+1
                LDA     (VV2),Y         ; Sound: Voice 2 Music Playback Note Ptr
                CMP     #255
                BNE     _1_2
                LDA     #0
                STA     V_STAT+1        ; Note Status Channel 1-3
                JMP     D33
; ---------------------------------------------------------------------------

_1_2:                                   ; CODE XREF: PLAY_NOTE+82↑j
                JSR     GET_AUDF        ; Sound: Get Audio Frequency
                STA     AUDF2           ; Audio 2 Frequency Register
                TXA
                BEQ     _2__
                ORA     #101b           ; VOLUME2

_2__:                                   ; CODE XREF: PLAY_NOTE+93↑j
                STA     VOL2            ; Volume Voice 2
                STA     AUDC2           ; Audio 2 Channel Control Register
                INY
                LDA     (VV2),Y         ; Sound: Voice 2 Music Playback Note Ptr
                BPL     NOTI2
                AND     #1111111b
                LDX     #1
                STX     TIE+1

NOTI2:                                  ; CODE XREF: PLAY_NOTE+A0↑j
                JSR     MULT            ; Sound: Convert Tempo to Duration
                STA     DUR2            ; Duration Voice 2
                LDA     VV2             ; Sound: Voice 2 Music Playback Note Ptr
                CLC
                ADC     #2
                STA     VV2             ; Sound: Voice 2 Music Playback Note Ptr
                LDA     VV2+1           ; Sound: Voice 2 Music Playback Note Ptr
                ADC     #0
                STA     VV2+1           ; Sound: Voice 2 Music Playback Note Ptr
                JMP     D33
; ---------------------------------------------------------------------------

DD3:                                    ; CODE XREF: PLAY_NOTE+77↑j
                CMP     #4
                BCS     D33
                LDA     TIE+1
                BNE     D33
                LDA     VOL2            ; Volume Voice 2
                BEQ     _1_3
                DEC     VOL2            ; Volume Voice 2
                LDA     VOL2            ; Volume Voice 2

_1_3:                                   ; CODE XREF: PLAY_NOTE+CB↑j
                STA     AUDC2           ; Audio 2 Channel Control Register

D33:                                    ; CODE XREF: PLAY_NOTE+6F↑j
                                        ; PLAY_NOTE+89↑j ...
                LDA     V_STAT+2        ; Note Status Channel 1-3
                BEQ     D44             ; => Return
                DEC     DUR3            ; Duration Voice 3
                LDA     DUR3            ; Duration Voice 3
                BNE     DD4
                LDY     #0
                STY     TIE+2
                LDA     (VV3),Y         ; Sound: Voice 3 Music Playback Note Ptr
                CMP     #255
                BNE     _12
                LDA     #0
                STA     V_STAT+2        ; Note Status Channel 1-3
                JMP     D44             ; => Return
; ---------------------------------------------------------------------------

_12:                                    ; CODE XREF: PLAY_NOTE+EC↑j
                JSR     GET_AUDF        ; Sound: Get Audio Frequency
                STA     AUDF3           ; Audio 3 Frequency Register
                TXA
                BEQ     _2
                ORA     #11b            ; VOLUME3

_2:                                     ; CODE XREF: PLAY_NOTE+FD↑j
                STA     VOL3            ; Volume Voice 3
                STA     AUDC3           ; Audio 3 Channel Control Register
                INY
                LDA     (VV3),Y         ; Sound: Voice 3 Music Playback Note Ptr
                BPL     NOTI3
                AND     #1111111b
                LDX     #1
                STX     TIE+2

NOTI3:                                  ; CODE XREF: PLAY_NOTE+10A↑j
                JSR     MULT            ; Sound: Convert Tempo to Duration
                STA     DUR3            ; Duration Voice 3
                LDA     VV3             ; Sound: Voice 3 Music Playback Note Ptr
                CLC
                ADC     #2
                STA     VV3             ; Sound: Voice 3 Music Playback Note Ptr
                LDA     VV3+1           ; Sound: Voice 3 Music Playback Note Ptr
                ADC     #0
                STA     VV3+1           ; Sound: Voice 3 Music Playback Note Ptr
                JMP     D44             ; => Return
; ---------------------------------------------------------------------------

DD4:                                    ; CODE XREF: PLAY_NOTE+E1↑j
                CMP     #4
                BCS     D44             ; => Return
                LDA     TIE+2
                BNE     D44             ; => Return
                LDA     VOL3            ; Volume Voice 3
                BEQ     _1
                DEC     VOL3            ; Volume Voice 3
                LDA     VOL3            ; Volume Voice 3

_1:                                     ; CODE XREF: PLAY_NOTE+135↑j
                STA     AUDC3           ; Audio 3 Channel Control Register

D44:                                    ; CODE XREF: PLAY_NOTE+D9↑j
                                        ; PLAY_NOTE+F3↑j ...
                RTS                     ; => Return
; End of function PLAY_NOTE


; =============== S U B R O U T I N E =======================================

; Sound: Convert Tempo to Duration

MULT:                                   ; CODE XREF: PLAY_NOTE:NOTIE↑p
                                        ; PLAY_NOTE:NOTI2↑p ...
                TAY
                LSR     A
                STA     TEMP0           ; Playback tempo
                TYA
                LDY     #1
                BEQ     _2              ; => Return

_1:                                     ; CODE XREF: MULT+F↓j
                CLC
                ADC     TEMP0           ; Playback tempo
                DEY
                BNE     _1

_2:                                     ; CODE XREF: MULT+8↑j
                RTS                     ; => Return
; End of function MULT


; =============== S U B R O U T I N E =======================================

; Sound: Get Audio Frequency

GET_AUDF:                               ; CODE XREF: PLAY_NOTE:_1_0↑p
                                        ; PLAY_NOTE:_1_2↑p ...
                PHA
                AND     #1111b
                CMP     #15
                BEQ     _2
                CLC
                ADC     #>NOTE_TABLE
                STA     ADR1            ; Sound: temp addr for sound frequency calculation
                LDA     #<NOTE_TABLE
                ADC     #0
                STA     ADR1+1          ; Sound: temp addr for sound frequency calculation
                PLA
                PHA
                LSR     A
                LSR     A
                LSR     A
                LSR     A
                TAX
                LDA     OCTAVE_OFFSET,X
                CLC
                ADC     ADR1            ; Sound: temp addr for sound frequency calculation
                STA     ADR1            ; Sound: temp addr for sound frequency calculation
                LDA     ADR1+1          ; Sound: temp addr for sound frequency calculation
                ADC     #0
                STA     ADR1+1          ; Sound: temp addr for sound frequency calculation
                LDX     #0
                LDA     (ADR1,X)        ; Sound: temp addr for sound frequency calculation
                STA     TEMP0           ; Playback tempo
                LDX     #$A0
                PLA
                CMP     #66
                BCC     _1
                LDX     #$C0

_1:                                     ; CODE XREF: GET_AUDF+33↑j
                LDA     TEMP0           ; Playback tempo
                RTS
; ---------------------------------------------------------------------------

_2:                                     ; CODE XREF: GET_AUDF+5↑j
                PLA
                LDA     #0
                TAX
                RTS
; End of function GET_AUDF


; =============== S U B R O U T I N E =======================================

; Sound: Stop

STOP_SN:                                ; CODE XREF: RESET:START↑p
                                        ; _1__SOUND_TIMER_IRQ+22↑p
                LDX     #7
                LDA     #0

_1:                                     ; CODE XREF: STOP_SN+8↓j
                STA     AUDF1,X         ; Audio 1 Frequency Register
                DEX
                BPL     _1
                RTS
; End of function STOP_SN

; end of 'GAME'

; Pre-initialized data and variables of the game
; ===========================================================================

; Segment type: Pure data
                ;.segment DATA
                * =  $519D
NOTE_TABLE:     .BYTE   1,  3,  6,  9, $C, $F,$12,$16,$17,$19,$1A,$1C
                .BYTE $1D,$1F,$21,$23,$25,$28,$2A,$2D,$2F,$32,$35,$39
                .BYTE $3C,$40,$44,$48,$4C,$51,$55,$5B,$60,$66,$6C,$72
                .BYTE $79,$80,$88,$90,$99,$A2,$AD,$B6,$C1,$CC,$D9,$E6
                .BYTE $F3,$FF,$6E,$74,$7A,$83,$89,$92,$9B,$A7,$AD,$B9
                .BYTE $C5,$CE,$DD,$E9,$F5,$57,$5B,$61,$66,$6C,$73,$79
                .BYTE $82
OCTAVE_OFFSET:  .BYTE   0, $C,$18,$24,$30,$3C,$48
                                        ; DATA XREF: GET_AUDF+19↑r
; Garbage data (leftover from the assembler) from here on:
                .BYTE   0,  0,$81,$42,$45,$51,$81,$52,$57,  0, $B,$E6,  0,$81,$43,$4D
                .BYTE $50,$81,$23,$31,  0, $B,$EB,  0,$81,$42,$45,$51,$81,$52,$58,  0
                .BYTE  $B,$F0,  0,$81,$43,$4D,$50,$81,$23,$32,  0, $B,$F5,  0,$81,$42
                .BYTE $45,$51,$81,$52,$59,  0,$10,$FA,  0,$81,$4C,$44,$41,$81,$53,$43
                .BYTE $2B,$24,$36,$35,$38,  0, $B,$FF,  0,$81,$42,$4E,$45,$81,$52,$5A
                .BYTE   0, $D,  4,  1,$81,$4C,$44, $D, $A,  0,$2A,$45,$58,$58,$4F,$4E
                .BYTE $2E,$31,$36,  0,$16,$64,  0,$54,$4B,$4F,$53,$50,$44,$81,$49,$4E
                .BYTE $43,$81,$53,$43,$2B,$24,$36,$36,$37,  0,$10,$69,  0,$81,$4C,$44
                .BYTE $41,$81,$53,$43,$2B,$24,$36,$36,$37,  0, $D,$6E,  0,$81,$43,$4D
                .BYTE $50,$81,$23
; The following data contain variables, but are uninitialized
DL:             .BYTE $6A,$C9,$50,$D0,$14,$AD,$4B,$6A,$C9,$50,$D0, $D,$8D,$4D,$6A,$A2,  0,$8E,$3F,  6,$E8,$8E,$43,  6,$60,$A9,$59,$8D,$4D,$6A,$CE,$4C,$6A,$AD,$4C,$6A,$C9,$4F,$F0,  1,$60,$A9,$59,$8D,$4C,$6A,$CE,$4B,$6A,$60,$AD,$4B,$6A,$C9,$53,$D0,$7F,$EE,$E0,  6,$20,$F6,$25,$A9,$E2,$8D,$4F,$6A,$AD
                                        ; DATA XREF: RESET+4D↑w
                                        ; RESET:A_↑t ...
BOTSCREN:       .WORD WORKING_PARTS     ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+5B↑r
                                        ; VBIR__DEFERRED_VBL_DRAW+67↑r
                                        ; # of working part (4): fuel, bomb, maneuverabiity, gun
DL_plus_71:     .BYTE $C9,  4,$B0,$42,$A9,$5A,$85,$F8,$20,$74
                                        ; DATA XREF: RESET+83↑w
                                        ; RESET+8D↑w ...
TOP:            .WORD $2013             ; DATA XREF: RESET+FE↑w
                                        ; VBIR__DEFERRED_VBL_DRAW+8A↑r ...
                                        ; First byte of the screen level memory
BOTM:           .WORD $4786             ; DATA XREF: RESET+F4↑w
                                        ; VBIR__DEFERRED_VBL_DRAW+4A↑r ...
                                        ; Last byte of the screen level memory
BUF:            .WORD $5620             ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+50↑w
                                        ; VBIR__DEFERRED_VBL_DRAW+9B↑r ...
; From here on are initialized data:
P0IMAGE:        .BYTE 10000100b         ; DATA XREF: DRP0:BH↑r
                                        ; PROP:BT↑r ...
                .BYTE  1000100b         ; regular plane (0-9), contrast color (10-12), contrast color (13-15)
                .BYTE 10100010b
                .BYTE  1011000b
                .BYTE   101000b
                .BYTE 10110100b
                .BYTE 11101010b
                .BYTE 11000101b
                .BYTE       10b
                .BYTE         1
                .BYTE 10000000b
                .BYTE  1001000b
                .BYTE 10100010b
                .BYTE 10000100b
                .BYTE  1000100b
                .BYTE 10100000b
P1IMAGE:        .BYTE 10000010b         ; DATA XREF: SHDW_SUB:loc_1367↑r
                                        ; L6:OK↑t ...
                .BYTE  1000110b         ; plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
                .BYTE   101100b
                .BYTE    11000b
                .BYTE   111000b
                .BYTE 11100100b
                .BYTE 11000010b
                .BYTE  1000001b
                .BYTE         0
                .BYTE         0
                .BYTE         0
                .BYTE    11000b
                .BYTE 11101111b
                .BYTE 10110000b
                .BYTE 11111111b
                .BYTE 11000000b
                .BYTE         0
                .BYTE         0
                .BYTE 11000000b
                .BYTE  1000000b
                .BYTE  1100000b
                .BYTE   111000b
                .BYTE   101000b
                .BYTE   111000b
                .BYTE 11101100b
                .BYTE 11000100b
                .BYTE  1000110b
                .BYTE       10b
CARRT:          .BYTE    10000b         ; DATA XREF: DRP23:IV↑t
                .BYTE 10011100b         ; car driving right
                .BYTE 10011100b
                .BYTE 11111100b
                .BYTE 10110100b
CARLT:          .BYTE   100000b         ; DATA XREF: DRP23:IW↑t
                .BYTE 11100100b         ; car driving left
                .BYTE 11100100b
                .BYTE 11111100b
                .BYTE 10110100b
TYRRT:          .BYTE  1100000b         ; DATA XREF: DRP23+68↑t
                .BYTE  1100000b         ; car tyres driving right
                .BYTE         0
                .BYTE  1001000b
                .BYTE  1001000b
TYRLT:          .BYTE    11000b         ; DATA XREF: DRP23+8F↑t
                .BYTE    11000b         ; car tyres driving left
                .BYTE         0
                .BYTE  1001000b
                .BYTE  1001000b
TRRT:           .BYTE 11111100b         ; DATA XREF: DRP23:KA↑t
                .BYTE 11111100b         ; truck driving right
                .BYTE       10b
                .BYTE 11111111b
                .BYTE       10b
                .BYTE 10111101b
TYRTRR:         .BYTE         0         ; DATA XREF: DRP23+123↑t
                .BYTE 11111100b         ; truck tyres driving right
                .BYTE         0
                .BYTE 11111100b
                .BYTE  1000010b
                .BYTE  1000010b
TRLT:           .BYTE   111111b         ; DATA XREF: DRP23:KB↑t
                .BYTE   111111b         ; truck driving left
                .BYTE  1000000b
                .BYTE 11111111b
                .BYTE 11000000b
                .BYTE 10111101b
TYRTRL:         .BYTE         0         ; DATA XREF: DRP23+14A↑t
                .BYTE   111111b         ; truck tyres driving left
                .BYTE         0
                .BYTE   111111b
                .BYTE  1000010b
                .BYTE  1000010b
SHDW:           .BYTE       10b         ; DATA XREF: PLFWD:KU↑t
                .BYTE  1000011b         ; enemy plane shadow flying towards player
                .BYTE   100111b
                .BYTE    11100b
                .BYTE    11000b
                .BYTE   110100b
                .BYTE  1100010b
                .BYTE  1000001b
                .BYTE         0
                .BYTE         0
PLANE1:         .BYTE 10000100b         ; DATA XREF: PLFWD:loc_21A3↑t
                .BYTE  1000100b         ; enemy plane flying towards player
                .BYTE 10101110b
                .BYTE  1011100b
                .BYTE   101000b
                .BYTE   110100b
                .BYTE     1010b
                .BYTE      101b
                .BYTE       10b
                .BYTE         1
PROPIM:         .BYTE 10110100b         ; DATA XREF: PLFWD:loc_216C↑t
                                        ; PLFWD:loc_217B↑r
                .BYTE     1010b         ; enemy plane propeller animations (0-3 and 4-7)
                .BYTE  1000101b
                .BYTE  1000010b
                .BYTE   110100b
                .BYTE 10001010b
                .BYTE   100101b
                .BYTE       10b

BR1:            .BYTE L_ANTI_AIRCRAFT_BATTERY_A|L_C_1,L_CLIFF_GRAS_A|L_C_0,L_BRIDGE_J|L_C_1,L_BRIDGE_G|L_C_1
                                        ; DATA XREF: DRBR__DRAW_BRIDGE:FT↑t
                .BYTE L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_Q|L_C_1
                .BYTE L_BRIDGE_Q|L_C_1,L_BRIDGE_J|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1
                .BYTE L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_Q|L_C_1
                .BYTE L_BRIDGE_Q|L_C_1,L_BRIDGE_J|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1
                .BYTE L_BRIDGE_G|L_C_1,L_BRIDGE_G|L_C_1,L_BRIDGE_H|L_C_1,L_GRAS_BEFORE_BUILDING|L_C_0
                .BYTE L_ANTI_AIRCRAFT_BATTERY_A|L_C_1
BR2:            .BYTE L_BRIDGE_C|L_C_1,L_BRIDGE_A|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1
                                        ; DATA XREF: DRBR__DRAW_BRIDGE:GA↑t
                .BYTE L_BRIDGE_F|L_C_1,L_BRIDGE_C|L_C_1,L_BRIDGE_C|L_C_1,L_BRIDGE_A|L_C_1
                .BYTE L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1
                .BYTE L_BRIDGE_F|L_C_1,L_BRIDGE_C|L_C_1,L_BRIDGE_C|L_C_1,L_BRIDGE_A|L_C_1
                .BYTE L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_C|L_C_1
                .BYTE L_BRIDGE_D|L_C_1
BR3:            .BYTE L_BRIDGE_P|L_C_1,L_BRIDGE_O|L_C_1,L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1
                                        ; DATA XREF: DRBR__DRAW_BRIDGE+132↑t
                .BYTE L_BRIDGE_B|L_C_1,L_BRIDGE_P|L_C_1,L_BRIDGE_P|L_C_1,L_BRIDGE_O|L_C_1
                .BYTE L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1
                .BYTE L_BRIDGE_B|L_C_1,L_BRIDGE_P|L_C_1,L_BRIDGE_P|L_C_1,L_BRIDGE_O|L_C_1
                .BYTE L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1,L_BRIDGE_B|L_C_1,L_BRIDGE_P|L_C_1
                .BYTE L_BRIDGE_O|L_C_1

XPL1IM:         .BYTE 10001000b         ; DATA XREF: TURN:_10↑r
                                        ; DG:_1↑r
                .BYTE   100001b         ; plane explosion
                .BYTE       10b
                .BYTE  1010010b
                .BYTE   100100b
                .BYTE   101001b
                .BYTE 10011100b
                .BYTE   110010b
                .BYTE   101100b
                .BYTE 11000000b
                .BYTE    10100b
                .BYTE 10000010b
                .BYTE         1

ROADR:          .BYTE L_ROAD_DIAG_LEFT_A|L_C_1,L_ROAD_DIAG_LEFT_B|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_ROAD_DIAG_RIGHT_A|L_C_1,L_ROAD_DIAG_RIGHT_B|L_C_1,L_GRAS_BEFORE_BUILDING|L_C_0
                                        ; DATA XREF: DROAD+23↑t
ROADS:          .BYTE L_RUNWAY_LEFT|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_RIGHT|L_C_1
                                        ; DATA XREF: DROAD+34↑t
HNGR1:          .BYTE L_HANGAR_A|L_C_1,L_SOLID_WALL|L_C_0,L_SOLID_WALL|L_C_0,L_HANGAR_A|L_C_1,L_HANGAR_F|L_C_1
                                        ; DATA XREF: ENRUN:UJ↑t
HNGR2:          .BYTE L_HANGAR_B|L_C_1,L_HANGAR_C|L_C_1,L_HANGAR_D|L_C_1,L_HANGAR_E|L_C_1,L_HANGAR_G|L_C_1,L_HANGAR_F|L_C_1
                                        ; DATA XREF: ENRUN:UK↑t
HNGR3:          .BYTE L_HANGAR_H|L_C_0,L_SOLID_WALL|L_C_0,L_SOLID_WALL|L_C_0,L_SOLID_WALL|L_C_0,L_HANGAR_G|L_C_1,L_HANGAR_F|L_C_1
                                        ; DATA XREF: ENRUN:UM↑t
HNGR5:          .BYTE L_HANGAR_I|L_C_0,L_HANGAR_J|L_C_0,L_HANGAR_K|L_C_0,L_HANGAR_L|L_C_0
                                        ; DATA XREF: ENRUN:UN↑t
ENRNIM:         .BYTE L_RUNWAY_LEFT|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_CENTER|L_C_1,L_RUNWAY_RIGHT|L_C_1
                                        ; DATA XREF: ENRUN+44↑t
                                        ; Enemy runway

SHPIM:          .BYTE         0         ; DATA XREF: SHIP:I5↑t
                .BYTE      110b         ; moving ship
                .BYTE     1010b
                .BYTE     1110b
                .BYTE    10010b
                .BYTE    10100b
                .BYTE   110100b
                .BYTE    11100b
                .BYTE  1011000b
                .BYTE  1011000b
                .BYTE 10101000b
                .BYTE 11110000b
SHPIM1:         .BYTE      100b         ; DATA XREF: SHIP+40↑t
                .BYTE         0         ; moving ship black highlight color
                .BYTE     1100b
                .BYTE     1010b
                .BYTE     1010b
                .BYTE   100000b
                .BYTE   100100b
                .BYTE   100100b
                .BYTE  1010000b
                .BYTE     1000b
                .BYTE 11111000b
                .BYTE 11110000b

DSPLY:          .BYTE _F|_C_LBLUE,_COLON|_C_LBLUE,_3|_C_BLUE,_0|_C_BLUE,_0|_C_BLUE,_SPACE|_C_BLACK,_B|_C_LBLUE,_COLON|_C_LBLUE,_3|_C_BLUE,_0|_C_BLUE,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: RESET:L5↑t
                                        ; Initial Control Display
ABR:            .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: DFBLDG+26↑r
                                        ; DFTNK+20↑r ...
                                        ; 8 zero bytes (used for initialization)
                .BYTE _SPACE|_C_BLACK,_S|_C_LBLUE,_P|_C_LBLUE,_D|_C_LBLUE,_COLON|_C_LBLUE,_0|_C_BLUE,_0|_C_BLUE,_0|_C_BLUE
                .BYTE _SPACE|_C_BLACK,_A|_C_LBLUE,_L|_C_LBLUE,_T|_C_LBLUE,_COLON|_C_LBLUE,_0|_C_BLUE,_0|_C_BLUE,_0|_C_BLUE
                .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                .BYTE _SPACE|_C_BLACK,_S|_C_LBLUE,_C|_C_LBLUE,_O|_C_LBLUE,_R|_C_LBLUE,_E|_C_LBLUE,_COLON|_C_LBLUE,_SPACE|_C_BLACK
                .BYTE _0|_C_BLUE,_0|_C_BLUE,_0|_C_BLUE,_0|_C_BLUE,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK

FTR:            .BYTE       10b         ; DATA XREF: FTURN:N0↑t
                .BYTE       10b         ; enemy plane turning right
                .BYTE      111b
                .BYTE     1110b
                .BYTE 11110111b
                .BYTE    11000b
                .BYTE 11001111b
                .BYTE   100000b
                .BYTE   100000b
                .BYTE         0
FTL:            .BYTE 11000000b         ; DATA XREF: FTURN:M8↑t
                .BYTE 11000100b         ; enemy plane turning left
                .BYTE  1100110b
                .BYTE  1101110b
                .BYTE   111100b
                .BYTE   101000b
                .BYTE 10111000b
                .BYTE     1100b
                .BYTE  1001100b
                .BYTE      110b
                .BYTE      110b
GNST:           .BYTE 11111110b         ; DATA XREF: GNSGHT:Q1↑t
                .BYTE 10000010b         ; red-white flashing bullseye target
                .BYTE 10010010b
                .BYTE    10000b
                .BYTE  1111100b
                .BYTE    10000b
                .BYTE 10010010b
                .BYTE 10000010b
                .BYTE 11111110b
XCRIM:          .BYTE 10100001b         ; DATA XREF: BMBSHP:R8↑t
                .BYTE  1010100b
                .BYTE 10101010b
                .BYTE   110110b
                .BYTE  1111110b
                .BYTE 11110101b
                .BYTE 10101111b
                .BYTE  1010100b
                .BYTE  1000101b
                .BYTE 10000010b
XSHPIM:         .BYTE 10100010b         ; DATA XREF: BMBSHP:S6↑t
                .BYTE  1001000b         ; moving ship explosion
                .BYTE     1110b
                .BYTE  1000101b
                .BYTE   101010b
                .BYTE 10010110b
                .BYTE  1011100b
                .BYTE    10110b
                .BYTE 10101101b
                .BYTE  1111100b
                .BYTE 11011100b
                .BYTE 10111100b
                .BYTE  1110101b

AAA:            .BYTE L_BUILDING_ROOF_TOP_RIGHT|L_C_0,L_BUILDING_ROOF_TOP_RIGHT|L_C_1,L_BUILDING_WALL_A|L_C_0,L_BUILDING_WALL_A|L_C_1,L_BUILDING_ROOF_TOP_LEFT|L_C_0,L_BUILDING_ROOF_TOP_LEFT|L_C_1,L_BUILDING_WINDOW|L_C_1,L_BUILDING_WINDOW|L_C_0,L_HANGAR_H|L_C_1,L_BUILDING_ROOF_CENTER|L_C_1
                                        ; DATA XREF: CKCHAR:T6↑t
                                        ; Targets: building
AAB:            .BYTE L_SKYSCRAPER_58|L_C_0,L_SKYSCRAPER_56|L_C_0,L_SKYSCRAPER_54|L_C_0,L_SKYSCRAPER_B_5E|L_C_0,L_SKYSCRAPER_B_C|L_C_0,L_SKYSCRAPER_B_5A|L_C_0,L_SKYSCRAPER_B_5E|L_C_1,L_SKYSCRAPER_B_C|L_C_1,L_SKYSCRAPER_B_5A|L_C_1,L_SKYSCRAPER_57|L_C_0,L_SKYSCRAPER_B_5D|L_C_0,L_SKYSCRAPER_B_5D|L_C_1,L_SKYSCRAPER_59|L_C_0,L_SKYSCRAPER_55|L_C_0
                                        ; DATA XREF: CKCHAR:T8↑t
                                        ; Targets: skyscraper
AAC:            .BYTE L_BRIDGE_Q|L_C_1,L_BRIDGE_C|L_C_1,L_BRIDGE_D|L_C_1,L_BRIDGE_F|L_C_1,L_BRIDGE_A|L_C_1,L_BRIDGE_J|L_C_1,L_SKYSCRAPER_B_5B|L_C_1
                                        ; DATA XREF: CKCHAR:U0↑t
                                        ; Targets: lower parts of a bridge
AAD:            .BYTE L_BRIDGE_B|L_C_1,L_BRIDGE_O|L_C_1,L_BRIDGE_P|L_C_1
                                        ; DATA XREF: CKCHAR:_1↑t
                                        ; Targets: upper parts of a bridge
AAE:            .BYTE L_ROAD_DIAG_LEFT_A|L_C_1,L_ROAD_DIAG_LEFT_B|L_C_1,L_RUNWAY_CENTER|L_C_1,L_ROAD_DIAG_RIGHT_A|L_C_1,L_ROAD_DIAG_RIGHT_B|L_C_1,L_RUNWAY_LEFT|L_C_1,L_BRIDGE_M|L_C_1,L_BRIDGE_N|L_C_1
                                        ; DATA XREF: CKCHAR:_9↑t
                                        ; Targets: roads
AAF:            .BYTE L_HANGAR_A|L_C_1,L_SOLID_WALL|L_C_0,L_HANGAR_B|L_C_1,L_HANGAR_C|L_C_1,L_HANGAR_D|L_C_1,L_HANGAR_E|L_C_1,L_HANGAR_G|L_C_1,L_HANGAR_H|L_C_0,L_HANGAR_I|L_C_0,L_HANGAR_J|L_C_0,L_HANGAR_K|L_C_0,L_HANGAR_L|L_C_0,L_HANGAR_F|L_C_1
                                        ; DATA XREF: Z3:_1↑r
                                        ; Targets: all parts of a hangar
AAG:            .BYTE L_STREET_CAR_LEFT_COLOR_A|L_C_1,L_STREET_CAR_RIGHT_COLOR_A|L_C_1,L_STREET_CAR_LEFT_COLOR_B|L_C_1,L_STREET_CAR_RIGHT_COLOR_B|L_C_1,L_ANTI_AIRCRAFT_BATTERY_B|L_C_1,L_TANK_LEFT_B|L_C_1,L_TANK_RIGHT_B|L_C_1,L_TANK_LEFT_A|L_C_1,L_TANK_RIGHT_A|L_C_1,L_ANTI_AIRCRAFT_BATTERY_A|L_C_0,L_ANTI_AIRCRAFT_BATTERY_A|L_C_1
                                        ; DATA XREF: Z3:_7↑t
                                        ; Targets: all cars, tanks, ait-aircraft battery on the playfield

AAH:            .BYTE     1000b         ; DATA XREF: CPTL:_4↑t
                .BYTE   111000b         ; final targets (main color)
                .BYTE   101001b
                .BYTE   111001b
                .BYTE   110011b
                .BYTE       11b
                .BYTE 11111111b
                .BYTE 11111111b
                .BYTE 10110111b
                .BYTE 10110110b
                .BYTE 10110110b
                .BYTE 11111100b
                .BYTE 11111100b
AAI:            .BYTE     1000b         ; DATA XREF: CPTL+5F↑t
                .BYTE   111000b         ; final targets (black color)
                .BYTE   110111b
                .BYTE      111b
                .BYTE  1010110b
                .BYTE  1000110b
                .BYTE 11001100b
                .BYTE 11111100b
                .BYTE         0
                .BYTE         0
                .BYTE  1001000b
                .BYTE  1001000b
                .BYTE  1001000b

ABC:            .BYTE   4,$11,$40,$11,$40,  4,$40,$41
                                        ; DATA XREF: ACL:_2↑r ABB:_2↑r ...
                                        ; Tile: explosion 1 on gras
ABD:            .BYTE $45,$54,$15,$51,$44,$55,$15,$51
                                        ; DATA XREF: ACL:_1↑r ABB:_1↑r ...
                                        ; Tile: explosion 2 on gras
ABL:            .BYTE $3F,$3F,$3F,  3,  3,  3,$3F,$3F
                                        ; DATA XREF: DFBLDG+38↑r
                                        ; DFTNK:_1↑r
                                        ; Tile: building wall/window
ABN:            .BYTE   3,  3, $F, $F,$3F,$3F,$FF,$FF
                                        ; DATA XREF: DFBLDG+20↑r
                                        ; DFTNK+E↑r
                                        ; Tile: building
ABO:            .BYTE $FC,$FC,$F1,$F1,$C5,$C5,$15,$15
                                        ; DATA XREF: DFBLDG+14↑r
                                        ; DFTNK+14↑r
                                        ; Tile: building
ABP:            .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                                        ; DATA XREF: DFBLDG+1A↑r
                                        ; DFTNK+1A↑r
                                        ; Tile: building roof
ABT:            .BYTE $54,$54,$50,$50,$40,$40,  0,  0
                                        ; DATA XREF: DFBLDG+2C↑r
                                        ; DFTNK+26↑r
                                        ; Tile: building
ACJ:            .BYTE $AA,$AA,$BE,$82,$82,$82,$BE,$AA
                                        ; DATA XREF: DFBLDG+32↑r
                                        ; Tile: target

XCPTLIM:        .BYTE    10000b         ; DATA XREF: BMCPTL+40↑t
                .BYTE     1000b         ; explosion off the final targets
                .BYTE   100100b
                .BYTE   101000b
                .BYTE 10011001b
                .BYTE   111100b
                .BYTE   101011b
                .BYTE     1010b
                .BYTE 11010101b
                .BYTE   101010b
                .BYTE   110010b
                .BYTE 10000101b
                .BYTE  1011000b
                .BYTE   110101b
                .BYTE 10001010b
                .BYTE   111011b
                .BYTE 11010101b
                .BYTE 10100010b

EAS0:           DIFF_STRUCT <  4,   2, $10, $14, $28,   9, $12>
                                        ; DATA XREF: EB:_1↑r
                                        ; Novice level variables
                .BYTE $A5
EAS2:           DIFF_STRUCT <  4,   4, $40, $19, $32,  $A, $14>
                                        ; DATA XREF: CKSC+40↑r
EAS4:           DIFF_STRUCT <  5,   6, $80, $1E, $3C,  $B, $16>
                                        ; DATA XREF: CKSC+4E↑r
EAS6:           DIFF_STRUCT <  6,   8, $B0, $23, $46,  $C, $18>
                                        ; DATA XREF: EB:_7↑r
                                        ; CKSC:loc_45C1↑r
                                        ; Intermediate level variables
EAS8:           DIFF_STRUCT <  6,   8, $E0, $28, $50,  $D, $1A>
                                        ; DATA XREF: CKSC:loc_45CB↑r
EAS9:           DIFF_STRUCT <  7,  $C, $FF, $30, $60,  $E, $1C>
                                        ; DATA XREF: EB:_5↑r
                                        ; CKSC:loc_459B↑r
                                        ; Advanced level variables

ADI:            .BYTE $51,$51,$51,$51,$40, $C,$34,  0
                                        ; DATA XREF: DFGN:_1↑r
                                        ; Standard anti-aircraft gun battery. Used to restore after the final city anti-aircraft gun battery was used as  character $31.
ADJ:            .BYTE   0,$20,$20,$20,$EC,$EC,$FC,$FC
                                        ; DATA XREF: B7:_1↑r
                                        ; Final city anti-aircraft gun battery. Replaces character $31 (standard anti-aircraft gun battery)

OPTIM:          .BYTE $70               ; DATA XREF: CNSL__CONSOLE:_6↑r
                                        ; Display List for the menu
                .BYTE $47
                .WORD 0
                .BYTE 7
                .BYTE 7
                .BYTE $87
                .BYTE 7
                .BYTE 7
                .BYTE 6
                .BYTE 7
                .BYTE 7
                .BYTE 6
                .BYTE 7
                .BYTE 7
                .BYTE 6
                .BYTE $41

NOVI:           .BYTE _N|_C_BLACK,_O|_C_BLACK,_V|_C_BLACK,_I|_C_BLACK,_C|_C_BLACK,_E|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: NOV__PRINT_NOVICE↑r
                                        ; "NOVICE      "
VETI:           .BYTE _A|_C_BLACK,_D|_C_BLACK,_V|_C_BLACK,_A|_C_BLACK,_N|_C_BLACK,_C|_C_BLACK,_E|_C_BLACK,_D|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: VET__PRINT_ADVANCED↑r
                                        ; "ADVANCED    "
NORI:           .BYTE _N|_C_BLACK,_O|_C_BLACK,_R|_C_BLACK,_M|_C_BLACK,_A|_C_BLACK,_L|_C_BLACK,_SPACE|_C_BLACK,_C|_C_BLACK,_T|_C_BLACK,_R|_C_BLACK,_L|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: NOR__PRINT_NORMAL↑r
                                        ; "NORMAL CTRL "
RVSI:           .BYTE _R|_C_BLACK,_E|_C_BLACK,_V|_C_BLACK,_E|_C_BLACK,_R|_C_BLACK,_S|_C_BLACK,_E|_C_BLACK,_SPACE|_C_BLACK,_C|_C_BLACK,_T|_C_BLACK,_R|_C_BLACK,_L|_C_BLACK
                                        ; DATA XREF: RVS__PRINT_REVERSED_CTRL↑r
                                        ; "REVERSE CTRL"
NGRVI:          .BYTE _N|_C_BLACK,_O|_C_BLACK,_SPACE|_C_BLACK,_G|_C_BLACK,_R|_C_BLACK,_A|_C_BLACK,_V|_C_BLACK,_I|_C_BLACK,_T|_C_BLACK,_Y|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: NGRV__PRINT_NO_GRAVITY↑r
                                        ; GRV__PRINT_GRAVITY↑r
                                        ; "NO GRAVITY   "
INTI:           .BYTE _I|_C_BLACK,_N|_C_BLACK,_T|_C_BLACK,_E|_C_BLACK,_R|_C_BLACK,_M|_C_BLACK,_E|_C_BLACK,_D|_C_BLACK,_I|_C_BLACK,_A|_C_BLACK,_T|_C_BLACK,_E|_C_BLACK
                                        ; DATA XREF: INT__PRINT_INTERMEDIATE↑r
                                        ; "INTERMEDIATE"
RNKI:           .BYTE _R|_C_BLACK,_A|_C_BLACK,_N|_C_BLACK,_K|_C_BLACK,_COLON|_C_BLACK,_SPACE|_C_BLACK,_C|_C_BLACK,_L|_C_BLACK,_A|_C_BLACK,_S|_C_BLACK,_S|_C_BLACK
                                        ; DATA XREF: RNK__DISPLAY_RANK:loc_4B17↑r
                                        ; BLUE__PRINT_RANK_CLASS:_1↑r ...
                                        ; "RANK: CLASS"
DEMI:           .BYTE _B|_C_BLUE,_L|_C_BLUE,_U|_C_BLUE,_E|_C_BLUE,_SPACE|_C_BLACK,_M|_C_BLUE,_A|_C_BLUE,_X|_C_BLUE,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK
                                        ; DATA XREF: RESET:loc_C36↑r
                                        ; BLMX__PRINT_BLUE_MAX:_1↑t
                .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_B|_C_LBLUE,_Y|_C_LBLUE,_SPACE|_C_BLACK,_B|_C_LBLUE,_O|_C_LBLUE,_B|_C_LBLUE,_SPACE|_C_BLACK,_P|_C_LBLUE,_O|_C_LBLUE,_L|_C_LBLUE,_I|_C_LBLUE,_N|_C_LBLUE,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK ; "BLUE MAX" / "  BY BOB POLIN" / "    (C)SYNSOFT 1983"
                .BYTE _SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_SPACE|_C_BLACK,_OPEN_BRACKET|_C_LBLUE,_C|_C_LBLUE,_CLOSE_BRACKET|_C_LBLUE,_S|_C_LBLUE,_Y|_C_LBLUE,_N|_C_LBLUE,_S|_C_LBLUE,_O|_C_LBLUE,_F|_C_LBLUE,_T|_C_LBLUE,_SPACE|_C_BLACK,_1|_C_LBLUE,_9|_C_LBLUE,_8|_C_LBLUE,_3|_C_LBLUE
OPTI:           .BYTE _O|_C_BLACK,_P|_C_BLACK,_T|_C_BLACK,_I|_C_BLACK,_O|_C_BLACK,_N|_C_BLACK,_S|_C_BLACK
                                        ; DATA XREF: CNSL__CONSOLE:_95↑r
                                        ; "OPTIONS"
KMKZI:          .BYTE _K|_C_ORANGE,_A|_C_ORANGE,_M|_C_ORANGE,_I|_C_ORANGE,_K|_C_ORANGE,_A|_C_ORANGE,_Z|_C_ORANGE,_E|_C_ORANGE,_SPACE|_C_BLACK,_T|_C_ORANGE,_R|_C_ORANGE,_A|_C_ORANGE,_I|_C_ORANGE,_N|_C_ORANGE,_E|_C_ORANGE,_E|_C_ORANGE
                                        ; DATA XREF: RNKX__PRINT_RANK_CLASS:_2↑r
                                        ; "KAMIKAZE TRAINEE"
RSWI:           .BYTE _R|_C_ORANGE,_U|_C_ORANGE,_N|_C_ORANGE,_W|_C_ORANGE,_A|_C_ORANGE,_Y|_C_ORANGE,_SPACE|_C_BLACK,_S|_C_ORANGE,_W|_C_ORANGE,_E|_C_ORANGE,_E|_C_ORANGE,_P|_C_ORANGE,_E|_C_ORANGE,_R|_C_ORANGE
                                        ; DATA XREF: RNKX__PRINT_RANK_CLASS:_1_1↑r
                                        ; "RUNWAY SWEEPER"
ACDI:           .BYTE _A|_C_ORANGE,_I|_C_ORANGE,_R|_C_ORANGE,_SPACE|_C_BLACK,_C|_C_ORANGE,_A|_C_ORANGE,_D|_C_ORANGE,_E|_C_ORANGE,_T|_C_ORANGE
                                        ; DATA XREF: RNKX__PRINT_RANK_CLASS:_1_0↑r
                                        ; "AIR CADET"
FTGI:           .BYTE _F|_C_BLACK,_L|_C_BLACK,_Y|_C_BLACK,_I|_C_BLACK,_N|_C_BLACK,_G|_C_BLACK,_SPACE|_C_BLACK,_T|_C_BLACK,_I|_C_BLACK,_G|_C_BLACK,_E|_C_BLACK,_R|_C_BLACK
                                        ; DATA XREF: RNKX__PRINT_RANK_CLASS:_1_2↑r
                                        ; "FLYING TIGER"
SQLDI:          .BYTE _S|_C_BLACK,_Q|_C_BLACK,_U|_C_BLACK,_A|_C_BLACK,_D|_C_BLACK,_R|_C_BLACK,_O|_C_BLACK,_N|_C_BLACK,_SPACE|_C_BLACK,_L|_C_BLACK,_E|_C_BLACK,_A|_C_BLACK,_D|_C_BLACK,_E|_C_BLACK,_R|_C_BLACK
                                        ; DATA XREF: SQLD__PRINT_SQUADRON_LEADER:_1↑r
                                        ; "SQUADRON LEADER"

; from here on, we again have unitialized variables
AEG:            .BYTE   0,$6A,$AD,$52,$6A,$C9,$5A,$D0,$D1,$A9,$50,$8D,$52,$6A,$EE,$51
                                        ; DATA XREF: RESET+17↑w
                                        ; DFHNGR:loc_4982↑r
                .BYTE $6A,$4C,  2,$26,$EE,$E0,  6,$60,$AD,$4C,  6,$F0,$10,$CE,$4C,  6 ; Backup of the hangar font characters
                .BYTE $AD,$4C,  6,$F0,$10,$4A,$90,  6,$A9, $A,$8D,  6,$D2,$60,$A9,$19
                .BYTE $8D,  6,$D2,$A9,$A4,$8D,  7,$D2,$60,$A5,$FD,$F0,$45,$C9,  2,$D0
                .BYTE $EC,$AD,$A8,  6,$F0,$17,$AD,  4,  6,$4A,$90,$11,$20,$2E,$2F,$20
                .BYTE $19,$2A,$AD,$40,  6,$C9,  5,$90,  3,$20,$C4,$2E,$60,$AD,$40,  6
                .BYTE $C9,  2,$F0,$54,$C9,  3,$F0,$79,$C9,  4,$F0,  7,$C9,  5,$F0,  6
                .BYTE $4C,$E3,$27,$4C,$58,$27,$20,$2E,$2F,$20,$66,$2E,$20,$C4,$2E,$4C
                .BYTE $6E,$27,$AD, $A,$D2,$29,$1F,$D0,$3B,$8D,$A8,  6,$8D,$A5,  6,$AD
                .BYTE $A6,  6,$D0,$30,$A9,$17,$8D,$36,  6,$AD, $A,$D2,$4A,$90,$16,$A9
                .BYTE   2,$85,$FD,$8D,$40,  6,$A5,$B7,$C9,  3,$B0,$18,$A5,$14,$4A,$90
                .BYTE $13,$EE,$A8,  6,$60,$4C,$E6,$20,$A5,$F0,$D0,  8,$CE,$36,  6,$D0
                .BYTE   4,$EE,$40,  6,$60,$AD,$36,  6,$C9, $D,$90,$F8,$4A,$90,  9,$A9
                .BYTE   0,$8D,$72,$6A,$8D,  7,$D2,$60,$A9,$B0,$8D,$72,$6A,$20,$E7,$25
                .BYTE $60,$A0,$BA,$84,$C1,$84,$C2,$A2, $A,$BD,$D6,$52,$99,  9,$76,$88
                .BYTE $CA,$D0,$F6,$A9, $C,$8D,$BC,$77,$A9,  4,$8D,$BD,$77,$A9,$10,$8D
                .BYTE $BE,$77,$AD, $A,$D2,$29,$3F,  9,$18,$69,  6,$8D,$2F,  6,$AD, $A
                .BYTE $D2,$29,$3F,$85,$C0,$8D,  2,$D0,$8D,  3,$D0,$EE,$40,  6,$A5,$C4
                .BYTE $D0,  8,$A9,$7C,$8D,$C2,  2,$C6,$C4,$60,$A9,$2C,$8D,$C2,  2,$60
                .BYTE $CE,$2F,  6,$D0,$11,$EE,$40,  6,$A4,$C2,$A2,  8,$BD,$E6,$52,$99
                .BYTE   7,$77,$88,$CA,$D0,$F6,$A5,$FD

V_STAT:         .BYTE $C9,$FE,$F0       ; DATA XREF: PLAY_IT+7↑w
                                        ; _1__SOUND_TIMER_IRQ:_2↑r ...
                                        ; Note Status Channel 1-3
DUR1:           .BYTE $10               ; DATA XREF: PLAY_IT+4↑w
                                        ; PLAY_NOTE+5↑w ...
                                        ; Duration Voice 1
DUR2:           .BYTE $20               ; DATA XREF: PLAY_NOTE+71↑w
                                        ; PLAY_NOTE+74↑r ...
                                        ; Duration Voice 2
DUR3:           .BYTE $D9               ; DATA XREF: PLAY_NOTE+DB↑w
                                        ; PLAY_NOTE+DE↑r ...
                                        ; Duration Voice 3
VOL1:           .BYTE $1D               ; DATA XREF: PLAY_NOTE:_2_↑w
                                        ; PLAY_NOTE+5C↑r ...
                                        ; Volume Voice 1
VOL2:           .BYTE $20               ; DATA XREF: PLAY_NOTE:_2__↑w
                                        ; PLAY_NOTE+C8↑r ...
                                        ; Volume Voice 2
VOL3:           .BYTE $19               ; DATA XREF: PLAY_NOTE:_2↑w
                                        ; PLAY_NOTE+132↑r ...
                                        ; Volume Voice 3
TIE:            .BYTE $2A,$20,  6       ; DATA XREF: PLAY_NOTE+F↑w
                                        ; PLAY_NOTE+3A↑w ...
TEMP0:          .BYTE $3A               ; DATA XREF: MULT+2↑w MULT+B↑r ...
                                        ; Playback tempo
                .BYTE $AD,$A5,  6

; this is the 3-channel game title music
VOICE_1:        NOTE <SND_FREQ_52, $10> ; DATA XREF: PLAY_IT+D↑t
                                        ; PLAY_IT+11↑t
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_36, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_41, $20>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_39, $20>
                NOTE <SND_FREQ_39, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_36, $10>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_39, $10>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_36, $10>
                NOTE <SND_FREQ_37,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_50,   8>
                NOTE <SND_FREQ_52,   8>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_52,   8>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_36, $20>
                NOTE <SND_FREQ_38, $20>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_36, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_39, $20>
                NOTE <SND_FREQ_41, $20>
                NOTE <SND_FREQ_43, $40>
                NOTE <SND_FREQ_39, $30>
                NOTE <SND_FREQ_39, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_39, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_39, $10>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $40>
                NOTE <SND_FREQ_36, $20>
                NOTE <SND_FREQ_38, $20>
                NOTE <SND_FREQ_39,   8>
                NOTE <SND_FREQ_43,   8>
                NOTE <SND_FREQ_38,   8>
                NOTE <SND_FREQ_41,   8>
                NOTE <SND_FREQ_36, $10>
                NOTE <SND_FREQ_38, $10>
                NOTE <SND_FREQ_39, $20>
                NOTE <SND_FREQ_41, $20>
                NOTE <SND_FREQ_43, $40>
                .BYTE $FF
VOICE_2:        NOTE <SND_FREQ_15, $10> ; DATA XREF: PLAY_IT+15↑t
                                        ; PLAY_IT+19↑t
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_53, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_41, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_53, $20>
                NOTE <SND_FREQ_64, $20>
                NOTE <SND_FREQ_59, $10>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_52, $20>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_52,   8>
                NOTE <SND_FREQ_59,   8>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_50,   8>
                NOTE <SND_FREQ_50,   8>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_54, $10>
                NOTE <SND_FREQ_55, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_52, $40>
                NOTE <SND_FREQ_43, $30>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_50, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_52, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_48, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $10>
                NOTE <SND_FREQ_43, $20>
                NOTE <SND_FREQ_48, $20>
                NOTE <SND_FREQ_55, $40>
                .BYTE $FF
VOICE_3:        NOTE <SND_FREQ_15, $10> ; DATA XREF: PLAY_IT+1D↑t
                                        ; PLAY_IT+21↑t
                NOTE <SND_FREQ_59, $10>
                NOTE <SND_FREQ_64, $10>
                NOTE <SND_FREQ_66, $20>
                NOTE <SND_FREQ_68, $10>
                NOTE <SND_FREQ_70, $10>
                NOTE <SND_FREQ_71, $10>
                NOTE <SND_FREQ_66, $10>
                NOTE <SND_FREQ_70, $10>
                NOTE <SND_FREQ_73, $10>
                NOTE <SND_FREQ_68, $10>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_64, $10>
                NOTE <SND_FREQ_64, $10>
                NOTE <SND_FREQ_59, $10>
                NOTE <SND_FREQ_64, $10>
                NOTE <SND_FREQ_66, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_73, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_68, $10>
                NOTE <SND_FREQ_73, $10>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_68, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_69, $10>
                NOTE <SND_FREQ_68, $10>
                NOTE <SND_FREQ_80, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_73, $20>
                NOTE <SND_FREQ_73, $20>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_91, $20>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_91,   8>
                NOTE <SND_FREQ_87,   8>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_82, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_89,   8>
                NOTE <SND_FREQ_87,   8>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_85, $10>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_89,   8>
                NOTE <SND_FREQ_91,   8>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_91,   8>
                NOTE <SND_FREQ_89,   8>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_75, $30>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_15, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_85, $10>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_84, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_89,   8>
                NOTE <SND_FREQ_91,   8>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_91, $10>
                NOTE <SND_FREQ_89, $10>
                NOTE <SND_FREQ_87, $10>
                NOTE <SND_FREQ_86, $10>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_84, $20>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_75,   8>
                NOTE <SND_FREQ_75,   8>
                NOTE <SND_FREQ_75, $10>
                NOTE <SND_FREQ_75, $10>
                .BYTE $FF

; This is garabage data generated by leftover data in the memory during the assembly phase:
                .BYTE   0,  0,  0,  0,  0,$C0,  2,$60,$CE,$59,  6,$AD, $A,$D2,$29,  3,$F0,$13,$C9,  1,$F0,$1A,$C9,  2,$F0,$21,$AD,$58,$6A,$D0,$EC,$A9
                .BYTE $A7,$8D,$58,$6A,$60,$AD,$55,$6A,$D0,$E1,$A9,$A6,$8D,$55,$6A,$60,$AD,$56,$6A,$D0,$D6,$A9,$A2,$8D,$56,$6A,$60,$AD,$57,$6A,$D0,$CB
                .BYTE $A9,$AD,$8D,$57,$6A,$60,$AC,$56,  6,$D0,$36,$A5,$C2,$E5,$F6,$30,$2F,$A5,$C0,$C9,$AA,$B0,$29,$AD, $A,$D2,$CD,$CA,  6,$B0,$21,$AD
                .BYTE $40,  6,$C9,  5,$D0,$1A,$A5,$C0,$18,$69,  6,$8D,$57,  6,$8D,  6,$D0,$A4,$C1,$C8,$C8,$8C,$56,  6,$A9,$30,$99,  0,$73,$8D,$48,  6
                .BYTE $60,$C0,$1E,$90,$24,$AD,$57,  6,$C9,$CD,$B0,$1D,$18,$69,  3,$8D,$57,  6,$8D,  6,$D0,$A9,  0,$99,  0,$73,$88,$88,$88,$8C,$56,  6
                .BYTE $A9,$30,$99,  0,$73,$20,$94,$29,$60,$A9,  0,$8D,$56,  6,$99,  0,$73,$A2,$FF,$8E,$48,  6,$60,$AC,$56,  6,$D0,$20,$A5,$C2,$C5,$F6
                .BYTE $B0,$F4,$AD, $A,$D2,$CD,$CA,  6,$B0,$EC,$A5,$C0,$E9,  2,$8D,$57,  6,$8D,  6,$D0,$A5,$C1,$69, $B,$A8,$4C,$48,$2A,$C0,$B9,$B0,$C9
                .BYTE $AD,$57,  6,$C9,$37,$90,$C2,$18,$E9,  2,$8D,$57,  6,$8D,  6,$D0,$A9,  0,$99,  0,$73,$C8,$C8,$C8,$C8,$4C,$70,$2A,$AD,$61,  6,$D0
                .BYTE   7,$60,$A9,  0,$8D,$61,  6,$60,$AD,$64,  6,$F0,  4,$CE,$64,  6,$60,$EE,$5D,  6,$AC,$5D,  6,$C0,$D2,$F0,$E7,$CE,$5E,  6,$AD,$5E
                .BYTE   6,$4A,$B0,  3,$CE,$5C,  6,$60,$A5,$BF,$D0,$FB,$AC,$5F,  6,$D0,$4B,$20,$E2,$35,$AE,$5C,  6,$E0,$B9,$B0,$37,$E0,$A1,$B0,$2D,$E0
                .BYTE $41,$90,$E4,$4C,$B5,$35,$A9,  0,$8D,$96,  6,$8E,  7,$D0,$8E,$63,  6,$8C,$5F,  6,$A9,$80,$99,  0,$73,$99,$FF,$72,$AD, $A,$D2,$29
                .BYTE  $F,$69, $F,$8D,$60,  6,$A9, $C,$8D,$AF,  6,$60,$AD, $A,$D2,$4A,$90,$D1,$8A,$38,$E9,$60,$8D,$5C,  6,$4C,$B5,$35,$AD,$96,  6,$F0
                .BYTE   7,$C9,  1,$D0, $F,$CE,$63,  6,$CE,$63,  6,$AD,$63,  6,$8D,  7,$D0,$4C,$7B,$2B,$C9,  2,$F0,$10,$C9,  4,$D0,  6,$EE,$63,  6,$4C
                .BYTE $5E,$2B,$AD,$5E,  6,$4A,$90,$E0,$AD,$60,  6,$F0,$5F,$CE,$60,  6,$D0,$21,$AD,$44,  6,$D0,  7,$A9,  2,$A2,$47,$20,$3A,$25,$A9,$19
                .BYTE $8D,$62,  6,$A9,$80,$99,$FE,$72,$99,$FC,$72,$4A,$99,$FF,$72,$99,$FD,$72,$60,$A9,  0,$99,  0,$73,$88,$99,  0,$73,$88,$8C,$5F,  6
                .BYTE $A9,$80,$99,  0,$73,$99,$FF,$72,$20,$FC,$2B,$60,$A9,  0,$99,  0,$73,$99,$FF,$72,$8D,$5F,  6,$99,$FE,$72,$99,$FD,$72,$99,$FC,$72
                .BYTE $A9,$3C,$2D,$A9,  6,$8D,$A9,  6,$8D, $C,$D0,$60,$CE,$62,  6,$F0,$DB,$AD,$5E,  6,$4A,$4A,$4A,$90,  4,$20,$FC,$2B,$60,$A9,$C0, $D
                .BYTE $A9,  6,$8D,$A9,  6,$8D, $C,$D0,$60,$AD, $B,$D0,$29
; end of 'DATA'

*
*
* RAM FONT WITH THE LEVEL CHARACTERS
*
*
; ===========================================================================

; Segment type: Pure data
                ;.segment CHBASE
                * =  $5C00
__CHBAS:        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
                                        ; DATA XREF: RESET+CA↑t
ACG:            .BYTE $A9,$A9,$A5,$A5,$95,$95,$55,$55
                                        ; DATA XREF: DFBLDG:_1↑r
                                        ; $01: Water (top), Grass
ACH:            .BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                                        ; DATA XREF: DFBLDG+8↑r
                .BYTE $FF,$FF,$FE,$FE,$FA,$FA,$EA,$EA ; $02: Water
                .BYTE $55,$55,$57,$57,$5F,$5F,$7F,$7F
                .BYTE $AA,$AA,$AA,$AA,$A9,$A5,$95,$55
                .BYTE $A9,$A5,$95,$55,$55,$55,$55,$55
                .BYTE $FF,$FF,$FF,$FF,$FF,$FE,$FA,$EA
                .BYTE $FF,$FE,$FA,$EA,$AA,$AA,$AA,$AA
                .BYTE $55,$55,$55,$55,$55,$57,$5F,$7F
                .BYTE $55,$57,$5F,$7F,$FF,$FF,$FF,$FF
                .BYTE $95,$95,$95,$95,$55,$55,$55,$55
                .BYTE $A9,$A9,$A9,$A9,$A5,$A5,$A5,$A5
                .BYTE $FA,$FA,$FA,$FA,$EA,$EA,$EA,$EA
                .BYTE $5F,$5F,$5F,$5F,$7E,$7E,$7E,$7E
                .BYTE $55,$55,$55,$55,$57,$57,$57,$57
                .BYTE $7F,$7F,$7F,$7F,$7E,$7E,$FE,$FE
                .BYTE $FC,$FC,$F1,$F1,$C5,$C5,$15,$15
ABJ:            .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                                        ; DATA XREF: ABK+F↑w
                                        ; DFTNK+1D↑w
                .BYTE $54,$54,$53,$53,$4F,$4F,$3F,$3F ; $12: Runway, Road
                .BYTE $FF,$FF,$F0,$F3,$CF, $F,$FF,$FF
ADS:            .BYTE $2C,$38,$2C,$38,$2C,$38,$2C,$38
                                        ; DATA XREF: RESET:X0↑r ADR↑w ...
                                        ; $15: Hangar (A)
ADT:            .BYTE $54,$54,$50,$50,$40,$40, $E,$3B
                                        ; DATA XREF: ADR+3↑w
                                        ; $16: Hangar (B)
ADU:            .BYTE   0,  0,  0,  0, $E,$BB,$EE,$BB
                                        ; DATA XREF: ADR+6↑w
                                        ; $17: Hangar (C)
ADV:            .BYTE   0,  0,  0,  0,$E0,$BB,$EE,$BB
                                        ; DATA XREF: ADR+9↑w
                                        ; $18: Hangar (D)
ADW:            .BYTE   0,  0,  0,  0,  0,  0,$E0,$B8
                                        ; DATA XREF: ADR+C↑w
                                        ; $19: Hangar (E)
ADX:            .BYTE $EC,$B8,$E3,$B1,$C5,$85,$15,$15
                                        ; DATA XREF: ADR+F↑w
                                        ; $1A: Hangar (F)
ADY:            .BYTE   0,  0,  2,  3, $E, $B,$2E,$3B
                                        ; DATA XREF: ADR+12↑w
                                        ; $1B: Hangar (G)
AEE:            .BYTE $54,$54,$50,$50,$40,$40,  0,  0
                                        ; DATA XREF: ADR+24↑w
                                        ; $1C: Hangar (H)
ADZ:            .BYTE $55,$55,$55,$55,$55,$55,$50,  0
                                        ; DATA XREF: ADR+15↑w
                                        ; $1D: Hangar (I)
AEA:            .BYTE $55,$55,$55,$55,$50,  0,  0,  0
                                        ; DATA XREF: ADR+18↑w
                                        ; $1E: Hangar (J)
AEB:            .BYTE $55,$55,$55,$55,  5,  0,  0,  0
                                        ; DATA XREF: ADR+1B↑w
                                        ; $1F: Hangar (K)
AEC:            .BYTE $55,$55,$55,$55,$55,$55,  5,  0
                                        ; DATA XREF: ADR+1E↑w
                .BYTE $55,$55,$57,$53,$7F,$7D,$5F,$7F ; $20: Hangar (L)
                .BYTE $55,$55,$55,$54,$5F,$5D,$7C,$7F
                .BYTE $55,$55,$55,$15,$F5,$D5,$FD,$1D
                .BYTE $55,$55,$55,$D5,$F5,$75,$31,$FD
                .BYTE $CF,$FF,$F7,$7F,$7F,$5F,$5C,$54
                .BYTE $7F,$F3,$F5,$FC,$5F,$7F,$54,$54
                .BYTE $FD,$DD,$35,$F5,$F5,$D5,$55,$55
                .BYTE $F5,$3D,$DD,$75,$FD,$F5,$D5,$15
                .BYTE   0,  0,$CC,$30,$CC,$30,$CC,$30
                .BYTE $AA,$AA,$AA,$AA,  0,  0,$CC,  0
                .BYTE   0,  0,$CC,$33,$CC,$33,$CC,$33
                .BYTE   0,  0,$CC,$30,$CC,$30,$CC,$30
                .BYTE   0,$33,$CC,$33,$CC,$33,$CC,$33
                .BYTE $FF,$FF,$FF,$FF,  0,  0,$CC,$33
                .BYTE $CC,$33,$AA,$AA,$AA,$AA,$AA,$AA
                .BYTE $CD,$31,$C5,$35,$D5,$15,$55,$55
ADK:            .BYTE $51,$51,$51,$51,$40, $C,$34,  0
                                        ; DATA XREF: B7+AE↑w DFGN+5↑w
                                        ; $31: Anti-Aircraft Battery
                .BYTE $CC,$33,$CC,$30,$CC,$30,$CC,$30
                .BYTE $55,$55,$55,$55,$55,$55,$55,$FF
                .BYTE $55,$55,$55,$55,$55,$55,$FF,$FF
                .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$55
                .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$55,$55
                .BYTE   0,  0,$CC,$30,$CC,$30,$CC,  0
                .BYTE   0,  0,$CC,$33,$CC,$33,$CC,  0
                .BYTE $CC,$33,$CC,$33,$CC,$33,$CC,$33
                .BYTE $AA,$AA,$A9,$A6,$AA,$AA,$AB,$AB
                .BYTE $9F,$6F,$B3,$B3,$CF,$FC, $C,$31
                .BYTE $AF,$A1,$B3,$B3,$CC,$FF,  0,  0
                .BYTE $31,$F2,$C9,$CA,$C9,$2A,$26,$AA
                .BYTE $57,$40,$CC,$13,$C0,$43,$50,$51
ABQ:            .BYTE   0,  0,  0,  0,  0,  0,  0,  0
                                        ; DATA XREF: ABK+3↑w
                                        ; DFTNK+23↑w ...
                                        ; $3F: Black tile
                .BYTE $5D,$15,$15,$44,$55,$14,$45,$54
                .BYTE $4D,$C1,  1,  4,$41,  7,$31,$C5
                .BYTE $15,$15,$54,$51,$14,$51,$54,$45
                .BYTE $AE,$AB,$EA,$AE,$BA,$AB,$EA,$BB
                .BYTE $6B,$DA,$69,$AA,$69,$B7,$69,$96
ABE:            .BYTE $3F,$3F,$3F,  3,  3,  3,$3F,$3F ; DATA XREF: ABK↑w
                                        ; DFTNK+5↑w
                                        ; $45:
                .BYTE $55,$55,$5D,$53,$7D,  0,$11,$40
                .BYTE $55,$55,$54,$11,$45,$C5,$11,  5
                .BYTE $55,$55,$55,$55,$55,$55,$55,$55
ABH:            .BYTE   3,  3, $F, $F,$3F,$3F,$FF,$FF
                                        ; DATA XREF: ABK+9↑w
                                        ; DFTNK+11↑w
                                        ; $49:
ABI:            .BYTE $FC,$FC,$F1,$F1,$C5,$C5,$15,$15
                                        ; DATA XREF: ABK+C↑w
                                        ; DFTNK+17↑w
                .BYTE $57,$57,$5F,$5F,$7F,$7F,$FF,$FF ; $4A:
                .BYTE $FD,$FD,$D5,$D5,$55,$55,$55,$55
                .BYTE $FF,$FF,$FF,$FF,$FD,$FD,$D5,$D5
                .BYTE $5F,$5F,$FF,$FF,$FF,$FF,$FF,$FF
ABG:            .BYTE $55,$55,$55,$55,$5F,$5F,$FF,$FF
                                        ; DATA XREF: ABK+6↑w DFTNK+B↑w
                .BYTE $FF,$FF,$FF,$EF,$EF, $B,$83,$8F ; $4F:
                .BYTE $FF,$FF,$FF,$BF,$EF,$BB,$2E,$CB
                .BYTE $2F,$BB,$2E,$CB,$F2,$FC,$FF,$FF
                .BYTE $BB,$A8,$A0,  3, $F,$CF,$FF,$FF
ABW:            .BYTE $A9,$A9,$A5,$A5,$95,$95,$55,$55 ; DATA XREF: ABV↑w
                                        ; DFBLDG+5↑w
                                        ; $54:
ACC:            .BYTE   0,  0,  0,  0,  0,  0,  0,  0
                                        ; DATA XREF: ABV+12↑w
                                        ; DFBLDG+29↑w
                                        ; $55:
ABX:            .BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
                                        ; DATA XREF: ABV+3↑w
                                        ; DFBLDG+B↑w
                                        ; $56:
ACE:            .BYTE $AA,$AA,$BE,$82,$82,$82,$BE,$AA
                                        ; DATA XREF: ABV+18↑w
                                        ; DFBLDG+35↑w
                                        ; $57:
ABY:            .BYTE   2,  2, $A, $A,$2A,$2A,$AA,$AA
                                        ; DATA XREF: ABV+6↑w
                                        ; DFBLDG+11↑w
                                        ; $58:
ACD:            .BYTE $54,$54,$50,$50,$40,$40,  0,  0
                                        ; DATA XREF: ABV+15↑w
                                        ; DFBLDG+2F↑w
                                        ; $59:
ABZ:            .BYTE $FD,$FD,$F5,$F5,$D5,$D5,$55,$55
                                        ; DATA XREF: ABV+9↑w
                                        ; DFBLDG+17↑w
                .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; $5A:
ACA:            .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                                        ; DATA XREF: ABV+C↑w
                                        ; DFBLDG+1D↑w
                                        ; $5C:
ACF:            .BYTE $FF,$FF,$FF,$C3,$C3,$C3,$FF,$FF
                                        ; DATA XREF: ABV+1B↑w
                                        ; DFBLDG+3B↑w
                                        ; $5D:
ACB:            .BYTE   3,  3, $F, $F,$3F,$3F,$FF,$FF
                                        ; DATA XREF: ABV+F↑w
                                        ; DFBLDG+23↑w
                .BYTE $20,$80,  2,$20,$88,  2,$88,$20 ; $5E:
                .BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
ACI:            .BYTE   2,  2, $A, $A,$2A,$2A,$AA,$AA
                                        ; DATA XREF: DFBLDG+E↑r
                .BYTE $EC,$B8,$E0,$B0,$C0,$80,  0,  0 ; $60:
AEF:            .BYTE $EE,$BB,$EE,$BB,$EE,$BB,$EE,$BB ; $62:
                .BYTE $FF,$FF,$FF,$EB,$EB,$EB,$FF,$FF
                .BYTE $AA,$AB,$AE,$AB,$AE,$BB,$EE,$BB
                .BYTE $FC,$FC,$F0,$F0,$C0,$C0,  0,  0
                .BYTE $77,$DD,$77,$DD,$77,$DD,$77,$DD
                .BYTE $74,$DC,$70,$D0,$40,$C0,  0,  0
                .BYTE $AB,$AB,$AF,$AF,$BF,$BF,$FF,$FF
                .BYTE $77,$DD,$77,$E9,$E9,$E9,$77,$DD
                .BYTE $AB,$A9,$A7,$AD,$B7,$9D,$77,$DD
                .BYTE $FF,$FF,$FF,$FE,$FE,$FC,$FF,$FF
                .BYTE $EA,$88,$8B,$A3,$AF, $F,$FF,$FF
                .BYTE $FF,$FF,$FF,$FD,$FD,$FC,$FF,$FF
                .BYTE $D5,$44,$47,$53,$5F, $F,$FF,$FF
                .BYTE $59,$59,$59,$59,$6A,$AE,$B6,$AA
                .BYTE $55,$55,$95,$66,$59,$5B,$66,$5A
                .BYTE $55,$55,$75,$E5,$7D,$AA,$66,$A9
                .BYTE $5D,$5D,$5D,$5D,$7F,$7F,$7F,$7F
                .BYTE $FD,$FD,$F5,$F5,$D5,$D5,$55,$55
                .BYTE $2A,$EA,$2E,$AA,$CA,$AA,$2A,$CB
                .BYTE $FB,$A8,$AA,$A3,$AB,$BB,$AA,$A8
                .BYTE $B2,$8C,$88,$33,$AA,$33,$EC,$82
                .BYTE $88,$32,$E0, $B,$BE,$43,$2C,$CE
                .BYTE $30,$C3,$F0,  3,$CC,$F0,$30,$CC
                .BYTE $33,$CC,$C3,$30,  3,$83,$CC,  3
                .BYTE $CF,$30,$3C,$F3,$2F,$CF,$F3,$CF
                .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
ABM:            .BYTE $55,$55,$55,$55,$5F,$5F,$FF,$FF
                                        ; DATA XREF: DFTNK+8↑r
                                        ; $7D:
AED:            .BYTE   0,  0,  0,  0,  0,  0,  0,  0
                                        ; DATA XREF: ADR+21↑w
                                        ; DFHNGR+5↑w
                                        ; $7E: Hangar (M) Black
ABS:            .BYTE $54,$54,$50,$50,$40,$40,  0,  0
                                        ; DATA XREF: ABK+12↑w
                                        ; DFTNK+29↑w
; end of 'CHBASE'                       ; $7F:

ANTIC screen memory
; ===========================================================================

; Segment type: Uninitialized
                ;.segment SCREENRAM
                * =  $6400
SC:             .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: RESET+FC↑t
                                        ; RESET+101↑t ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; Screen memory
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
byte_6441:      .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
byte_6482:      .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
byte_64C3:      .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: CNSL__CONSOLE+44↑w
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
SC_TOP_PLAYSCREEN:.BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: RESET+5F↑t
                                        ; RESET+63↑t ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
SC_STATUS_LINE: CONTROL_DISPLAY <?>     ; DATA XREF: RESET:AFZ↑t
                                        ; RESET+A8↑t ...
                .BYTE 0,0 ; (uninited)
SC_STATUS_TITLE:.BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: RESET+9A↑t
                                        ; RESET+9F↑t ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0 ; (uninited)
; end of 'SCREENRAM'

; PMBASE with ANTIC player missle graphics
; ===========================================================================

; Segment type: Uninitialized
                ;.segment PMBASE
                * =  $7000
PMBASE_:        .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: RESET+21A↑t
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
MISSLE:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: TRIG__TRIGGER_MACHINE_GUN+34↑w
                                        ; TRIG__TRIGGER_MACHINE_GUN+51↑w ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
P0:             .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: PROP+56↑w
                                        ; PROP+66↑w ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; Player Plane (WHITE parts)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
P1:             .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: DRP1+6↑w DRP1+C↑w ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; Player Plane (BLACK parts)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
P2:             .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: DRP23:JB↑t
                                        ; L6:ON↑r ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; Enemy (first color)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
P3:             .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                                        ; DATA XREF: DRP23+B7↑w
                                        ; L6+124↑r ...
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; Enemy (second color)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
; end of 'PMBASE'

; ===========================================================================

; Segment type: Regular
                ;.segment IO
                * =  $D000
HPOSP0:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+228↑w
                                        ; CE+A↑w ...
                                        ; Player Plane (Horizontal Position – first color)
HPOSP1:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+22B↑w
                                        ; CE+D↑w ...
                                        ; Player Plane (Horizontal Position – second color)
HPOSP2:         .BYTE 0 ; (uninited)    ; DATA XREF: TURN+178↑w
                                        ; DRP23+5A↑w ...
                                        ; Enemy (Horizontal Position – first color)
HPOSP3:         .BYTE 0 ; (uninited)    ; DATA XREF: TURN+BC↑w
                                        ; DRP23+5D↑w ...
                                        ; Enemy (Horizontal Position – second color)
P0PF_HPOSM0:    .BYTE 0 ; (uninited)    ; DATA XREF: TURN+16C↑r
                                        ; TRIG__TRIGGER_MACHINE_GUN+29↑w ...
                                        ; Player Machine Gun Bullet (Horizontal Position)
P1PF_HPOSM1:    .BYTE 0 ; (uninited)    ; DATA XREF: CKCOL:L2↑r PC+4↑w ...
                                        ; Missile 1 Horizontal Position / Player 1 to Playfield Collision
P2PF_HPOSM2:    .BYTE 0 ; (uninited)    ; DATA XREF: TURN+BF↑w
                                        ; TRIGB+28↑w ...
                                        ; Missile 2 Horizontal Position / Player 2 to Playfield Collision
P3PF_HPOSM3:    .BYTE 0 ; (uninited)    ; DATA XREF: ZZ:SX↑w
                                        ; FTNKGN-C4E↑w ...
                                        ; Missile 3 Horizontal Position / Player 3 to Playfield Collision
M0PL:           .BYTE 0 ; (uninited)    ; DATA XREF: COLM02+C↑r
                                        ; SHP23:_1↑r
                                        ; Missle to Player 0 Collision
M1PL:           .BYTE 0 ; (uninited)    ; DATA XREF: BMBSHP+6↑r
                                        ; BMCPTL:_1↑r ...
                                        ; Missle to Player 1 Collision
M2PL_SIZEP2:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1D3↑w
                                        ; COLM20↑r ...
                                        ; Missle to Player 2 Collision / Player 2 Size
M3PL_SIZEP3:    .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1D6↑w
                                        ; COLM30↑r ...
                                        ; Missle to Player 3 Collision / Player 3 Size
SIZEM:          .BYTE 0 ; (uninited)    ; DATA XREF: RESET+1B9↑w
                                        ; SR+1C↑w ...
                                        ; Missle Size
P1PL:           .BYTE 0 ; (uninited)    ; DATA XREF: P0SHP↑r COLCPTL↑r
                                        ; Player Graphics Register 0
P2PL:           .BYTE 0 ; (uninited)    ; DATA XREF: COLP02↑r
                                        ; Player Graphics Register 1
                ; 0 .BYTE uninited & unexplored
                ; 0 .BYTE uninited & unexplored
                ; 0 .BYTE uninited & unexplored
                ; 0 .BYTE uninited & unexplored ; Player-Missle Color 0
                ; 0 .BYTE uninited & unexplored ; Player-Missle Color 1
                ; 0 .BYTE uninited & unexplored ; Player-Missle Color 2
                ; 0 .BYTE uninited & unexplored ; Player-Missle Color 3
                .BYTE 0 ; (uninited)    ; Playfield Color 0
COLPF1:         .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+19↑w
                                        ; Playfield Color 1
COLPF2:         .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+1E↑w
                                        ; Playfield Color 2
COLPF3:         .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+16↑w
                                        ; Playfield Color 3
COLBK:          .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+B↑w
                                        ; DLIR1__DLIST_DURING_MENU+6↑w
                                        ; Background Color
                .BYTE 0,0 ; (uninited)
GRACTL:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+221↑w
                                        ; Graphics Control Register
HITCLR:         .BYTE 0 ; (uninited)    ; DATA XREF: EB+C3↑w TIMER+2↑w
                                        ; write to HITCLR clears all of the collision registers.
CONSOL:         .BYTE 0 ; (uninited)    ; DATA XREF: CNSL__CONSOLE↑r
                                        ; MENU__CHECK_KEYS↑r
                                        ; Console Switch Port
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
AUDF1:          .BYTE 0 ; (uninited)    ; DATA XREF: RESET+185↑w
                                        ; EB+7D↑w ...
                                        ; Audio 1 Frequency Register
AUDC1:          .BYTE 0 ; (uninited)    ; DATA XREF: EB+94↑w TURN+F6↑w ...
                                        ; Audio 1 Channel Control Register
AUDF2:          .BYTE 0 ; (uninited)    ; DATA XREF: PC+1F↑w Y8+A↑w ...
                                        ; Audio 2 Frequency Register
AUDC2:          .BYTE 0 ; (uninited)    ; DATA XREF: PC+27↑w AFP+6↑w ...
                                        ; Audio 2 Channel Control Register
AUDF3:          .BYTE 0 ; (uninited)    ; DATA XREF: EB+82↑w XSND+F↑w ...
                                        ; Audio 3 Frequency Register
AUDC3:          .BYTE 0 ; (uninited)    ; DATA XREF: XSND+34↑w XXX+6↑w ...
                                        ; Audio 3 Channel Control Register
AUDF4:          .BYTE 0 ; (uninited)    ; DATA XREF: REFUEL+3F↑w
                                        ; REFUEL+4D↑w ...
                                        ; Audio 4 Frequency Register
AUDC4:          .BYTE 0 ; (uninited)    ; DATA XREF: TURN+F9↑w
                                        ; PLFWD+187↑w ...
                                        ; Audio 4 Channel Control Register
AUDCTL:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+2A↑w
                                        ; _1__SOUND_TIMER_IRQ+C↑w
                                        ; Audio Control Register
                .BYTE 0 ; (uninited)
RANDOM:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+12B↑r
                                        ; RESET+15B↑r ...
                                        ; Random Number Generator
                .BYTE 0,0,0,0 ; (uninited)
SKSTAT:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+2F↑w
                                        ; _1__SOUND_TIMER_IRQ+7↑w
                                        ; Serial Port control Register
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0 ; (uninited)
PACTL:          .BYTE 0 ; (uninited)    ; DATA XREF: BOOT_CONTINUE+48↑w
                                        ; Port A Control Register
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0 ; (uninited)
HSCROL:         .BYTE 0 ; (uninited)    ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+1D↑w
                                        ; VBIR__DEFERRED_VBL_DRAW+43↑w ...
                                        ; Horizontal Scroll Register
VSCROL:         .BYTE 0 ; (uninited)    ; DATA XREF: VBIR__DEFERRED_VBL_DRAW+21↑w
                                        ; VBIR__DEFERRED_VBL_DRAW+47↑w
                                        ; Vertical Scroll Register
                ; 0 .BYTE uninited & unexplored
PMBASE:         .BYTE 0 ; (uninited)    ; DATA XREF: RESET+21C↑w
                                        ; Player-Missile Address Base Register
                ; 0 .BYTE uninited & unexplored
CHBASE:         .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+E↑w
                                        ; Character Address Base Register
WSYNC:          .BYTE 0 ; (uninited)    ; DATA XREF: VDSLST_ROUTINE+8↑w
                                        ; DLIR1__DLIST_DURING_MENU+3↑w
                                        ; Wait for Horizontal Blank Synchronisation
                .BYTE 0,0,0 ; (uninited)
NMIEN:          .BYTE 0 ; (uninited)    ; DATA XREF: RESET+E5↑w
                                        ; EB+C0↑w ...
                                        ; $80: DL IRQ enabled, $40: VBL IRQ enabled
                .BYTE 0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
; end of 'IO'

; ===========================================================================

; Segment type: Regular
                ;.segment ROM
                * =  $D800
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
EDITRV:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; EDITOR
SCRENV:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; TELEVISION SCREEN
KEYBDV:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; KEYBOARD
PRINTV:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; PRINTER
CASETV:         .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited) ; CASSETTE
DISKIW:         .BYTE 0,0,0 ; (uninited) ; DISK INITIALIZATION
DSKINV:         .BYTE 0,0,0 ; (uninited) ; DISK INTERFACE
CIOV:           .BYTE 0,0,0 ; (uninited) ; CENTRAL INPUT OUTPUT ROUTINE
SIOV:           .BYTE 0,0,0 ; (uninited) ; CODE XREF: READ_BLOCK+B↑p
                                        ; SERIAL INPUT OUTPUT ROUTINE
SETVBV:         .BYTE 0,0,0 ; (uninited) ; CODE XREF: EB+BB↑p
                                        ; TIMER+9↑p ...
                                        ; SET SYSTEM TIMERS ROUTINE
SYSVBV:         .BYTE 0,0,0 ; (uninited) ; SYSTEM VERTICAL BLANK CALCULATIONS
XITVBV:         .BYTE 0,0,0 ; (uninited) ; CODE XREF: XSND:PV↑j
                                        ; XSND+3F↑j
                                        ; DATA XREF: ...
                                        ; EXIT VERTICAL BLANK CALCULATIONS
SIOINV:         .BYTE 0,0,0 ; (uninited) ; SERIAL, INPUT OUTPUT INITIALIZATION
SENDEV:         .BYTE 0,0,0 ; (uninited) ; SEND ENABLE ROUTINE
INTINV:         .BYTE 0,0,0 ; (uninited) ; INTERRUPT HANDLER INITIALIZATION
CIOINV:         .BYTE 0,0,0 ; (uninited) ; CENTRAL INPUT OUTPUT INITIALIZATION
BLKBDV:         .BYTE 0,0,0 ; (uninited) ; BLACKBOARD MODE
WARMSV:         .BYTE 0,0,0 ; (uninited) ; WARM START ENTRY POINT
COLDSV:         .BYTE 0,0,0 ; (uninited) ; COLD START ENTRY POINT
RBLOKV:         .BYTE 0,0,0 ; (uninited) ; CASSETTE READ BLOCK ENTRY POINT VECTOR
CSOPIV:         .BYTE 0,0,0 ; (uninited) ; CASSETTE OPEN FOR INPUT VECTOR
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
                .BYTE 0,0,0,0,0,0,0,0,0,0,0,0 ; (uninited)
BRK:            .BYTE 0,0 ; (uninited)  ; DATA XREF: READ_BLOCK+10↑r
                .BYTE 0,0 ; (uninited)
; end of 'ROM'


                .END
