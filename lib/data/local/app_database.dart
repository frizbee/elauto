import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tables/maintenance_records.dart';
import 'tables/reminder_rules.dart';
import 'tables/service_types.dart';
import 'tables/vehicle_profiles.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    VehicleProfiles,
    ServiceTypes,
    ReminderRules,
    MaintenanceRecords,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
          await _seedDefaultServiceTypes();
        },
      );

  Future<VehicleProfile?> getPrimaryVehicle() {
    return select(vehicleProfiles).getSingleOrNull();
  }

  Future<List<MaintenanceRecord>> getRecentMaintenanceRecords({
    int limit = 10,
  }) {
    final query = select(maintenanceRecords)
      ..orderBy([
        (table) => OrderingTerm.desc(table.serviceDate),
        (table) => OrderingTerm.desc(table.createdAt),
      ])
      ..limit(limit);

    return query.get();
  }

  Future<int> saveVehicleProfile(VehicleProfilesCompanion profile) {
    return into(vehicleProfiles).insert(profile);
  }

  Future<int> addMaintenanceRecord(MaintenanceRecordsCompanion record) {
    return into(maintenanceRecords).insert(record);
  }

  Future<List<ServiceType>> getActiveServiceTypes() {
    final query = select(serviceTypes)
      ..where((table) => table.isActive.equals(true))
      ..orderBy([(table) => OrderingTerm.asc(table.name)]);

    return query.get();
  }

  Future<void> _seedDefaultServiceTypes() async {
    await batch((batch) {
      batch.insertAll(
        serviceTypes,
        const [
          ServiceTypesCompanion.insert(
            code: 'engine_oil_change',
            name: 'Engine Oil Change',
            description: Value('Routine engine oil and filter service'),
            defaultIntervalKm: Value(8000),
          ),
          ServiceTypesCompanion.insert(
            code: 'spark_plug_replacement',
            name: 'Spark Plug Replacement',
            description: Value('Spark plug inspection or replacement'),
            defaultIntervalKm: Value(40000),
          ),
          ServiceTypesCompanion.insert(
            code: 'brake_service',
            name: 'Brake Service',
            description: Value('Brake pad, rotor, or fluid maintenance'),
            defaultIntervalKm: Value(20000),
          ),
          ServiceTypesCompanion.insert(
            code: 'tire_rotation',
            name: 'Tire Rotation',
            description: Value('Routine tire rotation service'),
            defaultIntervalKm: Value(10000),
          ),
        ],
      );
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final databaseFile = File(
      path.join(documentsDirectory.path, 'repack.sqlite'),
    );

    return NativeDatabase.createInBackground(databaseFile);
  });
}
