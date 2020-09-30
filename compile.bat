del libultiboDoom.a
arm-none-eabi-gcc -DUltibo -D_POSIX_THREADS -O3 -mabi=aapcs -marm -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard -D__DYNAMIC_REENT__ -c doomgeneric/*.c
arm-none-eabi-ar rcs libultiboDoom.a *.o
@echo off
del kernel7.img
del *.o
del *.ppu
c:\Ultibo\Core\fpc\3.1.1\bin\i386-win32\fpc -B -Tultibo -Parm -CpARMV7A -WpRPI3B @c:\Ultibo\Core\fpc\3.1.1\bin\i386-win32\RPI3.CFG -O2 -dPLATFORM_PI3 ultiboDoomGen.lpr
echo Done.
echo copying kernel to image Dir
copy kernel7.img ultiboCgenericImage
echo copying kernel to SD
copy kernel7.img G:\
del kernel7.img