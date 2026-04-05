# elauto

A new Flutter project.

## How to read DB

The app stores its local SQLite database as `repack.sqlite`.

### Database file

- File name: `repack.sqlite`
- Created via `getApplicationDocumentsDirectory()`
- Exact location depends on the platform/device

### iOS Simulator

Get the app data container path:

```bash
xcrun simctl get_app_container booted com.elauto.app.elauto data
```

Open the database:

```bash
sqlite3 "$(xcrun simctl get_app_container booted com.elauto.app.elauto data)/Documents/repack.sqlite"
```

Useful SQLite commands:

```sql
.tables
.schema vehicle_profiles
select * from vehicle_profiles;
select * from vehicle_types;
select * from vehicle_brands limit 20;
select * from vehicle_models limit 20;
```

### Android emulator or device

Typical DB path inside the app sandbox:

```text
/data/user/0/com.elauto.app.elauto/app_flutter/repack.sqlite
```

Open it on the device:

```bash
adb shell
run-as com.elauto.app.elauto
sqlite3 app_flutter/repack.sqlite
```

If `sqlite3` is not available on the device, copy the DB to your machine first:

```bash
adb exec-out run-as com.elauto.app.elauto cat app_flutter/repack.sqlite > repack.sqlite
sqlite3 repack.sqlite
```

### Physical iPhone

Direct shell access is usually not available. Use Xcode instead:

- Open `Window` → `Devices and Simulators`
- Select your device and app
- Download the app container
- Open `AppData/Documents/repack.sqlite`

### Main tables

- `vehicle_profiles`
- `vehicle_types`
- `vehicle_brands`
- `vehicle_models`
- `service_types`
- `reminder_rules`
- `maintenance_records`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
