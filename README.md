📦 Project Architecture Guide
🧠 Overview

This project follows Clean Architecture principles with a strong focus on:

// follow project naming conventions and structure:
// - use same file naming as existing features
// - match controller, usecase, repository patterns
// - follow folder structure in features/
// - reuse base classes from Core

Scalability
Maintainability
Reusability
Clear separation of concerns
📁 Project Structure
🔹 lib/
📌 app_info_keys/

Contains all application-related constants:

App name
App version
API keys
Any static app-level configuration
📌 Core/

Contains all base and foundational layers of the project:

Includes:
Base classes (Controller, Repository, Service)
Network structure (API client, endpoints)
Local database structure
Utilities & helpers
Configurations
Shared libraries
Styles (global theming)
📌 Core/Network Structure/

Responsible for all networking and clean architecture base layers:

Includes:
Base Controller
Base UseCase
Base Repository
Base Service
API Client (Dio or similar)
Endpoints management
📌 shared/

Contains reusable components across the app:

Includes:
Shared Widgets
Common UI Components
Shared Styles
Controller Manager
Base Models (JSON parsing)
Entities
UI helpers
📌 features/

Each feature is isolated and follows a modular structure.

🧱 Clean Architecture Flow
Controller → UseCase → Repository → Service
⚙️ State Management
Use GetX (without Rx)
Use GetBuilder
Avoid Obx / reactive streams
📊 Data Handling

Use DataState pattern:

DataLoading
DataSuccess
DataFailed
🧩 UI Handling
Use DataStatusBuilder for:
Loading
Success
Error states
🎯 Coding Principles
✅ Code Organization
Separate files by responsibility
Avoid large files
Use feature-based structure
♻️ Reusability
Prefer generic and reusable components
Avoid code duplication
Abstract common logic

🎨 UI/UX Guidelines
Improve UI whenever possible
Ensure user-friendly navigation
Maintain clean and modern design
Build responsive layouts for all screen sizes
🚀 Key Goals
Clean & scalable architecture
High performance
Easy maintenance
Reusable components
Professional codebase ready for production