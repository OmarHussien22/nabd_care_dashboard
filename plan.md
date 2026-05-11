Clinic System — Phase 1 Development Plan
Project Context

We are building a scalable Clinic Management System using Flutter.

The project architecture already uses:

Flutter
GoRouter
GetX (State Management + DI)
Clean Architecture
Controller
UseCase
Repository
Service
Feature-based structure

The application targets:

Web
Desktop
Tablet

The system uses a persistent dashboard layout with:

Fixed Sidebar
Fixed Topbar
Dynamic Content Area

We are currently working on:

PHASE 1 — Core Navigation, Authentication & Access Control
Main Goals

Build the core infrastructure for:

Navigation
Authentication
Authorization
Role & Permission Management
User Management
Theme System
Reusable Dashboard Layout

This phase is the foundation for all future modules.

Technical Requirements
Use GoRouter with ShellRoute
Use responsive layout
Use reusable widgets
Keep business logic separated
Use clean architecture strictly
Avoid direct navigation inside controllers
Use centralized permission management
Support future backend-driven permissions
TASKS
1. Routing & Layout Infrastructure
Task 1.1 — Setup ShellRoute Layout
Objective

Create a persistent dashboard layout.

Requirements
Fixed Sidebar
Fixed Topbar
Dynamic Content Area
Responsive behavior
Nested routes support
Expected Structure
MainLayout
 ├── Sidebar
 ├── Topbar
 └── Content Area
Notes
Use ShellRoute
All internal pages must inherit the same layout
Sidebar must remain visible while navigating
Task 1.2 — Content Wrapper System
Objective

Create a unified wrapper for all internal pages.

Requirements

Create:

AppContentWrapper
Responsive padding
Max width handling
Standard page spacing
Page title section
Usage Example
AppContentWrapper(
  title: 'Patients',
  child: PatientsScreen(),
)
Task 1.3 — Breadcrumb System
Objective

Show the current page hierarchy.

Example
Dashboard / Patients / Add Patient
Requirements
Dynamic breadcrumb generation
GoRouter integration
Reusable breadcrumb widget
Widgets
AppBreadcrumb
BreadcrumbItem
2. Authentication System
Task 2.1 — Auth State Management
Objective

Manage authentication state globally.

Requirements

Create:

AuthController
AuthState
SessionManager
Responsibilities
Store current user
Handle tokens
Validate session
Track authentication state
Task 2.2 — Auth Redirect System
Objective

Protect routes based on authentication state.

Requirements
Redirect unauthenticated users to Login
Redirect authenticated users to Dashboard
Handle session expiration
Support auto logout
Notes

Use GoRouter redirect system.

Task 2.3 — Route Guards
Objective

Protect routes using:

Authentication
Roles
Permissions
Requirements

Create:

RouteGuard
AuthGuard
PermissionGuard
RoleGuard
Notes

Guards must be reusable and centralized.

3. Permission & Authorization System
Task 3.1 — Permission Manager
Objective

Create a centralized permission system.

Requirements

Create:

PermissionManager
Example Methods
canViewPatients()
canCreatePatient()
canEditInvoice()
canDeleteAppointment()
Notes

Do not directly check permissions inside UI widgets.

Task 3.2 — Entities & Models
Objective

Create authorization entities.

Required Entities
UserEntity
RoleEntity
PermissionEntity
Relationship
User
 └── Roles
      └── Permissions
Task 3.3 — Dynamic Permission Support
Objective

Allow future backend-driven permissions.

Requirements
Permission caching
Dynamic parsing
Feature toggle support
Runtime permission updates
Task 3.4 — Permission Middleware
Objective

Add middleware between UI and business logic.

Flow
UI → Controller → Permission Check → UseCase
Notes

Actions must be validated before execution.

4. Users Module
Task 4.1 — Users Feature Structure
Objective

Create a complete users module.

Structure
users/
 ├── data/
 ├── domain/
 └── presentation/
Task 4.2 — User Models
Objective

Create user models and mapping system.

