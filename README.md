# Atari Blue Max

Blue Max for the Atari 400/800. The tape version.

A small loader at $700 with a progress display is started and then loading the main game in 1k chunks in _reverse_. The last chunk is only 512 bytes large. The game then starts at $C00.

- `convertCASLIST.py` shows the content of the CAS file.
- `convertCAS2BIN.py` extracts the two binaries (the loader and the main game). `BlueMax.xex` can be executed in any emulator.
