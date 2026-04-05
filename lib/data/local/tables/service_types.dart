import 'package:drift/drift.dart';

class ServiceTypes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  IntColumn get defaultIntervalKm => integer().nullable()();

  IntColumn get defaultIntervalMonths => integer().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