Required
UserEntity
UserModel
UserMapper
Fields
id
name
email
avatar
roles
permissions
Task 4.3 — Users List Screen
Requirements
Table view
Pagination
Search
Filters
Responsive layout
Task 4.4 — User Details Screen
Requirements

Display:

User information
Roles
Permissions
Activity history
Task 4.5 — Create & Edit User
Requirements
Add user form
Edit user form
Assign roles
Assign permissions
5. Roles & Permissions Module
Task 5.1 — Roles Management
Requirements
Create role
Edit role
Delete role
Assign permissions
Task 5.2 — Permissions Management
Requirements
Permissions list
Categorized permissions
Permission grouping
Example
Patients
 ├── View
 ├── Create
 ├── Edit
 └── Delete
Task 5.3 — Role Assignment System
Objective

Connect:

Users
Roles
Permissions
Relationship
Users ↔ Roles ↔ Permissions
6. Profile Settings
Task 6.1 — User Profile Screen
Requirements
User info
Avatar
Contact details
Task 6.2 — Account Settings
Requirements
Change password
Theme mode
Language
Notifications
7. Theme System
Task 7.1 — Light/Dark Theme Architecture
Requirements

Create:

ThemeManager
Theme persistence
Dynamic switching
Task 7.2 — Theme Tokens
Objective

Create centralized design tokens.

Requirements

Standardize:

Colors
Typography
Radius
Shadows
Spacing
Task 7.3 — Theme Persistence
Objective

Persist selected theme after app restart.

Requirements
Save theme locally
Restore theme on startup
Development Rules
Architecture Rules
Controllers must not directly navigate
Business logic must stay inside UseCases
Services handle external resources only
Repositories abstract data sources
UI must remain reusable
UI Rules
Reusable widgets only
Responsive layouts
Consistent spacing
Consistent typography
Consistent table styles
Consistent form styles
Security Rules
Never trust UI permissions only
Validate permissions before actions
Handle session expiration globally
Protect all private routes
Execution Order
Sprint 1
ShellRoute
MainLayout
ContentWrapper
Breadcrumb
Theme setup
Sprint 2
Authentication system
Session manager
Auth redirects
Route guards
Sprint 3
Permission manager
Role system
Permission middleware
Sprint 4
Users module
Roles screens
Profile settings
Expected Result After Phase 1

After completing this phase, the system should have:

Stable dashboard architecture
Persistent navigation layout
Authentication system
Authorization system
Role & permission infrastructure
User management foundation
Theme system
Protected routes
Reusable layout components

This foundation will support future modules like:

Patients
Appointments
Doctors
Billing
Reports
Notifications
Analytics


Additional Requirement — Global Search System
Feature Name

Global Search System

Objective

Create a centralized global search feature inside the Top App Bar.

The search system should allow users to quickly search across the entire clinic system from anywhere in the application.

The UI component already exists and is ready.

Only the business logic, architecture integration, and system behavior are required.

Search Location

The global search field exists inside:

Top App Bar

The search must be accessible from all internal dashboard pages.

Expected Behavior

The search should support searching across multiple modules such as:

Patients
Doctors
Appointments
Invoices
Users
Prescriptions
Medical Records
Search Experience
Requirements
Real-time search
Debounced requests
Dropdown results
Keyboard navigation support
Loading state
Empty state
Error state
Responsive behavior
Search Result Dropdown
Requirements

The dropdown should:

Open below the search field
Group results by module/category
Support scrolling
Show quick preview information
Navigate to selected item details
Example Result Structure
Patients
 ├── Ahmed Mohamed
 ├── Sara Ali

Doctors
 ├── Dr. Karim Hassan

Appointments
 ├── Appointment #1023
Search Architecture
Task 1 — Create Global Search Module
Structure
global_search/
 ├── data/
 ├── domain/
 └── presentation/
