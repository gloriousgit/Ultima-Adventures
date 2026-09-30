@echo off
REM Launch the ClassicUO client against the local HopeUO dev server (127.0.0.1:2593).
REM Client data lives in Client\Data Files (not in git - extracted from the UA 2.22 package).
setlocal
set "DATA=%~dp0Client\Data Files"
set "ULCACHE=%ProgramData%\HopeUO"

REM UltimaLive keeps a per-shard copy of the maps in %ProgramData%\<shard id>. This ClassicUO
REM build creates that copy from BLANK maps, so everything beyond the blocks the server streams
REM around you renders black. Seed it once from the real map files.
if not exist "%ULCACHE%\.seeded" (
	echo Seeding UltimaLive map cache in "%ULCACHE%"...
	if not exist "%ULCACHE%" mkdir "%ULCACHE%"
	for %%N in (0 1 2 3 4 5 33 34 35 36) do (
		if exist "%DATA%\map%%N.mul"     copy /y "%DATA%\map%%N.mul"     "%ULCACHE%\" >nul
		if exist "%DATA%\staidx%%N.mul"  copy /y "%DATA%\staidx%%N.mul"  "%ULCACHE%\" >nul
		if exist "%DATA%\statics%%N.mul" copy /y "%DATA%\statics%%N.mul" "%ULCACHE%\" >nul
	)
	echo seeded> "%ULCACHE%\.seeded"
)

cd /d "%~dp0Client\ClassicUO Launcher\ClassicUO"
start "" ClassicUO.exe
