# MediBridge PowerShell Startup Script
# Run this with: powershell -ExecutionPolicy Bypass -File startup.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   MediBridge Healthcare System" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Node.js
Write-Host "[INFO] Checking Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "[OK] Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Node.js is not installed!" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""

# Check MySQL
Write-Host "[INFO] Checking MySQL connection..." -ForegroundColor Yellow
$mysqlPath = "C:\xampp\mysql\bin\mysql.exe"
if (Test-Path $mysqlPath) {
    try {
        & $mysqlPath -u root -e "SELECT 1;" 2>$null | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] MySQL is running" -ForegroundColor Green
        } else {
            Write-Host "[WARNING] MySQL is not responding" -ForegroundColor Yellow
            Write-Host "Make sure MySQL is started in XAMPP Control Panel" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "[WARNING] Could not verify MySQL" -ForegroundColor Yellow
    }
} else {
    Write-Host "[WARNING] XAMPP MySQL not found at default location" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Starting Servers" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Green
Write-Host "Frontend: http://localhost:5173" -ForegroundColor Green
Write-Host ""
Write-Host "Demo Logins (password: Password@123):" -ForegroundColor Yellow
Write-Host "  - Patient:    patient@medibridge.test"
Write-Host "  - Doctor:     anita@medibridge.test"
Write-Host "  - Pharmacist: pharmacist@medibridge.test"
Write-Host "  - Admin:      admin@medibridge.test"
Write-Host ""

# Get script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start backend
Write-Host "[INFO] Starting backend server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptDir\backend'; npm run dev" -WindowStyle Normal

# Wait for backend to initialize
Start-Sleep -Seconds 3

# Start frontend
Write-Host "[INFO] Starting frontend server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptDir\frontend'; npm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "[SUCCESS] Servers are starting in separate windows!" -ForegroundColor Green
Write-Host ""
Write-Host "You can close this window. Servers will continue running." -ForegroundColor Cyan
Write-Host ""
pause
