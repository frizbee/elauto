import 'package:drift/drift.dart';

import 'service_types.dart';
import 'vehicle_profiles.dart';

class MaintenanceRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vehicleId =>
      integer().references(VehicleProfiles, #id, onDelete: KeyAction.cascade)();

  IntColumn get serviceTypeId =>
      integer().references(ServiceTypes, #id, onDelete: KeyAction.restrict)();

  IntColumn get odometerKm => integer()();

  DateTimeColumn get serviceDate => dateTime()();

  TextColumn get location => text().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
