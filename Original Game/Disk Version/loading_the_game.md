# Blue Max Floppy Version loading

This is the order in which the game is loaded:

- READ SECTOR ADDR:$0580 SECTOR:  1 Bootsector. Read #19 and #20, continue in #20
- READ SECTOR ADDR:$0100 SECTOR: 19 Read at the beginning of the STACK (for RTS obfustication)
- READ SECTOR ADDR:$0700 SECTOR: 20 Read #32, also contains text for the screen and the VBIR. Continues in #32
- READ SECTOR ADDR:$0800 SECTOR: 32 Read #21 and contains the ROM version check, which was disabled in later versions of the game – probably because of compatibly issues. Continues in #21
- READ SECTOR ADDR:$0880 SECTOR: 21 Read #18, executes it, read #717-720, executes it.
- READ SECTOR ADDR:$7000 SECTOR: 18 Setup the boot screen, check for ROM cartridge
- READ SECTOR ADDR:$0900-$0aff SECTOR:717-720 (4 Sectors) contains obfuscated loading code. Read #616, continues in #616.
- READ SECTOR ADDR:$0b00 SECTOR:616 Read #617, Read #110-#173, continues in #617.
- READ SECTOR ADDR:$0b80 SECTOR:617 Disk skew protection check by reading #454-#543, read #380-#406, read #176. Continue at the main game.
- READ SECTOR $0C00…$2bff Sector 110-173 (64 Sectors from Track 6-9) from $0b0f – game code
- READ SECTOR $2C00…$58ff Sector 454-543 (90 Sectors from Track 25-30) from $0b80 with skew protection – game code

All sectors 469/470, 487/488, 505/506, 523/524 have to have 8 other sectors between them for the timing to be correct.

- READ SECTOR $5280…$5fff Sector 380-406 (27 Sectors from Track 21-22) from $0b96 – game code
- READ SECTOR ADDR:$0900 SECTOR:176 from $0bb5 copy protection code at the beginning of the game

$0BCD => JMP $0C00 (this is where the main game start)

It now immediately JSR $900 to check the other two protections:

- READ SECTOR ADDR:$0800 BYTES:$0080 SECTOR: 98 => copy protection

The copy protection for sector 98 is trivial. It has to return a read error (STATUS = $08).

- READ SECTOR ADDR:$0800 BYTES:$0080 SECTOR: 80 copy protection
- READ SECTOR ADDR:$0880 BYTES:$0080 SECTOR: 97 copy protection

Sector 97 exists 8 times in track 5. However only one of these has the correct content, which can only be read by reading sector 80 on track 4, step to track 5 and then read sector 80 immediately.

This protection was disabled in a later version (which is my copy) of the game. Probably the seek time was too much of a variable between all the different drive versions to be a reliable check.
