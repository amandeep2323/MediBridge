# 🔐 MediBridge - Login Credentials

## 🌐 Frontend URL
**http://localhost:5173**

---

## 👥 All Demo User Accounts

### 🔑 Common Password for ALL Accounts
```
Password@123
```

---

## 👨‍⚕️ ADMIN Login

### Admin User
- **Email:** `admin@medibridge.test`
- **Password:** `Password@123`
- **Name:** Admin User
- **Role:** Administrator

**Admin Can Access:**
- ✅ Full system access
- ✅ User management (create, edit, delete users)
- ✅ Doctor verification and approval
- ✅ Hospital and department management
- ✅ View all appointments (non-clinical data)
- ✅ Inventory monitoring
- ✅ System analytics and reports
- ✅ Audit logs
- ✅ Feedback moderation
- ✅ System settings configuration
- ✅ Staff role changes

---

## 🩺 DOCTOR Logins

### Doctor 1: Dr. Anita Sharma
- **Email:** `anita@medibridge.test`
- **Password:** `Password@123`
- **Name:** Dr. Anita Sharma
- **Role:** Doctor

**Doctor Can Access:**
- ✅ View and manage appointments
- ✅ Set availability and schedule
- ✅ Create consultation records
- ✅ Write prescriptions
- ✅ View authorized patient records
- ✅ Manage weekly hours and breaks
- ✅ Block dates for leave
- ✅ View appointment analytics

### Doctor 2: Dr. Vikram Singh
- **Email:** `vikram@medibridge.test`
- **Password:** `Password@123`
- **Name:** Dr. Vikram Singh
- **Role:** Doctor

### Doctor 3: Dr. Meera Kapoor
- **Email:** `meera@medibridge.test`
- **Password:** `Password@123`
- **Name:** Dr. Meera Kapoor
- **Role:** Doctor

---

## 🏥 PATIENT Login

### Patient: Rahul Patient
- **Email:** `patient@medibridge.test`
- **Password:** `Password@123`
- **Name:** Rahul Patient
- **Role:** Patient

**Patient Can Access:**
- ✅ Search doctors by specialty, hospital, department
- ✅ Book appointments
- ✅ Reschedule/cancel appointments
- ✅ View appointment history
- ✅ View medical records (finalized only)
- ✅ View prescriptions
- ✅ Upload/download documents
- ✅ Update profile and emergency contact
- ✅ View notifications
- ✅ Dashboard with upcoming appointments

---

## 💊 PHARMACIST Login

### Pharmacist: Priya Pharmacist
- **Email:** `pharmacist@medibridge.test`
- **Password:** `Password@123`
- **Name:** Priya Pharmacist
- **Role:** Pharmacist

**Pharmacist Can Access:**
- ✅ Review prescriptions
- ✅ Manage medicine inventory
- ✅ Add/edit medicine catalog
- ✅ Manage suppliers
- ✅ Record batch receipts
- ✅ Dispense medications
- ✅ Inventory adjustments
- ✅ View low stock alerts
- ✅ View expiry reports
- ✅ Generate monthly movement reports
- ✅ CSV export of inventory

---

## 📊 Quick Reference Table

| Role | Email | Password | Name |
|------|-------|----------|------|
| **Admin** | admin@medibridge.test | Password@123 | Admin User |
| **Doctor** | anita@medibridge.test | Password@123 | Dr. Anita Sharma |
| **Doctor** | vikram@medibridge.test | Password@123 | Dr. Vikram Singh |
| **Doctor** | meera@medibridge.test | Password@123 | Dr. Meera Kapoor |
| **Patient** | patient@medibridge.test | Password@123 | Rahul Patient |
| **Pharmacist** | pharmacist@medibridge.test | Password@123 | Priya Pharmacist |

---

## 🎯 Testing Workflow

### Test as Patient
1. Login: `patient@medibridge.test`
2. Search for doctors
3. Book an appointment
4. View dashboard
5. Check notifications

### Test as Doctor
1. Login: `anita@medibridge.test`
2. View appointments
3. Set availability/schedule
4. Confirm appointments
5. Create consultation records
6. Write prescriptions

### Test as Pharmacist
1. Login: `pharmacist@medibridge.test`
2. Review prescriptions
3. Check inventory
4. Dispense medications
5. View low stock alerts

### Test as Admin
1. Login: `admin@medibridge.test`
2. Manage users
3. Verify doctors
4. View system analytics
5. Check audit logs
6. Configure system settings

---

## 🔒 Security Notes

⚠️ **Important:**
- These are DEMO accounts for testing only
- Password is intentionally simple for demo purposes
- In production, use strong unique passwords
- Enable email verification
- Implement 2FA for admin accounts

---

## 🆕 Creating New Users

### Option 1: Register via Frontend
- Go to registration page
- Fill out the form
- New patient accounts are created automatically
- Doctor/Pharmacist accounts need admin approval

### Option 2: Via Admin Panel
- Login as admin
- Go to User Management
- Click "Create User"
- Set role and credentials
- Save

### Option 3: Direct Database Insert
```sql
-- Use backend seed script or direct SQL
-- See: backend/db/seed.js for examples
```

---

## 📝 Password Change

To change password for any user:
1. Login with the account
2. Go to Profile
3. Click "Change Password"
4. Enter current password: `Password@123`
5. Enter new password
6. Confirm

---

## 🔄 Reset Demo Data

To reset all users to original state:
```bash
cd backend
npm run seed
```
This will recreate all 6 demo users with default password.

---

## 💡 Pro Tips

1. **Multiple Browsers:** Test different roles simultaneously using different browsers or incognito windows

2. **Role Switching:** Logout and login with different accounts to test role-based access control

3. **Data Flow:** 
   - Patient books appointment
   - Doctor confirms and completes
   - Doctor writes prescription
   - Pharmacist reviews and dispenses

4. **Analytics:** Login as admin after creating some test data to see analytics

---

## 🚀 Quick Start Checklist

- [ ] XAMPP MySQL is running (green)
- [ ] Run `startup-simple.bat`
- [ ] Wait for both server windows
- [ ] Open http://localhost:5173
- [ ] Use any login from above table
- [ ] Start testing!

---

**All credentials are ready to use! Happy testing! 🎉**
