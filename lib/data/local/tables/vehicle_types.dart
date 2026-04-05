import 'package:drift/drift.dart';

class VehicleTypes extends Table {
  @override
  String get tableName => 'vehicle_types';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
