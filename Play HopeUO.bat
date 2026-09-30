@echo off
REM Launch the ClassicUO client against the local HopeUO dev server (127.0.0.1:2593).
REM Client data lives in Client\Data Files (not in git - extracted from the UA 2.22 package).
cd /d "%~dp0Client\ClassicUO Launcher\ClassicUO"
start "" ClassicUO.exe
