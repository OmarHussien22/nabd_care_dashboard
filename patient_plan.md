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





[Phase 4]
UI REFINEMENT + DESIGN CONSISTENCY + PATIENT ENHANCEMENTS PHASE
Context

The Dashboard design is already considered the design reference of the whole system.

All other screens MUST follow the Dashboard visual structure exactly.

This means:

Same spacing scale
Same content width
Same padding behavior
Same card sizes
Same typography hierarchy
Same section spacing
Same visual density
Same dashboard proportions

Do NOT make screens feel smaller or tighter than the Dashboard.

The current issue:

Some pages feel compressed, small, and visually inconsistent.

We need a premium SaaS healthcare design with a unified experience.

GLOBAL DESIGN SYSTEM ALIGNMENT
Objective

Make the following modules visually identical to the Dashboard design language:

Patients
Appointments
Users
Roles
Settings
IMPORTANT RULES

Do NOT redesign independently.

Use Dashboard as source of truth.

Everything should visually feel like:

Same product
Same spacing rhythm
Same typography
Same card system
Same grid behavior

Users should feel that every page belongs to one unified system.

TASK 1 — Match Dashboard Layout Dimensions
Requirements

Apply Dashboard layout standards globally:

Same content width
Same horizontal padding
Same vertical spacing
Same section margins
Same card padding
Same content alignment

Reuse:

AppContentWrapper
DashboardSection
DashboardCard

Do NOT create screen-specific spacing.

TASK 2 — Typography Standardization
Requirements

Match Dashboard text hierarchy:

Page Title:

Large
Clear
Premium feel

Section Title:

Medium
Strong hierarchy

Body Text:

Comfortable readability

Labels:

Consistent sizing

Table text:

Not tiny
Easy to scan
IMPORTANT

Avoid:

tiny fonts
compressed UI
random text sizes
inconsistent font weights

The system must NOT feel crowded.

TASK 3 — Patients Screen Redesign
Requirements

Match dashboard proportions.

Improve:

Patients page

table spacing
section spacing
top actions area
filters area
pagination area

Modern SaaS layout:

Page Header

Filters + Search + Add Button

Patients Table

Pagination

Everything should breathe visually.

TASK 4 — Appointments Screen Redesign
Requirements

Redesign using same dashboard structure.

Improve:

appointments cards
schedule layout
table spacing
filters
calendar sections

Use larger comfortable spacing.

TASK 5 — Users Screen Redesign
Requirements

Improve:

user table
search area
filters
action buttons
user cards

Follow Dashboard dimensions.

TASK 6 — Roles Screen Redesign
Requirements

Improve:

role cards
permissions UI
spacing
role actions

Design should feel modern and clean.

TASK 7 — Complete Settings Screen
Objective

Finish settings module.

Required sections:

General Settings

System Settings

Theme Settings

Language

Notifications

Security

Account Settings

Profile Settings

Settings UX Requirements

Use dashboard card style:

Settings Category
    ↓
Settings Items

Do NOT use long cluttered forms.

Settings should feel premium.

PATIENT FEATURE ENHANCEMENTS
TASK 8 — Add Chronic Diseases Support

Inside Add Patient screen:

Add:

Chronic Diseases Section

Requirements:

Has chronic disease?
Yes / No

If yes:

Show:

disease name
multiple diseases support

Examples:

Diabetes
Hypertension
Heart Disease
Asthma

Allow custom values.

TASK 9 — Current Medication Support

Add:

Currently taking medication?

Yes / No

If Yes:

Display:

medicine name
dosage
notes

Support multiple entries.

TASK 10 — Medical Attachments System

Inside Add Patient:

Support file upload:

Images
PDF
Excel
Medical scans
Reports

Supported examples:

X-ray images
MRI scans
Lab reports
Medical files
TASK 11 — Attachment Upload UI

Requirements:

Modern upload area:

Drag and drop
Click upload
file preview
upload progress
remove attachment

Use existing widgets if available.

TASK 12 — Patient Details Enhancements

Inside Patient Details screen:

Add Medical Files section.

Display:

Images:

preview grid

PDF:

preview / open

Excel:

open action

Medical reports:

organized cards
Example Structure
Patient Details

Personal Information

Medical Information

Chronic Diseases

Current Medications

Medical Files

Visits History
TASK 13 — Attachment Viewer

Requirements:

Images:

zoom
preview

PDF:

open viewer

Excel:

file action

Keep dashboard layout.

FINAL UI RULES

MUST:

reuse existing widgets
reuse existing base architecture
reuse existing theme
reuse dashboard spacing
reuse typography system
use same card system
use same shadows
use same radius
use same table design

DO NOT:

create random dimensions
create tiny text
use cramped layouts
create inconsistent UI
FINAL EXPECTED RESULT

After implementation:

Patients
Appointments
Users
Roles
Settings

