@echo off
REM MediBridge Shutdown Script
REM This script stops the frontend and backend servers

echo ========================================
echo   Stopping MediBridge Servers
echo ========================================
echo.

REM Kill Node.js processes running the dev servers
echo [INFO] Stopping backend server...
taskkill /FI "WindowTitle eq MediBridge Backend*" /F >nul 2>nul

echo [INFO] Stopping frontend server...
taskkill /FI "WindowTitle eq MediBridge Frontend*" /F >nul 2>nul

REM Also kill any node processes on ports 5000 and 5173
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000') do taskkill /F /PID %%a >nul 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5173') do taskkill /F /PID %%a >nul 2>nul

echo.
echo [OK] Servers stopped
echo.
pause
