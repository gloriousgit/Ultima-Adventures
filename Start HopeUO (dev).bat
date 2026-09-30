@echo off
REM HopeUO development server
REM -debug compiles scripts with debug info so crash logs include file/line numbers.
REM Listens on port 2593 (clients) and 2594 (UO Architect).
cd /d "%~dp0"
title HopeUO Server (dev)
"HopeUO Server.exe" -debug
pause