Task 2 — Search Entities
Required Entities
SearchResultEntity
SearchCategoryEntity
SearchItemEntity
Task 3 — Search Repository
Responsibilities
Handle search requests
Merge results
Manage caching
Handle pagination if needed
Task 4 — Search Service
Responsibilities
API communication
Request cancellation
Debouncing support
Error handling
Task 5 — Search Controller
Responsibilities
Manage search state
Control dropdown visibility
Handle selected item navigation
Manage loading & empty states
Search Categories
Requirements

Each result should contain:

id
title
subtitle
category
route
optional avatar/icon
Navigation Requirements

When selecting a search result:

Navigate directly to the details page
Close dropdown automatically
Preserve dashboard layout
Performance Requirements
Important
Use debounce
Prevent unnecessary requests
Cancel previous requests when typing quickly
Avoid rebuilding the whole page
Cache recent searches if possible
Permission Integration
Important

Search results must respect permissions.

Example:

If the user cannot access invoices,
invoice results must not appear.
Suggested Search Flow
User Types
    ↓
Debounce
    ↓
Search Request
    ↓
Permission Filtering
    ↓
Dropdown Results
    ↓
Select Item
    ↓
Navigate to Details Page
UI States
Required States
Idle State
Loading State
Empty State
Error State
Results State
Optional Future Enhancements
Recent searches
Search history
Command palette mode
Keyboard shortcuts
AI-powered search
Voice search
Offline search cache
Technical Notes
Keep search logic independent from UI
Search should be reusable globally
Avoid direct API calls inside widgets
Use centralized navigation handling
Support future backend-driven search indexing
Expected Result

A scalable and reusable global search system integrated into the Top App Bar that allows fast navigation across the entire clinic management system while respecting permissions and maintaining performance.







Flutter Dashboard UI System – Complete Migration Plan

PHASE — Dashboard Module
Business Context

The Dashboard is the main control center of the Clinic Management System.

It should provide:

Quick system overview
Real-time clinic status
Financial insights
Appointment monitoring
Staff activity
Fast navigation
Action shortcuts

The dashboard must feel:

Modern
Clean
Fast
Professional
Data-driven

Target style:

ERP / SaaS Dashboard
Similar quality to:
Notion
Stripe
Linear
Odoo
ClickUp
Modern Healthcare Systems

The dashboard must support:

Web
Desktop
Tablet

The layout already uses:

Persistent Sidebar
Persistent Topbar
Dynamic Content Area

The dashboard must follow the existing project architecture and reusable components.

DASHBOARD STRUCTURE

The dashboard should contain:

Welcome Section
Statistics Cards
Appointments Overview
Patients Overview
Financial Overview
Doctors Availability
Quick Actions
Activity Timeline
Notifications & Alerts
Charts & Analytics
TASKS
1. Dashboard Layout Structure
Task 1.1 — Dashboard Main Screen
Objective

Create the main dashboard screen structure.

Requirements
Responsive layout
Grid-based sections
Adaptive spacing
Clean visual hierarchy
Notes

The dashboard should not feel crowded.

Task 1.2 — Dashboard Sections Wrapper
Objective

Create reusable dashboard section containers.

Requirements

Create reusable widgets:

DashboardSection
DashboardCard
DashboardHeader
Features
Consistent padding
Consistent radius
Consistent shadows
Section title support
Optional action button
2. Welcome Section
Task 2.1 — Welcome Header
Objective

Create a personalized welcome section.

Requirements

Display:

User name
Current role
Current date
Quick summary
Example
Good Morning, Dr. Omar
You have 12 appointments today
Task 2.2 — Quick Overview Summary
Requirements

Display:

Today's appointments
Pending invoices
Waiting patients
Available doctors
3. Statistics Cards
Task 3.1 — Reusable Statistics Card
Objective

Create reusable analytics cards.

Requirements

Each card should support:

Title
Value
Growth indicator
Small chart
Icon
Status color
Task 3.2 — Main Statistics Row
Required Cards
Total Patients
Today's Appointments
Active Doctors
Monthly Revenue
Pending Payments
Completed Visits
4. Appointments Overview
Task 4.1 — Today's Appointments Widget
Requirements

