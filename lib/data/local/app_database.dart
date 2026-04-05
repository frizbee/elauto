import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tables/maintenance_records.dart';
import 'tables/reminder_rules.dart';
import 'tables/service_types.dart';
import 'tables/vehicle_brands.dart';
import 'tables/vehicle_models.dart';
import 'tables/vehicle_profiles.dart';
import 'tables/vehicle_types.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    VehicleTypes,
    VehicleBrands,
    VehicleModels,
    VehicleProfiles,
    ServiceTypes,
    ReminderRules,
    MaintenanceRecords,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator migrator) async {
      await migrator.createAll();
      await _seedVehicleCatalog();
      await _seedDefaultServiceTypes();
    },
    onUpgrade: (Migrator migrator, int from, int to) async {
      if (from < 2) {
        await migrator.createTable(vehicleTypes);
        await migrator.createTable(vehicleBrands);
        await migrator.createTable(vehicleModels);
        await migrator.deleteTable('vehicle_profiles');
        await migrator.createTable(vehicleProfiles);
        await _seedVehicleCatalog();
      }

      if (from >= 2 && from < 3) {
        await customStatement(
          'ALTER TABLE cehicle_types RENAME TO vehicle_types',
        );
        await customStatement(
          'ALTER TABLE vehicel_brands RENAME TO vehicle_brands',
        );
        await customStatement(
          'ALTER TABLE vehicel_models RENAME TO vehicle_models',
        );
        await customStatement(
          'ALTER TABLE vehicle_profiles RENAME COLUMN cehicle_type_id TO vehicle_type_id',
        );
        await customStatement(
          'ALTER TABLE vehicle_profiles RENAME COLUMN vehicel_brand_id TO vehicle_brand_id',
        );
        await customStatement(
          'ALTER TABLE vehicle_profiles RENAME COLUMN vehicel_model_id TO vehicle_model_id',
        );
      }

      if (from < 4) {
        await migrator.addColumn(vehicleProfiles, vehicleProfiles.odometerUnit);
      }

      if (from < 5) {
        await migrator.addColumn(vehicleProfiles, vehicleProfiles.plateNumber);
      }
    },
  );

  Future<VehicleProfile?> getPrimaryVehicle() {
    return select(vehicleProfiles).getSingleOrNull();
  }

  Future<List<VehicleType>> getVehicleTypes() {
    final query = select(vehicleTypes)
      ..orderBy([(table) => OrderingTerm.asc(table.id)]);

    return query.get();
  }

  Future<List<VehicleBrand>> searchVehicleBrands({
    required int vehicleTypeId,
    String query = '',
  }) {
    final normalizedQuery = query.trim().toLowerCase();
    final statement = select(vehicleBrands)
      ..where((table) => table.vehicleTypeId.equals(vehicleTypeId));

    if (normalizedQuery.isNotEmpty) {
      statement.where((table) => table.name.lower().contains(normalizedQuery));
    }

    statement.orderBy([(table) => OrderingTerm.asc(table.name)]);
    return statement.get();
  }

  Future<List<VehicleModel>> searchVehicleModels({
    required int vehicleBrandId,
    String query = '',
  }) {
    final normalizedQuery = query.trim().toLowerCase();
    final statement = select(vehicleModels)
      ..where((table) => table.vehicleBrandId.equals(vehicleBrandId));

    if (normalizedQuery.isNotEmpty) {
      statement.where((table) => table.name.lower().contains(normalizedQuery));
    }

    statement.orderBy([(table) => OrderingTerm.asc(table.name)]);
    return statement.get();
  }

  Future<int> addVehicleBrand({
    required int vehicleTypeId,
    required String name,
  }) {
    return into(vehicleBrands).insert(
      VehicleBrandsCompanion.insert(
        vehicleTypeId: vehicleTypeId,
        name: name.trim(),
        isUserDefined: const Value(true),
      ),
    );
  }

  Future<VehicleBrand> getVehicleBrandById(int id) {
    return (select(
      vehicleBrands,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  Future<int> addVehicleModel({
    required int vehicleBrandId,
    required String name,
  }) {
    return into(vehicleModels).insert(
      VehicleModelsCompanion.insert(
        vehicleBrandId: vehicleBrandId,
        name: name.trim(),
        isUserDefined: const Value(true),
      ),
    );
  }

  Future<VehicleModel> getVehicleModelById(int id) {
    return (select(
      vehicleModels,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  Future<int> createVehicleProfile({
    required int vehicleTypeId,
    required int vehicleBrandId,
    required int vehicleModelId,
    required int year,
    required int currentOdometerKm,
    required String odometerUnit,
    String? vin,
    String? plateNumber,
  }) {
    return into(vehicleProfiles).insert(
      VehicleProfilesCompanion.insert(
        vehicleTypeId: vehicleTypeId,
        vehicleBrandId: vehicleBrandId,
        vehicleModelId: vehicleModelId,
        year: Value(year),
        vin: Value(vin),
        plateNumber: Value(plateNumber),
        currentOdometerKm: Value(currentOdometerKm),
        odometerUnit: Value(odometerUnit),
      ),
    );
  }

  Future<VehicleCatalogProfile?> getPrimaryVehicleCatalogProfile() async {
    final profile = await getPrimaryVehicle();

    if (profile == null) {
      return null;
    }

    final type = await (select(
      vehicleTypes,
    )..where((table) => table.id.equals(profile.vehicleTypeId))).getSingle();
    final brand = await (select(
      vehicleBrands,
    )..where((table) => table.id.equals(profile.vehicleBrandId))).getSingle();
    final model = await (select(
      vehicleModels,
    )..where((table) => table.id.equals(profile.vehicleModelId))).getSingle();

    return VehicleCatalogProfile(
      profile: profile,
      vehicleType: type,
      vehicleBrand: brand,
      vehicleModel: model,
    );
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
      batch.insertAll(serviceTypes, [
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
      ]);
    });
  }

  Future<void> _seedVehicleCatalog() async {
    const seedData = [
      SeedVehicleType(
        code: 'car',
        name: 'Car',
        brands: [
          SeedBrand(
            name: 'Toyota',
            models: ['Corolla', 'Camry', 'Yaris', 'RAV4', 'Hilux'],
          ),
          SeedBrand(
            name: 'Honda',
            models: ['Civic', 'Accord', 'City', 'CR-V', 'HR-V'],
          ),
          SeedBrand(
            name: 'Nissan',
            models: ['Sunny', 'Sentra', 'Altima', 'X-Trail', 'Patrol'],
          ),
          SeedBrand(
            name: 'Mazda',
            models: ['Mazda2', 'Mazda3', 'Mazda6', 'CX-3', 'CX-5'],
          ),
          SeedBrand(
            name: 'Hyundai',
            models: ['Accent', 'Elantra', 'Sonata', 'Tucson', 'Santa Fe'],
          ),
          SeedBrand(
            name: 'Kia',
            models: ['Rio', 'Cerato', 'Sportage', 'Sorento', 'Picanto'],
          ),
          SeedBrand(
            name: 'BMW',
            models: ['3 Series', '5 Series', 'X1', 'X3', 'X5'],
          ),
          SeedBrand(
            name: 'Mercedes-Benz',
            models: ['A-Class', 'C-Class', 'E-Class', 'GLA', 'GLE'],
          ),
        ],
      ),
      SeedVehicleType(
        code: 'motorcycle',
        name: 'Motorcycle',
        brands: [
          SeedBrand(
            name: 'Yamaha',
            models: ['NMAX', 'Aerox', 'R15', 'MT-15', 'FZ'],
          ),
          SeedBrand(
            name: 'Honda',
            models: ['PCX', 'ADV160', 'CBR150R', 'Beat', 'Vario'],
          ),
          SeedBrand(
            name: 'Suzuki',
            models: ['GSX-R150', 'Burgman', 'Address', 'Smash', 'V-Strom'],
          ),
          SeedBrand(
            name: 'Kawasaki',
            models: ['Ninja 250', 'Z650', 'KLX 150', 'Versys', 'W175'],
          ),
          SeedBrand(
            name: 'KTM',
            models: ['Duke 200', 'RC 390', 'Adventure 390', 'Duke 390'],
          ),
          SeedBrand(
            name: 'Ducati',
            models: ['Monster', 'Scrambler', 'Panigale', 'Multistrada'],
          ),
        ],
      ),
      SeedVehicleType(
        code: 'bicycle',
        name: 'Bicycle',
        brands: [
          SeedBrand(
            name: 'Trek',
            models: ['Domane', 'Marlin', 'Fuel EX', 'Émonda'],
          ),
          SeedBrand(
            name: 'Giant',
            models: ['Escape', 'Talon', 'Defy', 'Trance'],
          ),
          SeedBrand(
            name: 'Specialized',
            models: ['Allez', 'Rockhopper', 'Tarmac', 'Stumpjumper'],
          ),
          SeedBrand(
            name: 'Cannondale',
            models: ['CAAD', 'Trail', 'Synapse', 'Topstone'],
          ),
          SeedBrand(
            name: 'Scott',
            models: ['Speedster', 'Aspect', 'Spark', 'Addict'],
          ),
        ],
      ),
    ];

    for (final typeSeed in seedData) {
      final typeId = await into(vehicleTypes).insertReturning(
        VehicleTypesCompanion.insert(code: typeSeed.code, name: typeSeed.name),
        onConflict: DoUpdate(
          (old) => VehicleTypesCompanion(
            name: Value(typeSeed.name),
            updatedAt: Value(DateTime.now()),
          ),
        ),
      );

      for (final brandSeed in typeSeed.brands) {
        final brandId = await into(vehicleBrands).insertReturning(
          VehicleBrandsCompanion.insert(
            vehicleTypeId: typeId.id,
            name: brandSeed.name,
          ),
          onConflict: DoUpdate(
            (old) => VehicleBrandsCompanion(updatedAt: Value(DateTime.now())),
          ),
        );

        for (final modelName in brandSeed.models) {
          await into(vehicleModels).insert(
            VehicleModelsCompanion.insert(
              vehicleBrandId: brandId.id,
              name: modelName,
            ),
            onConflict: DoNothing(),
          );
        }
      }
    }
  }
}

class VehicleCatalogProfile {
  const VehicleCatalogProfile({
    required this.profile,
    required this.vehicleType,
    required this.vehicleBrand,
    required this.vehicleModel,
  });

  final VehicleProfile profile;
  final VehicleType vehicleType;
  final VehicleBrand vehicleBrand;
  final VehicleModel vehicleModel;
}

class SeedVehicleType {
  const SeedVehicleType({
    required this.code,
    required this.name,
    required this.brands,
  });

  final String code;
  final String name;
  final List<SeedBrand> brands;
}

class SeedBrand {
  const SeedBrand({required this.name, required this.models});

  final String name;
  final List<String> models;
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
