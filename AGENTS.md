# Repack — AI Agent Notes

## App Overview
- App name: `Repack`
- Platforms: `iOS` and `Android`
- Framework: `Flutter`
- Main purpose: help car owners track maintenance, repairs, and part changes on their phone.

## Product Vision
`Repack` is a mobile-first car maintenance tracker. A user installs the app, creates a local vehicle profile, and then records service events such as oil changes, spark plug replacement, and other fixes. The app should make it easy to see the current car profile, recent maintenance history, and upcoming service reminders.

## Core Requirements

### 1. Local-only profile setup
- Do not require user registration or login unless explicitly requested later.
- Store all user data locally on the phone.
- Use a local database for persistence.
- The first-run flow should let the user create a vehicle profile.

### 2. Vehicle profile
The profile should support at least:
- Car brand / manufacturer
- Model
- Engine details
- Drivetrain details such as `4WD` or `AWD`
- Any other practical vehicle metadata needed for maintenance tracking

### 3. Dashboard
After profile creation, the app should show a dashboard with:
- Vehicle name / brand
- Summary data loaded from the local database
- Quick access to add a maintenance record
- Recent service history
- Upcoming reminders

### 4. Maintenance tracking
Users should be able to log service events such as:
- Engine oil change
- Spark plug replacement
- Other fixes, replacements, and maintenance actions

Each maintenance record should support at least:
- Service type selected from a list or dropdown
- Current odometer reading in kilometers
- Date of service
- Optional notes
- Optional location where the service was done

### 5. Notifications and reminders
- The app should remind users about upcoming maintenance.
- Example: if engine oil should be changed every `8000 km`, notify the user when the next change is approaching.
- Reminder logic should be based on previously recorded maintenance history and odometer values.
- Keep reminder rules flexible so more service intervals can be added later.

## Suggested Technical Direction
- Preferred framework: `Flutter`
- Preferred local storage approach: a local database such as `SQLite`, `Drift`, `Hive`, or `Isar`
- Recommended architecture: keep UI, state management, and persistence clearly separated
- Prefer offline-first behavior
- Design models so multiple service record types can share one maintenance entry structure

## Data Model Expectations
At minimum, plan for entities like:
- `VehicleProfile`
- `MaintenanceRecord`
- `ServiceType`
- `ReminderRule`

Possible `MaintenanceRecord` fields:
- `id`
- `vehicleId`
- `serviceType`
- `odometerKm`
- `serviceDate`
- `location`
- `notes`
- `createdAt`
- `updatedAt`

## UX Priorities
- Keep the app simple and fast for one-handed phone use.
- Make adding a maintenance record very quick.
- Use clear labels for car details and service actions.
- Show important reminders prominently on the dashboard.
- Assume the user may not be technical.

## Scope Guidance For AI Agents
- Prioritize local storage and offline functionality.
- Do not introduce backend services unless explicitly requested.
- Do not add authentication by default.
- Keep the first implementation focused on one user and one primary vehicle profile unless multi-vehicle support is requested.
- Use kilometers as the default odometer unit.
- Keep notification logic understandable and easy to extend.

## If Scaffolding The App
When generating the first version of the app, prefer this order:
1. Create Flutter app structure
2. Implement local database and models
3. Build vehicle profile setup flow
4. Build dashboard screen
5. Add maintenance record creation flow
6. Add service history list and detail view
7. Add reminder and notification logic

## Notes
- This file captures the current product intent and should guide future AI-generated code.
- If requirements change, update this file first so future agents stay aligned.

For UI styles use UIKIT.md and BRAND.md
