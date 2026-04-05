import 'package:drift/drift.dart';

class VehicleProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get manufacturer => text()();

  TextColumn get model => text()();

  TextColumn get engineDetails => text().nullable()();

  TextColumn get drivetrain => text().nullable()();

  IntColumn get year => integer().nullable()();

  TextColumn get nickname => text().nullable()();

  TextColumn get vin => text().nullable()();

  IntColumn get currentOdometerKm => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
