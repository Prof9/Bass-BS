@echo off
grit\grit.exe secretchip.png -pT15 -ftb -fh!
armips\armips.exe bassgs.asm
if errorlevel 1 pause