PHASE — PATIENTS MODULE
Business Context

Patient module هو core module في Clinic System.

هيكون مسؤول عن:

إدارة بيانات المرضى
عرض المرضى في جدول احترافي
إضافة/تعديل/تعطيل المرضى
دعم البحث + pagination + actions
تجربة استخدام سريعة جدًا للـ receptionist/doctor/admin
ARCHITECTURE RULES (IMPORTANT)

Must follow existing project structure:

UI → Controller → UseCase → Repository → Service
Use existing base classes
Use existing reusable widgets
Use existing design system
Use GoRouter navigation
Do NOT introduce new architecture
PHASE 1 — PATIENTS LIST (MODERN TABLE + PAGINATION)
Task 1.1 — Patients List Screen
Objective

Create a modern, clean, scalable patients listing screen.

Requirements
Use existing dashboard layout
Use ContentWrapper
Fully responsive
Clean spacing system
Task 1.2 — Modern Table Design
Objective

Build a modern SaaS-style table.

Requirements

Table must include:

Clean header design
Soft borders or subtle separation
Hover effects (web/desktop)
Consistent row height
Proper spacing alignment
Status indicators
Avatar support for patients
Table Columns Example
Avatar | Name | Phone | Age | Gender | Status | Last Visit | Actions
Task 1.3 — Pagination System
Objective

Implement backend-ready pagination.

Requirements
Page number navigation
Next / Previous buttons
Page size control (10 / 20 / 50)
Loading state while fetching
Preserve filters during pagination
Pagination Rules
Must not reload full screen
Only table data updates
Must support API pagination response
Task 1.4 — Search Integration
Objective

Add local search inside table header.

Requirements
Search by:
name
phone
Debounced input
Works with pagination
PHASE 2 — ADD PATIENT (BEST UX FORM DESIGN)
Task 2.1 — Add Patient Screen (Premium UX)
Objective

Create the best possible user-friendly form experience.

UX Requirements

The form must be:

Clean
Step-based OR well structured sections
Minimal cognitive load
Fast to fill
Mobile + desktop friendly
Layout Suggestion
Personal Info
Contact Info
Medical Info (optional)
Emergency Contact
Task 2.2 — Smart Form Design
Requirements
Auto validation
Inline error messages
Smart defaults
Grouped inputs
Consistent spacing
No clutter
Task 2.3 — UX Enhancements
Must include:
Save button fixed at bottom (or sticky)
Loading state on submit
Success animation/toast
Auto clear or redirect after success
Task 2.4 — Optional Enhancements (Premium feel)
Avatar upload
Gender selection chips
Date picker for DOB
Phone formatting
Live validation
PHASE 3 — PATIENT ACTIONS (TABLE OPERATIONS)
Task 3.1 — Action System in Table
Objective

Standardized action system for patients table.

Required Actions
1. Add Patient
From top button
Opens Add Patient screen
2. Edit Patient
Opens same Add Patient form
Pre-filled data
Updates existing record
3. Deactivate Patient
Soft delete (NOT hard delete)
Status becomes "Inactive"
Patient remains in system
Task 3.2 — Action UI Design
Requirements
Use consistent action buttons
Icon-based + tooltip
OR dropdown menu (More actions)
Example
[View] [Edit] [More ▼]
Task 3.3 — Confirmation System
Objective

Prevent accidental actions.

Requirements
Confirmation dialog for deactivate
Warning styling
Undo option (optional future enhancement)
Task 3.4 — Status Handling
Patient Status Types
Active
Inactive
Archived (future)
UI Rules
Status must be shown as badge
Color-coded system
Consistent across tables
DESIGN SYSTEM REQUIREMENTS (VERY IMPORTANT)
Table Must Match System Theme
Same typography system
Same spacing system
Same radius system
Same shadow system
No custom styling per screen
Consistency Rules
NO inline styles
NO custom table designs per module
MUST reuse:
AppTable
AppButton
AppText
StatusBadge
AppDialog
PERFORMANCE RULES
Use pagination API
Avoid full rebuild of screen
Use controller state only
Cache last page results if possible
Debounce search
FINAL RESULT EXPECTATION

After completing this phase:

You will have:

Modern SaaS-level Patients table
Fully functional pagination system
Clean Add/Edit patient UX
Soft delete (deactivate) system
Consistent UI aligned with entire clinic system
Fully scalable patient module ready for production