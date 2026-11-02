@echo off
REM Simple MediBridge Startup Script
REM Minimal checks, just starts the servers

title MediBridge Startup

echo Starting MediBridge Healthcare System...
echo.
echo Backend will run on: http://localhost:5000
echo Frontend will run on: http://localhost:5173
echo.

REM Start backend
start "MediBridge Backend" cmd /k "cd /d "%~dp0backend" && npm run dev"

REM Wait 2 seconds
timeout /t 2 /nobreak >nul

REM Start frontend
start "MediBridge Frontend" cmd /k "cd /d "%~dp0frontend" && npm run dev"

echo.
echo Servers are starting in separate windows!
echo.
echo Demo Login: patient@medibridge.test / Password@123
echo.
pause