all visually feel identical to Dashboard.

The entire project should feel like a premium, modern healthcare SaaS product with one unified design language and comfortable spacing.

Patient module should additionally support:

chronic diseases
medication tracking
scan uploads
pdf uploads
excel uploads
medical file preview
patient detail enhancements

Everything should feel production-ready and scalable.




PHASE 5 — APPOINTMENTS COMPLETION + TABLE INTERACTIONS + RESPONSIVE/UI IMPROVEMENTS
Context

Core modules and UI are mostly completed.

This phase focuses on:

Fixing unfinished interactions
Completing appointment flows
Making table behavior production-ready
Improving responsiveness
Enhancing UI consistency
Improving UX details

The system should now feel fully interactive and polished.

Continue using:

Existing architecture
Existing widgets
Existing base classes
Existing dashboard spacing system
Existing theme system
Existing table system

DO NOT introduce new architecture.

TASK 1 — Fix New Appointment Button
Problem

Current:

New Appointment button exists but has no behavior
Objective

Make button fully functional.

Requirements

When clicked:

Navigate correctly
Open Create Appointment screen
Preserve Dashboard layout
Use existing routing system
Respect permissions

Flow:

Click
 ↓
Navigate
 ↓
Appointment Form
 ↓
Save
 ↓
Refresh Appointment List
TASK 2 — Fix View Calendar Button
Problem

Current:

View Calendar button exists but not working
Objective

Implement calendar view navigation.

Requirements

Click:

View Calendar

opens:

Appointments Calendar Screen
Calendar Requirements

Display:

Day View
Week View
Month View

Support:

appointment cards
doctor schedule
appointment status
click appointment
navigate to details

Keep dashboard layout.

TASK 3 — Fix Table Actions Across Entire System
Problem

Current:

Action buttons visually exist but perform no action.

Objective

Make all table actions functional.

Affected modules:

Patients
Appointments
Users
Roles
Future modules
Required Actions

View

Open Details Screen

Edit

Open Edit Screen

Deactivate

Change status

Delete

Confirmation

More Actions

Dropdown actions
Requirements

Actions must:

use centralized action handlers
use existing routing
use permission checks
support loading states
support success feedback
TASK 4 — Standardize Table Action System
Objective

Create reusable action behavior.

Create:

AppTableActions

Requirements:

consistent spacing
tooltip support
hover support
dropdown overflow support

Use globally.

No duplicated action logic.

TASK 5 — Sticky Table Header
Objective

Improve table UX.

Current issue:

Header scrolls away.

Required Behavior

While scrolling table:

Header remains visible.

Only rows scroll.

Expected:

HEADER
---------------------

Row
Row
Row
Row
(scroll)

Header remains fixed.

Requirements

Support:

pagination
horizontal scroll
dynamic columns

Must work on:

web
desktop
tablet
TASK 6 — Table Responsive Improvements
Problem

Long values break layout.

Examples:

long patient names
long email
long phone
long role names
Objective

Improve table responsiveness.

Requirements:

Handle:

Long names

Long phones

Long emails

Long titles

Long text

Support:

ellipsis

tooltips

flex sizing

adaptive widths

overflow handling

Examples:

Instead of:

Mohamed Ahmed Hassan Abdelrah...

Show:

Mohamed Ahmed...

On hover:

Show full value.

TASK 7 — Responsive Table Column System
Objective

Make tables scale naturally.

Requirements:

Columns should support:

min width
max width
flexible width
priority behavior

Examples:

Important:

Name

Status

Actions

Less Important:

Notes

Secondary fields

On smaller screens:

Lower priority columns may collapse.

TASK 8 — Improve Table Empty States
Requirements

Add modern empty state:

Examples:

No patients

No appointments

No users

Support:

illustration
title
description
CTA action
TASK 9 — Improve Table Loading Experience
Requirements

Replace abrupt loading.

Use:

skeleton rows
shimmer loading
smooth transitions

Do NOT freeze UI.

TASK 10 — Global UI Polish
Objective

Improve overall UI quality.

Enhancements:

Hover animations

Button interactions

Smooth transitions

Table row hover

Card hover

Dropdown transitions

Better spacing

Consistent shadows

Consistent radii

TASK 11 — Responsive Audit

Run responsive fixes on:

Patients

Appointments

Users

Roles

Settings

Dashboard

Requirements:

Test:

Large desktop

Laptop

Tablet

Small screens

Fix:

overflow

broken rows

misalignment

collapsed cards

small text

tight spacing

FINAL RESULT

After this phase:

Appointment actions fully work
Calendar navigation works
Table actions work everywhere
Sticky table header works
Tables handle long data correctly
Responsive behavior feels premium
UI interactions feel polished
Entire project feels production-ready

The system should now behave like a professional SaaS healthcare product rather than static screens.