Display:

Upcoming appointments
Appointment time
Doctor
Patient
Status
Features
Scrollable list
Status badges
Quick actions
Task 4.2 — Appointment Status Summary
Requirements

Display:

Confirmed
Pending
Cancelled
Completed

Using:

Chart
Progress indicators
Analytics cards
5. Patients Overview
Task 5.1 — Recent Patients Section
Requirements

Display:

Recent patients
Last visit
Assigned doctor
Quick actions
Task 5.2 — Patient Analytics
Requirements

Display:

New patients
Returning patients
Most active department
Patient growth
6. Financial Overview
Task 6.1 — Revenue Analytics
Requirements

Display:

Daily revenue
Weekly revenue
Monthly revenue
Revenue growth
Task 6.2 — Payment Summary
Requirements

Display:

Paid invoices
Pending invoices
Overdue invoices
Task 6.3 — Revenue Charts
Requirements

Support:

Bar charts
Line charts
Analytics comparison
7. Doctors & Staff Section
Task 7.1 — Doctors Availability Widget
Requirements

Display:

Online doctors
Available doctors
Busy doctors
Off-duty doctors
Task 7.2 — Staff Activity Widget
Requirements

Display:

Recent actions
Current active staff
Recent updates
8. Quick Actions Section
Task 8.1 — Quick Actions Grid
Requirements

Create shortcuts for:

Add Patient
Create Appointment
Create Invoice
Add Doctor
Open Queue
Notes

Actions should be role-based.

9. Activity Timeline
Task 9.1 — Activity Feed
Requirements

Display:

Recent actions
App activity
Appointment updates
User activity
Features
Real-time ready
Scrollable timeline
Timestamp support
10. Notifications & Alerts
Task 10.1 — Alerts System
Requirements

Display:

Missed appointments
Payment alerts
Expired sessions
System notifications
Task 10.2 — Critical Warnings
Examples
Fully booked doctors
Low inventory
Failed payments
11. Charts & Analytics
Task 11.1 — Analytics Widgets
Requirements

Support:

Line charts
Bar charts
Pie charts
Area charts
Notes

Charts must be reusable.

Task 11.2 — Dashboard Filters
Requirements

Support filtering by:

Today
Week
Month
Year
12. Global Dashboard Features
Task 12.1 — Loading States
Requirements
Skeleton loaders
Smooth loading transitions
Task 12.2 — Empty States
Requirements

Reusable empty state widgets.

Task 12.3 — Error Handling
Requirements

Reusable dashboard error widgets.

Task 12.4 — Responsive Behavior
Requirements

Support:

Large desktop
Laptop
Tablet
13. Performance Optimization
Task 13.1 — Optimized Rebuilds
Requirements
Avoid full dashboard rebuilds
Use modular widgets
Lazy load sections if needed
Task 13.2 — API Optimization
Requirements
Parallel requests
Caching
Pagination where needed
14. Permission Integration
Task 14.1 — Role-Based Dashboard
Requirements

Dashboard content changes depending on role.

Examples
Admin
Financial data
System analytics
Doctor
Today's appointments
Patients
Receptionist
Queue
Booking system
15. UI/UX Requirements
Design Goals

The dashboard should feel:

Premium
Modern
Minimal
Fast
Clean
Professional
UI Rules
Soft shadows
Consistent radius
Proper spacing
Clean typography
Smooth hover states
Smooth animations
No cluttered layout
Suggested Dashboard Layout
------------------------------------------------
Topbar
------------------------------------------------

Welcome Section

Statistics Cards Row

------------------------------------------------

Appointments Overview | Revenue Chart

------------------------------------------------

Recent Patients      | Doctors Availability

------------------------------------------------

Quick Actions        | Notifications

------------------------------------------------

Activity Timeline

------------------------------------------------
Expected Result

A scalable, reusable, responsive, and professional healthcare dashboard that acts as the main operational center of the clinic management system while following the existing architecture, reusable widgets, and project standards.




