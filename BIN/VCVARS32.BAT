@echo off
rem
rem Root of Visual C++ installed files.
rem     Note: This batch file will not work on Windows NT if MSDevDir contains spaces.
rem
rem set MSDevDir=C:\MSDEV
set MSDevDir=%~dp0\..

rem
rem Root of Visual C++ files on cd-rom.
rem Remove "set vcsource=" if you don't want include cdrom in Visual C++ environment.
rem
rem set vcsource=D:\MSDEV

rem
rem VcOsDir is used to help create either a Windows 95 or Windows NT specific path.
rem
set VcOsDir=WIN95
if "%OS%" == "Windows_NT" set VcOsDir=WINNT

rem
echo Setting environment for building x86 target
rem
if "%vcsource%" == "" goto x86main
rem
rem Include cdrom files in environment.
rem
if "%OS%" == "Windows_NT" set PATH=%vcsource%\BIN;%vcsource%\BIN\%VcOsDir%;%PATH%
if "%OS%" == "" set PATH="%vcsource%\BIN";"%vcsource%\BIN\%VcOsDir%";"%PATH%"
set INCLUDE=%vcsource%\INCLUDE;%vcsource%\MFC\INCLUDE;%INCLUDE%
set LIB=%vcsource%\LIB;%vcsource%\MFC\LIB;%LIB%
set vcsource=

:x86main
if "%OS%" == "Windows_NT" set PATH=%MSDevDir%\BIN;%MSDevDir%\BIN\%VcOsDir%;%PATH%
if "%OS%" == "" set PATH="%MSDevDir%\BIN";"%MSDevDir%\BIN\%VcOsDir%";"%PATH%"
set INCLUDE=%MSDevDir%\INCLUDE;%MSDevDir%\MFC\INCLUDE;%INCLUDE%
set LIB=%MSDevDir%\LIB;%MSDevDir%\MFC\LIB;%LIB%
goto done

:done
set VcOsDir=
