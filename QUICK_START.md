# MediBridge - Quick Start Guide

## 🚀 Starting the Application

### Prerequisites
1. **XAMPP Running** - Make sure MySQL is started in XAMPP Control Panel
2. **Node.js Installed** - Already verified (v24.13.0)

### Option 1: Using Startup Script (Recommended)

**Choose one of these startup methods:**

**A) Simple Startup (Most Reliable)**
```bash
# Double-click:
startup-simple.bat
```

**B) Full Startup (With Checks)**
```bash
# Double-click:
startup.bat
```

**C) PowerShell Startup (Alternative)**
```powershell
# Right-click startup.ps1 → Run with PowerShell
# OR run in terminal:
powershell -ExecutionPolicy Bypass -File startup.ps1
```

All methods will:
- Start backend on http://localhost:5000
- Start frontend on http://localhost:5173
- Open both in separate command windows

### Option 2: Manual Start
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend  
cd frontend
npm run dev
```

---

## 🔑 Demo Login Credentials

**All accounts use the same password:** `Password@123`

| Role | Email | Access Level |
|------|-------|--------------|
| **Patient** | patient@medibridge.test | Book appointments, view records |
| **Doctor** | anita@medibridge.test | Manage appointments, prescriptions |
| **Pharmacist** | pharmacist@medibridge.test | Inventory, prescriptions |
| **Admin** | admin@medibridge.test | Full system access |

---

## 🌐 Access URLs

- **Frontend (React):** http://localhost:5173
- **Backend API:** http://localhost:5000/api
- **Health Check:** http://localhost:5000/api/health

---

## 🛑 Stopping the Application

### Option 1: Using Shutdown Script
```bash
shutdown.bat
```

### Option 2: Manual Stop
- Close the command windows or press `Ctrl+C` in each terminal

---

## 📊 Key Features to Test

### As Patient
1. Login → Dashboard
2. Search doctors by specialty/hospital
3. Book appointment
4. View medical records
5. Upload/download documents

### As Doctor (anita@medibridge.test)
1. Login → Doctor Dashboard
2. View appointments
3. Manage schedule/availability
4. Create consultation records
5. Write prescriptions

### As Pharmacist
1. Login → Pharmacist Dashboard
2. Review prescriptions
3. Manage inventory
4. Dispense medications
5. View low stock alerts

### As Admin
1. Login → Admin Dashboard
2. Manage users (verify doctors)
3. View system analytics
4. Generate reports
5. Configure system settings

---

## 🔧 Troubleshooting

### Backend won't start
```bash
# Check if MySQL is running
C:\xampp\mysql\bin\mysql.exe -u root -e "SELECT 1;"

# Check backend logs in the command window
```

### Frontend won't start
```bash
# Port might be in use
netstat -ano | findstr :5173
# Kill the process if needed
taskkill /F /PID <process_id>
```

### Database connection errors
1. Verify XAMPP MySQL is running (green in XAMPP Control Panel)
2. Check `backend/.env` has correct DB credentials
3. Default: `DB_USER=root`, `DB_PASSWORD=` (empty)

### "Module not found" errors
```bash
# Reinstall dependencies
cd backend
npm install

cd ../frontend
npm install
```

---

## 📁 Project Structure

```
medibridge/
├── backend/           # Express REST API
│   ├── src/          # Source code
│   ├── db/           # Database schema & seed
│   └── tests/        # Unit tests
├── frontend/         # React frontend
│   └── src/          # React components
├── startup.bat       # Start both servers
├── shutdown.bat      # Stop both servers
└── TEST_RESULTS.md   # Test verification
```

---

## 🧪 Running Tests

```bash
# Backend unit tests
cd backend
npm test
```

---

## 📝 Development Notes

- **Hot Reload:** Both servers support hot reload (changes auto-refresh)
- **Database:** Uses MySQL via XAMPP
- **API Docs:** Check backend routes in `backend/src/routes/`
- **Components:** Frontend components in `frontend/src/components/`

---

## 🎯 Next Steps

1. ✅ Start servers using `startup.bat`
2. ✅ Open http://localhost:5173 in browser
3. ✅ Login with any demo account
4. ✅ Explore the features
5. ✅ Check the code structure

**Everything is ready to go!** 🚀

For detailed information, see:
- Full README: `README.md`
- Test Results: `TEST_RESULTS.md`
