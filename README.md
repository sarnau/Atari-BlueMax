# Atari Blue Max

Blue Max for the Atari 400/800. The tape version.

A small loader at $700 with a progress display is started and then loading the main game in 1k chunks in _reverse_. The last chunk is only 512 bytes large. The game then starts at $C00.

- `convertCASLIST.py` shows the content of the CAS file.
- `convertCAS2BIN.py` extracts the two binaries (the loader and the main game).
- `BlueMax.xex` can be executed in any emulator.

## Original Source Code

The folder `Original Source Code` contains the original source code for Blue Max Atari, the floppy disk version – with copy protection. More details in that folder.


## Display List before the normal game:

	$5280: 6 BLANK
	$5281: 6 BLANK
	$5282: LMS 6441 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$5285: LMS 6482 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$5288: LMS 64c3 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$528B: LMS 6504 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$528E: LMS 6545 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$5291: LMS 6586 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$5294: LMS 65c7 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$5297: LMS 6608 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$529A: LMS 6649 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$529D: LMS 668a VSCROL HSCROL MODE 4 - Text (40,5,8) = 23 lines * 8 = 184 pixel
	$52A0: LMS 66cb VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52A3: LMS 670c VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52A6: LMS 674d VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52A9: LMS 678e VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52AC: LMS 67cf VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52AF: LMS 6810 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52B2: LMS 6851 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52B5: LMS 6892 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52B8: LMS 68d3 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52BB: LMS 6914 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52BE: LMS 6955 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52C1: LMS 6996 VSCROL HSCROL MODE 4 - Text (40,5,8)
	$52C4: LMS 69d7 HSCROL MODE 4 - Text (40,5,8)
	$52C7: DLI 1 BLANK
	$52C8: 3 BLANK
	$52C9: LMS 6a90 MODE 6 - Text (20,5,8)
	$52CC: MODE 6 - Text (20,5,8)
	$52CD: MODE 6 - Text (20,5,8)
	$52CE: JVB 5280 

	$5280 : 50 50 74 41 64 74 82 64 74 C3 64 74 04 65 74 45
	$5290 : 65 74 86 65 74 C7 65 74 08 66 74 49 66 74 8A 66
	$52A0 : 74 CB 66 74 0C 67 74 4D 67 74 8E 67 74 CF 67 74
	$52B0 : 10 68 74 51 68 74 92 68 74 D3 68 74 14 69 74 55
	$52C0 : 69 74 96 69 54 D7 69 80 20 46 90 6A 06 06 41 80
	$52D0 : 52
