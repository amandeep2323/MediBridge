# MediBridge Startup Guide

## 🚀 How to Start the Application

### ⭐ Recommended: Simple Startup

**Just double-click:** `startup-simple.bat`

This is the most reliable method. It will:
- ✅ Open backend server window
- ✅ Open frontend server window  
- ✅ No complex checks that might fail

---

## 📋 All Startup Options

### Option 1: startup-simple.bat ⭐ RECOMMENDED
- **Best for:** Quick start without checks
- **Method:** Double-click the file
- **What it does:** Just starts both servers
- **Reliability:** High (minimal error points)

### Option 2: startup.bat
- **Best for:** Checking system requirements first
- **Method:** Double-click the file
- **What it does:** Checks Node.js, MySQL, then starts servers
- **Reliability:** Medium (may have path issues)

### Option 3: startup.ps1
- **Best for:** PowerShell users
- **Method:** Right-click → "Run with PowerShell"
- **Alternative:** `powershell -ExecutionPolicy Bypass -File startup.ps1`
- **What it does:** Full checks with colored output
- **Reliability:** High (better error handling)

### Option 4: Manual Start
```bash
# Terminal 1
cd backend
npm run dev

# Terminal 2 (new terminal)
cd frontend
npm run dev
```

---

## ❌ If Startup Script Crashes

### Problem: Script opens and closes immediately

**Quick Fix:** Use `startup-simple.bat` instead

**Detailed Troubleshooting:**

1. **Check if XAMPP MySQL path is correct**
   ```batch
   # Open Command Prompt and test:
   "C:\xampp\mysql\bin\mysql.exe" --version
   ```
   If this fails, MySQL might be in a different location

2. **Run in Command Prompt to see errors**
   ```batch
   cd C:\Users\HP\Downloads\medibridge
   startup-simple.bat
   ```
   This way you can see error messages before the window closes

3. **Check Node.js is working**
   ```batch
   node --version
   npm --version
   ```

4. **Use PowerShell startup instead**
   - Right-click `startup.ps1`
   - Select "Run with PowerShell"
   - Or open PowerShell and run:
     ```powershell
     powershell -ExecutionPolicy Bypass -File startup.ps1
     ```

---

## 🔍 What Each Startup File Does

### startup-simple.bat
```
1. Shows startup message
2. Starts backend in new window
3. Waits 2 seconds
4. Starts frontend in new window
5. Done!
```
**Pros:** Fast, reliable, no complex checks  
**Cons:** Won't warn if MySQL is not running

### startup.bat
```
1. Checks if Node.js is installed
2. Checks if MySQL is running
3. Checks if node_modules exist
4. Creates .env files if missing
5. Starts backend in new window
6. Starts frontend in new window
```
**Pros:** Comprehensive checks, helpful warnings  
**Cons:** More complex, more potential failure points

### startup.ps1
```
1. Checks Node.js (with colors)
2. Checks MySQL (with colors)
3. Shows login credentials
4. Starts both servers in PowerShell windows
```
**Pros:** Better error handling, colored output  
**Cons:** Requires PowerShell, may need execution policy change

---

## ✅ After Servers Start

### You should see TWO new windows:

**Window 1: "MediBridge Backend"**
```
> medibridge-backend@1.0.0 dev
> node --watch src/server.js

MediBridge API running on port 5000
Scheduled jobs started
```

**Window 2: "MediBridge Frontend"**
```
> medibridge-frontend@1.0.0 dev
> vite

VITE v5.4.21  ready in 1624 ms

➜  Local:   http://localhost:5173/
➜  Network: use --host to expose
```

### Then open your browser:
- Go to: **http://localhost:5173**
- Login with: `patient@medibridge.test` / `Password@123`

---

## 🛑 How to Stop Servers

### Method 1: Close the windows
- Click X on "MediBridge Backend" window
- Click X on "MediBridge Frontend" window

### Method 2: Use Ctrl+C
- Press `Ctrl+C` in each server window
- Type `Y` when asked to terminate

### Method 3: Use shutdown.bat
- Double-click `shutdown.bat`
- It will kill all server processes

---

## 🔧 Common Issues

### Issue: "Node is not recognized"
**Solution:** Node.js is not installed or not in PATH
- Install from: https://nodejs.org/
- Restart terminal after installation

### Issue: "MySQL connection failed" 
**Solution:** 
- Open XAMPP Control Panel
- Click "Start" next to MySQL
- Wait for it to turn green
- Try starting again

### Issue: "Port 5000 already in use"
**Solution:**
```powershell
# Find what's using port 5000
netstat -ano | findstr :5000

# Kill the process (replace PID with actual number)
taskkill /F /PID <PID>
```

### Issue: "Port 5173 already in use"
**Solution:**
```powershell
# Find what's using port 5173
netstat -ano | findstr :5173

# Kill the process
taskkill /F /PID <PID>
```

### Issue: Windows asks "How do you want to open this file?"
**Solution:**
- Right-click the .bat file
- Select "Run as administrator" or "Open"
- Don't try to "Open with" - just run it

---

## 💡 Best Practice Workflow

1. **First time setup:**
   ```
   ✓ Make sure XAMPP MySQL is running (green)
   ✓ Double-click startup-simple.bat
   ✓ Wait for both windows to show "ready"
   ✓ Open http://localhost:5173
   ```

2. **Daily development:**
   ```
   ✓ Start XAMPP MySQL (if not auto-start)
   ✓ Double-click startup-simple.bat
   ✓ Start coding!
   ```

3. **When done:**
   ```
   ✓ Close both server windows OR
   ✓ Double-click shutdown.bat
   ```

---

## 📞 Still Having Issues?

Try manual start to see detailed errors:

```bash
# Open Command Prompt or PowerShell
cd C:\Users\HP\Downloads\medibridge

# Start backend
cd backend
npm run dev
# (Keep this running, open NEW terminal)

# Start frontend (in new terminal)
cd C:\Users\HP\Downloads\medibridge\frontend
npm run dev
```

This way you can see exactly what error occurs!

---

**Summary: Use `startup-simple.bat` for most reliable startup!**
