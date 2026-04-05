import 'package:drift/drift.dart';

import 'vehicle_brands.dart';

class VehicleModels extends Table {
  @override
  String get tableName => 'vehicle_models';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get vehicleBrandId =>
      integer().references(VehicleBrands, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text()();

  BoolColumn get isUserDefined =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {vehicleBrandId, name},
  ];
}
