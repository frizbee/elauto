import 'package:drift/drift.dart';

import 'vehicle_types.dart';

class VehicleBrands extends Table {
  @override
  String get tableName => 'vehicle_brands';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get vehicleTypeId =>
      integer().references(VehicleTypes, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text()();

  BoolColumn get isUserDefined =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {vehicleTypeId, name},
  ];
}
