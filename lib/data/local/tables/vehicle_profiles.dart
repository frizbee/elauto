import 'package:drift/drift.dart';

import 'vehicle_brands.dart';
import 'vehicle_models.dart';
import 'vehicle_types.dart';

class VehicleProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vehicleTypeId =>
      integer().references(VehicleTypes, #id, onDelete: KeyAction.restrict)();

  IntColumn get vehicleBrandId =>
      integer().references(VehicleBrands, #id, onDelete: KeyAction.restrict)();

  IntColumn get vehicleModelId =>
      integer().references(VehicleModels, #id, onDelete: KeyAction.restrict)();

  TextColumn get engineDetails => text().nullable()();

  TextColumn get drivetrain => text().nullable()();

  IntColumn get year => integer().nullable()();

  TextColumn get nickname => text().nullable()();

  TextColumn get vin => text().nullable()();

  IntColumn get currentOdometerKm => integer().withDefault(const Constant(0))();

  TextColumn get odometerUnit => text().withDefault(const Constant('km'))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
