# MediBridge – Integrated Healthcare Management System

Full stack MCA major project: React + Bootstrap + Recharts, Node/Express, MySQL, JWT. Supports SDG 3 and SDG 10.
**Student project: use synthetic data only. Not a certified clinical or compliant production system.**

## Structure
```
backend/    Express REST API (src/), MySQL schema + seed (db/), unit tests (tests/)
frontend/   React + Vite + Bootstrap + Recharts
render.yaml (Render blueprint for the API)   frontend/vercel.json (Vercel SPA rewrite)
```

## Run locally
Prerequisites: Node 18+, MySQL 8.0.16+.

1. **Database:** `mysql -u root -p < backend/db/schema.sql`
2. **Backend**
   ```
   cd backend
   cp .env.example .env     # set DB_PASSWORD and a long random JWT_SECRET
   npm install
   npm run seed             # synthetic demo users, doctors, medicines, sample history
   npm run dev              # http://localhost:5000/api/health
   ```
3. **Frontend**
   ```
   cd frontend
   cp .env.example .env
   npm install
   npm run dev              # http://localhost:5173
   ```

Demo logins (password `Password@123`): `patient@medibridge.test`, `anita@medibridge.test` (doctor),
`pharmacist@medibridge.test`, `admin@medibridge.test`.

Optional: set `SMTP_*` in `backend/.env` for email reminders (without it, reminders are in-app only).
Set `ENABLE_JOBS=false` to disable the cron jobs.

## Feature coverage (by proposal module)
| Module | Implemented |
|---|---|
| 1 Auth | Register (patient/doctor/pharmacist), login, **server-side logout** (token revocation), password change, profile for every role, RBAC, activate/deactivate, verification before privileged access, validation |
| 2 Patients | Profile + emergency contact, appointment history, authorized records & prescriptions, **document upload/download/delete**, dashboard with totals, upcoming card, recent prescriptions/records, notifications, **profile completion** |
| 3 Doctors/hospitals | Doctor profile, fees, verification, hospital/department association (doctor or admin), search by **specialty, hospital, department, date, time range, fee, name** |
| 4 Appointments | Search, slots, book, reschedule, cancel, statuses (Pending/Confirmed/Completed/Cancelled/No-show), doctor management, confirmations, **reminders (cron + optional email)**, setting to require doctor confirmation (Pending flow) |
| 5 Records | Consultation records, clinician-entered diagnosis, draft→finalized (immutable), **field-level change history**, access permissions, audit log, supporting documents |
| 6 Prescriptions | Create with items, linked to patient/record, history, **printable prescription**, **pharmacist review screen**, doctor's own list |
| 7 Inventory | Catalogue add/edit/deactivate, suppliers CRUD, batches, receipts, dispensing, **adjustments with reason**, min stock, low-stock & expiry reports, **monthly movement**, CSV export |
| 8 Availability | Weekly hours, slot length (20/30/…), **breaks**, blocked dates/leave, overlap validation, daily schedule, upcoming appointments |
| 9 Analytics | Status pie, trends line, department bar, workload bar, **registration trend, low-stock-by-category, completion/cancellation/no-show rates**, monthly + yearly report, **CSV export, print/save as PDF** |
| 10 Feedback | **4 ratings** (experience, booking ease, waiting time, overall), history, eligible appointments only, flag/moderate, service-quality report |
| 11 Notifications | Confirmation, cancel, reschedule, prescription, low stock (pharmacists + admins), reminders, in-app centre with read/unread + **unread badge**, email without clinical details |
| 12 Admin | Users, doctor verification, **department assignment**, hospitals/departments CRUD, **create staff + change staff roles**, patients and appointments views (non-clinical), inventory monitor, feedback moderation, audit logs, **system settings**, reports |

## Dashboards / sidebars
Patient, doctor, admin and pharmacist menus match section 10 of the proposal (see `frontend/src/components/Layout.jsx`).

## Key design decisions
- **No double booking:** transaction + row lock, plus UNIQUE `appointments.active_slot` (generated column, NULL when cancelled).
- **Record-level authorization:** doctors only access patients they have an appointment with; patients see only their finalized records; admins never see clinical notes or appointment reasons; pharmacists see patient name + medicines only.
- **Inventory integrity:** stock changes only via row-locked transactions; never negative; adjustments need a reason.
- **Security:** bcrypt, JWT with revocable `token_version`, rate-limited login, parameterized SQL, server validation, private upload storage (type/size checked, served only through authorized routes), audit logs.

## Deployment
- **Database:** managed MySQL (a local DB is not reachable from Render). Run `schema.sql` there.
- **Backend (Render):** root `backend`, env vars from `.env.example`, `CLIENT_ORIGIN` = Vercel URL. Note: Render's disk is ephemeral, so uploaded documents need a persistent disk or object storage for real use.
- **Frontend (Vercel):** root `frontend`, env `VITE_API_URL=https://<render-app>/api`.

## Testing
`cd backend && npm test` runs unit tests for slot generation, breaks and overlap detection. Suggested Postman checks:
- patient reads another patient's record → 403; doctor without appointment reads records → 403
- two simultaneous bookings of one slot → one 201, one 409
- unverified doctor appears in search → never; booking them → 404
- dispense more than stock → 400; adjustment without note → 400
- upload `.exe` or >5 MB → 400; download another patient's document → 403
- token after logout → 401

## Not covered (out of scope of the proposal's core)
Teleconsultation (WebRTC), AI assistant, multilingual UI (i18n), doctor-ranking algorithm, waitlist, and automated end-to-end tests.
