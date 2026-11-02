@echo off
REM MediBridge Startup Script
REM This script starts both the frontend and backend servers

echo ========================================
echo   MediBridge Healthcare System
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo [INFO] Node.js found: 
node --version
echo.

REM Check if MySQL is running (via XAMPP) - but don't fail if not found
echo [INFO] Checking MySQL connection...
set MYSQL_RUNNING=0

REM Try common XAMPP locations
if exist "C:\xampp\mysql\bin\mysql.exe" (
    "C:\xampp\mysql\bin\mysql.exe" -u root -e "SELECT 1;" >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        set MYSQL_RUNNING=1
        echo [OK] MySQL is running
    )
)

if %MYSQL_RUNNING% EQU 0 (
    echo [WARNING] MySQL connection could not be verified
    echo Make sure MySQL is running in XAMPP Control Panel
    echo.
)

echo.

REM Check if dependencies are installed
if not exist "backend\node_modules\" (
    echo [INFO] Installing backend dependencies...
    cd backend
    call npm install
    if %ERRORLEVEL% NEQ 0 (
        echo [ERROR] Failed to install backend dependencies
        cd ..
        pause
        exit /b 1
    )
    cd ..
)

if not exist "frontend\node_modules\" (
    echo [INFO] Installing frontend dependencies...
    cd frontend
    call npm install
    if %ERRORLEVEL% NEQ 0 (
        echo [ERROR] Failed to install frontend dependencies
        cd ..
        pause
        exit /b 1
    )
    cd ..
)

REM Check if .env files exist
if not exist "backend\.env" (
    echo [INFO] Creating backend .env file...
    copy backend\.env.example backend\.env >nul
)

if not exist "frontend\.env" (
    echo [INFO] Creating frontend .env file...
    copy frontend\.env.example frontend\.env >nul
)

echo ========================================
echo   Starting Servers
echo ========================================
echo.
echo [Backend]  http://localhost:5000/api/health
echo [Frontend] http://localhost:5173
echo.
echo Demo Logins (password: Password@123):
echo   - Patient:    patient@medibridge.test
echo   - Doctor:     anita@medibridge.test
echo   - Pharmacist: pharmacist@medibridge.test
echo   - Admin:      admin@medibridge.test
echo.
echo Press Ctrl+C in server windows to stop
echo ========================================
echo.

REM Start backend in a new window
echo [INFO] Starting backend server...
start "MediBridge Backend" cmd /k "cd /d "%~dp0backend" && npm run dev"

REM Wait a moment for backend to start
echo [INFO] Waiting for backend to initialize...
timeout /t 3 /nobreak >nul

REM Start frontend in a new window
echo [INFO] Starting frontend server...
start "MediBridge Frontend" cmd /k "cd /d "%~dp0frontend" && npm run dev"

echo.
echo [SUCCESS] Servers are starting in separate windows!
echo.
echo Check the new command windows for server output:
echo   - "MediBridge Backend" window
echo   - "MediBridge Frontend" window
echo.
echo You can close this window now.
echo The servers will continue running in their own windows.
echo.
pause
