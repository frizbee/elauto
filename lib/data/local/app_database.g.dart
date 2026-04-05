// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VehicleTypesTable extends VehicleTypes
    with TableInfo<$VehicleTypesTable, VehicleType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VehicleTypesTable createAlias(String alias) {
    return $VehicleTypesTable(attachedDatabase, alias);
  }
}

class VehicleType extends DataClass implements Insertable<VehicleType> {
  final int id;
  final String code;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VehicleType({
    required this.id,
    required this.code,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VehicleTypesCompanion toCompanion(bool nullToAbsent) {
    return VehicleTypesCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VehicleType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleType(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VehicleType copyWith({
    int? id,
    String? code,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VehicleType(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VehicleType copyWithCompanion(VehicleTypesCompanion data) {
    return VehicleType(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleType(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleType &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VehicleTypesCompanion extends UpdateCompanion<VehicleType> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VehicleTypesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VehicleTypesCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<VehicleType> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VehicleTypesCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VehicleTypesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleTypesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VehicleBrandsTable extends VehicleBrands
    with TableInfo<$VehicleBrandsTable, VehicleBrand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleBrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicleTypeIdMeta = const VerificationMeta(
    'vehicleTypeId',
  );
  @override
  late final GeneratedColumn<int> vehicleTypeId = GeneratedColumn<int>(
    'vehicle_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_types (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUserDefinedMeta = const VerificationMeta(
    'isUserDefined',
  );
  @override
  late final GeneratedColumn<bool> isUserDefined = GeneratedColumn<bool>(
    'is_user_defined',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_defined" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleTypeId,
    name,
    isUserDefined,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_brands';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleBrand> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_type_id')) {
      context.handle(
        _vehicleTypeIdMeta,
        vehicleTypeId.isAcceptableOrUnknown(
          data['vehicle_type_id']!,
          _vehicleTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleTypeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_user_defined')) {
      context.handle(
        _isUserDefinedMeta,
        isUserDefined.isAcceptableOrUnknown(
          data['is_user_defined']!,
          _isUserDefinedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {vehicleTypeId, name},
  ];
  @override
  VehicleBrand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleBrand(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vehicleTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_type_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isUserDefined: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user_defined'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VehicleBrandsTable createAlias(String alias) {
    return $VehicleBrandsTable(attachedDatabase, alias);
  }
}

class VehicleBrand extends DataClass implements Insertable<VehicleBrand> {
  final int id;
  final int vehicleTypeId;
  final String name;
  final bool isUserDefined;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VehicleBrand({
    required this.id,
    required this.vehicleTypeId,
    required this.name,
    required this.isUserDefined,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_type_id'] = Variable<int>(vehicleTypeId);
    map['name'] = Variable<String>(name);
    map['is_user_defined'] = Variable<bool>(isUserDefined);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VehicleBrandsCompanion toCompanion(bool nullToAbsent) {
    return VehicleBrandsCompanion(
      id: Value(id),
      vehicleTypeId: Value(vehicleTypeId),
      name: Value(name),
      isUserDefined: Value(isUserDefined),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VehicleBrand.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleBrand(
      id: serializer.fromJson<int>(json['id']),
      vehicleTypeId: serializer.fromJson<int>(json['vehicleTypeId']),
      name: serializer.fromJson<String>(json['name']),
      isUserDefined: serializer.fromJson<bool>(json['isUserDefined']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleTypeId': serializer.toJson<int>(vehicleTypeId),
      'name': serializer.toJson<String>(name),
      'isUserDefined': serializer.toJson<bool>(isUserDefined),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VehicleBrand copyWith({
    int? id,
    int? vehicleTypeId,
    String? name,
    bool? isUserDefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VehicleBrand(
    id: id ?? this.id,
    vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
    name: name ?? this.name,
    isUserDefined: isUserDefined ?? this.isUserDefined,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VehicleBrand copyWithCompanion(VehicleBrandsCompanion data) {
    return VehicleBrand(
      id: data.id.present ? data.id.value : this.id,
      vehicleTypeId: data.vehicleTypeId.present
          ? data.vehicleTypeId.value
          : this.vehicleTypeId,
      name: data.name.present ? data.name.value : this.name,
      isUserDefined: data.isUserDefined.present
          ? data.isUserDefined.value
          : this.isUserDefined,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleBrand(')
          ..write('id: $id, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('name: $name, ')
          ..write('isUserDefined: $isUserDefined, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vehicleTypeId, name, isUserDefined, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleBrand &&
          other.id == this.id &&
          other.vehicleTypeId == this.vehicleTypeId &&
          other.name == this.name &&
          other.isUserDefined == this.isUserDefined &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VehicleBrandsCompanion extends UpdateCompanion<VehicleBrand> {
  final Value<int> id;
  final Value<int> vehicleTypeId;
  final Value<String> name;
  final Value<bool> isUserDefined;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VehicleBrandsCompanion({
    this.id = const Value.absent(),
    this.vehicleTypeId = const Value.absent(),
    this.name = const Value.absent(),
    this.isUserDefined = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VehicleBrandsCompanion.insert({
    this.id = const Value.absent(),
    required int vehicleTypeId,
    required String name,
    this.isUserDefined = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : vehicleTypeId = Value(vehicleTypeId),
       name = Value(name);
  static Insertable<VehicleBrand> custom({
    Expression<int>? id,
    Expression<int>? vehicleTypeId,
    Expression<String>? name,
    Expression<bool>? isUserDefined,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleTypeId != null) 'vehicle_type_id': vehicleTypeId,
      if (name != null) 'name': name,
      if (isUserDefined != null) 'is_user_defined': isUserDefined,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VehicleBrandsCompanion copyWith({
    Value<int>? id,
    Value<int>? vehicleTypeId,
    Value<String>? name,
    Value<bool>? isUserDefined,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VehicleBrandsCompanion(
      id: id ?? this.id,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      name: name ?? this.name,
      isUserDefined: isUserDefined ?? this.isUserDefined,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleTypeId.present) {
      map['vehicle_type_id'] = Variable<int>(vehicleTypeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isUserDefined.present) {
      map['is_user_defined'] = Variable<bool>(isUserDefined.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleBrandsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('name: $name, ')
          ..write('isUserDefined: $isUserDefined, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VehicleModelsTable extends VehicleModels
    with TableInfo<$VehicleModelsTable, VehicleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicleBrandIdMeta = const VerificationMeta(
    'vehicleBrandId',
  );
  @override
  late final GeneratedColumn<int> vehicleBrandId = GeneratedColumn<int>(
    'vehicle_brand_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_brands (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUserDefinedMeta = const VerificationMeta(
    'isUserDefined',
  );
  @override
  late final GeneratedColumn<bool> isUserDefined = GeneratedColumn<bool>(
    'is_user_defined',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_defined" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleBrandId,
    name,
    isUserDefined,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_brand_id')) {
      context.handle(
        _vehicleBrandIdMeta,
        vehicleBrandId.isAcceptableOrUnknown(
          data['vehicle_brand_id']!,
          _vehicleBrandIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleBrandIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_user_defined')) {
      context.handle(
        _isUserDefinedMeta,
        isUserDefined.isAcceptableOrUnknown(
          data['is_user_defined']!,
          _isUserDefinedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {vehicleBrandId, name},
  ];
  @override
  VehicleModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vehicleBrandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_brand_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isUserDefined: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user_defined'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VehicleModelsTable createAlias(String alias) {
    return $VehicleModelsTable(attachedDatabase, alias);
  }
}

class VehicleModel extends DataClass implements Insertable<VehicleModel> {
  final int id;
  final int vehicleBrandId;
  final String name;
  final bool isUserDefined;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VehicleModel({
    required this.id,
    required this.vehicleBrandId,
    required this.name,
    required this.isUserDefined,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_brand_id'] = Variable<int>(vehicleBrandId);
    map['name'] = Variable<String>(name);
    map['is_user_defined'] = Variable<bool>(isUserDefined);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VehicleModelsCompanion toCompanion(bool nullToAbsent) {
    return VehicleModelsCompanion(
      id: Value(id),
      vehicleBrandId: Value(vehicleBrandId),
      name: Value(name),
      isUserDefined: Value(isUserDefined),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VehicleModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleModel(
      id: serializer.fromJson<int>(json['id']),
      vehicleBrandId: serializer.fromJson<int>(json['vehicleBrandId']),
      name: serializer.fromJson<String>(json['name']),
      isUserDefined: serializer.fromJson<bool>(json['isUserDefined']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleBrandId': serializer.toJson<int>(vehicleBrandId),
      'name': serializer.toJson<String>(name),
      'isUserDefined': serializer.toJson<bool>(isUserDefined),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VehicleModel copyWith({
    int? id,
    int? vehicleBrandId,
    String? name,
    bool? isUserDefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VehicleModel(
    id: id ?? this.id,
    vehicleBrandId: vehicleBrandId ?? this.vehicleBrandId,
    name: name ?? this.name,
    isUserDefined: isUserDefined ?? this.isUserDefined,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VehicleModel copyWithCompanion(VehicleModelsCompanion data) {
    return VehicleModel(
      id: data.id.present ? data.id.value : this.id,
      vehicleBrandId: data.vehicleBrandId.present
          ? data.vehicleBrandId.value
          : this.vehicleBrandId,
      name: data.name.present ? data.name.value : this.name,
      isUserDefined: data.isUserDefined.present
          ? data.isUserDefined.value
          : this.isUserDefined,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleModel(')
          ..write('id: $id, ')
          ..write('vehicleBrandId: $vehicleBrandId, ')
          ..write('name: $name, ')
          ..write('isUserDefined: $isUserDefined, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleBrandId,
    name,
    isUserDefined,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleModel &&
          other.id == this.id &&
          other.vehicleBrandId == this.vehicleBrandId &&
          other.name == this.name &&
          other.isUserDefined == this.isUserDefined &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VehicleModelsCompanion extends UpdateCompanion<VehicleModel> {
  final Value<int> id;
  final Value<int> vehicleBrandId;
  final Value<String> name;
  final Value<bool> isUserDefined;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VehicleModelsCompanion({
    this.id = const Value.absent(),
    this.vehicleBrandId = const Value.absent(),
    this.name = const Value.absent(),
    this.isUserDefined = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VehicleModelsCompanion.insert({
    this.id = const Value.absent(),
    required int vehicleBrandId,
    required String name,
    this.isUserDefined = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : vehicleBrandId = Value(vehicleBrandId),
       name = Value(name);
  static Insertable<VehicleModel> custom({
    Expression<int>? id,
    Expression<int>? vehicleBrandId,
    Expression<String>? name,
    Expression<bool>? isUserDefined,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleBrandId != null) 'vehicle_brand_id': vehicleBrandId,
      if (name != null) 'name': name,
      if (isUserDefined != null) 'is_user_defined': isUserDefined,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VehicleModelsCompanion copyWith({
    Value<int>? id,
    Value<int>? vehicleBrandId,
    Value<String>? name,
    Value<bool>? isUserDefined,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VehicleModelsCompanion(
      id: id ?? this.id,
      vehicleBrandId: vehicleBrandId ?? this.vehicleBrandId,
      name: name ?? this.name,
      isUserDefined: isUserDefined ?? this.isUserDefined,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleBrandId.present) {
      map['vehicle_brand_id'] = Variable<int>(vehicleBrandId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isUserDefined.present) {
      map['is_user_defined'] = Variable<bool>(isUserDefined.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleModelsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleBrandId: $vehicleBrandId, ')
          ..write('name: $name, ')
          ..write('isUserDefined: $isUserDefined, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VehicleProfilesTable extends VehicleProfiles
    with TableInfo<$VehicleProfilesTable, VehicleProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicleTypeIdMeta = const VerificationMeta(
    'vehicleTypeId',
  );
  @override
  late final GeneratedColumn<int> vehicleTypeId = GeneratedColumn<int>(
    'vehicle_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_types (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _vehicleBrandIdMeta = const VerificationMeta(
    'vehicleBrandId',
  );
  @override
  late final GeneratedColumn<int> vehicleBrandId = GeneratedColumn<int>(
    'vehicle_brand_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_brands (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _vehicleModelIdMeta = const VerificationMeta(
    'vehicleModelId',
  );
  @override
  late final GeneratedColumn<int> vehicleModelId = GeneratedColumn<int>(
    'vehicle_model_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_models (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _engineDetailsMeta = const VerificationMeta(
    'engineDetails',
  );
  @override
  late final GeneratedColumn<String> engineDetails = GeneratedColumn<String>(
    'engine_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _drivetrainMeta = const VerificationMeta(
    'drivetrain',
  );
  @override
  late final GeneratedColumn<String> drivetrain = GeneratedColumn<String>(
    'drivetrain',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vinMeta = const VerificationMeta('vin');
  @override
  late final GeneratedColumn<String> vin = GeneratedColumn<String>(
    'vin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentOdometerKmMeta = const VerificationMeta(
    'currentOdometerKm',
  );
  @override
  late final GeneratedColumn<int> currentOdometerKm = GeneratedColumn<int>(
    'current_odometer_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _odometerUnitMeta = const VerificationMeta(
    'odometerUnit',
  );
  @override
  late final GeneratedColumn<String> odometerUnit = GeneratedColumn<String>(
    'odometer_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('km'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleTypeId,
    vehicleBrandId,
    vehicleModelId,
    engineDetails,
    drivetrain,
    year,
    nickname,
    vin,
    currentOdometerKm,
    odometerUnit,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_type_id')) {
      context.handle(
        _vehicleTypeIdMeta,
        vehicleTypeId.isAcceptableOrUnknown(
          data['vehicle_type_id']!,
          _vehicleTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleTypeIdMeta);
    }
    if (data.containsKey('vehicle_brand_id')) {
      context.handle(
        _vehicleBrandIdMeta,
        vehicleBrandId.isAcceptableOrUnknown(
          data['vehicle_brand_id']!,
          _vehicleBrandIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleBrandIdMeta);
    }
    if (data.containsKey('vehicle_model_id')) {
      context.handle(
        _vehicleModelIdMeta,
        vehicleModelId.isAcceptableOrUnknown(
          data['vehicle_model_id']!,
          _vehicleModelIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleModelIdMeta);
    }
    if (data.containsKey('engine_details')) {
      context.handle(
        _engineDetailsMeta,
        engineDetails.isAcceptableOrUnknown(
          data['engine_details']!,
          _engineDetailsMeta,
        ),
      );
    }
    if (data.containsKey('drivetrain')) {
      context.handle(
        _drivetrainMeta,
        drivetrain.isAcceptableOrUnknown(data['drivetrain']!, _drivetrainMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('vin')) {
      context.handle(
        _vinMeta,
        vin.isAcceptableOrUnknown(data['vin']!, _vinMeta),
      );
    }
    if (data.containsKey('current_odometer_km')) {
      context.handle(
        _currentOdometerKmMeta,
        currentOdometerKm.isAcceptableOrUnknown(
          data['current_odometer_km']!,
          _currentOdometerKmMeta,
        ),
      );
    }
    if (data.containsKey('odometer_unit')) {
      context.handle(
        _odometerUnitMeta,
        odometerUnit.isAcceptableOrUnknown(
          data['odometer_unit']!,
          _odometerUnitMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vehicleTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_type_id'],
      )!,
      vehicleBrandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_brand_id'],
      )!,
      vehicleModelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_model_id'],
      )!,
      engineDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}engine_details'],
      ),
      drivetrain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drivetrain'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      vin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vin'],
      ),
      currentOdometerKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_odometer_km'],
      )!,
      odometerUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}odometer_unit'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VehicleProfilesTable createAlias(String alias) {
    return $VehicleProfilesTable(attachedDatabase, alias);
  }
}

class VehicleProfile extends DataClass implements Insertable<VehicleProfile> {
  final int id;
  final int vehicleTypeId;
  final int vehicleBrandId;
  final int vehicleModelId;
  final String? engineDetails;
  final String? drivetrain;
  final int? year;
  final String? nickname;
  final String? vin;
  final int currentOdometerKm;
  final String odometerUnit;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VehicleProfile({
    required this.id,
    required this.vehicleTypeId,
    required this.vehicleBrandId,
    required this.vehicleModelId,
    this.engineDetails,
    this.drivetrain,
    this.year,
    this.nickname,
    this.vin,
    required this.currentOdometerKm,
    required this.odometerUnit,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_type_id'] = Variable<int>(vehicleTypeId);
    map['vehicle_brand_id'] = Variable<int>(vehicleBrandId);
    map['vehicle_model_id'] = Variable<int>(vehicleModelId);
    if (!nullToAbsent || engineDetails != null) {
      map['engine_details'] = Variable<String>(engineDetails);
    }
    if (!nullToAbsent || drivetrain != null) {
      map['drivetrain'] = Variable<String>(drivetrain);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || vin != null) {
      map['vin'] = Variable<String>(vin);
    }
    map['current_odometer_km'] = Variable<int>(currentOdometerKm);
    map['odometer_unit'] = Variable<String>(odometerUnit);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VehicleProfilesCompanion toCompanion(bool nullToAbsent) {
    return VehicleProfilesCompanion(
      id: Value(id),
      vehicleTypeId: Value(vehicleTypeId),
      vehicleBrandId: Value(vehicleBrandId),
      vehicleModelId: Value(vehicleModelId),
      engineDetails: engineDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(engineDetails),
      drivetrain: drivetrain == null && nullToAbsent
          ? const Value.absent()
          : Value(drivetrain),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      vin: vin == null && nullToAbsent ? const Value.absent() : Value(vin),
      currentOdometerKm: Value(currentOdometerKm),
      odometerUnit: Value(odometerUnit),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VehicleProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleProfile(
      id: serializer.fromJson<int>(json['id']),
      vehicleTypeId: serializer.fromJson<int>(json['vehicleTypeId']),
      vehicleBrandId: serializer.fromJson<int>(json['vehicleBrandId']),
      vehicleModelId: serializer.fromJson<int>(json['vehicleModelId']),
      engineDetails: serializer.fromJson<String?>(json['engineDetails']),
      drivetrain: serializer.fromJson<String?>(json['drivetrain']),
      year: serializer.fromJson<int?>(json['year']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      vin: serializer.fromJson<String?>(json['vin']),
      currentOdometerKm: serializer.fromJson<int>(json['currentOdometerKm']),
      odometerUnit: serializer.fromJson<String>(json['odometerUnit']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleTypeId': serializer.toJson<int>(vehicleTypeId),
      'vehicleBrandId': serializer.toJson<int>(vehicleBrandId),
      'vehicleModelId': serializer.toJson<int>(vehicleModelId),
      'engineDetails': serializer.toJson<String?>(engineDetails),
      'drivetrain': serializer.toJson<String?>(drivetrain),
      'year': serializer.toJson<int?>(year),
      'nickname': serializer.toJson<String?>(nickname),
      'vin': serializer.toJson<String?>(vin),
      'currentOdometerKm': serializer.toJson<int>(currentOdometerKm),
      'odometerUnit': serializer.toJson<String>(odometerUnit),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VehicleProfile copyWith({
    int? id,
    int? vehicleTypeId,
    int? vehicleBrandId,
    int? vehicleModelId,
    Value<String?> engineDetails = const Value.absent(),
    Value<String?> drivetrain = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<String?> nickname = const Value.absent(),
    Value<String?> vin = const Value.absent(),
    int? currentOdometerKm,
    String? odometerUnit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VehicleProfile(
    id: id ?? this.id,
    vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
    vehicleBrandId: vehicleBrandId ?? this.vehicleBrandId,
    vehicleModelId: vehicleModelId ?? this.vehicleModelId,
    engineDetails: engineDetails.present
        ? engineDetails.value
        : this.engineDetails,
    drivetrain: drivetrain.present ? drivetrain.value : this.drivetrain,
    year: year.present ? year.value : this.year,
    nickname: nickname.present ? nickname.value : this.nickname,
    vin: vin.present ? vin.value : this.vin,
    currentOdometerKm: currentOdometerKm ?? this.currentOdometerKm,
    odometerUnit: odometerUnit ?? this.odometerUnit,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VehicleProfile copyWithCompanion(VehicleProfilesCompanion data) {
    return VehicleProfile(
      id: data.id.present ? data.id.value : this.id,
      vehicleTypeId: data.vehicleTypeId.present
          ? data.vehicleTypeId.value
          : this.vehicleTypeId,
      vehicleBrandId: data.vehicleBrandId.present
          ? data.vehicleBrandId.value
          : this.vehicleBrandId,
      vehicleModelId: data.vehicleModelId.present
          ? data.vehicleModelId.value
          : this.vehicleModelId,
      engineDetails: data.engineDetails.present
          ? data.engineDetails.value
          : this.engineDetails,
      drivetrain: data.drivetrain.present
          ? data.drivetrain.value
          : this.drivetrain,
      year: data.year.present ? data.year.value : this.year,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      vin: data.vin.present ? data.vin.value : this.vin,
      currentOdometerKm: data.currentOdometerKm.present
          ? data.currentOdometerKm.value
          : this.currentOdometerKm,
      odometerUnit: data.odometerUnit.present
          ? data.odometerUnit.value
          : this.odometerUnit,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleProfile(')
          ..write('id: $id, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('vehicleBrandId: $vehicleBrandId, ')
          ..write('vehicleModelId: $vehicleModelId, ')
          ..write('engineDetails: $engineDetails, ')
          ..write('drivetrain: $drivetrain, ')
          ..write('year: $year, ')
          ..write('nickname: $nickname, ')
          ..write('vin: $vin, ')
          ..write('currentOdometerKm: $currentOdometerKm, ')
          ..write('odometerUnit: $odometerUnit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleTypeId,
    vehicleBrandId,
    vehicleModelId,
    engineDetails,
    drivetrain,
    year,
    nickname,
    vin,
    currentOdometerKm,
    odometerUnit,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleProfile &&
          other.id == this.id &&
          other.vehicleTypeId == this.vehicleTypeId &&
          other.vehicleBrandId == this.vehicleBrandId &&
          other.vehicleModelId == this.vehicleModelId &&
          other.engineDetails == this.engineDetails &&
          other.drivetrain == this.drivetrain &&
          other.year == this.year &&
          other.nickname == this.nickname &&
          other.vin == this.vin &&
          other.currentOdometerKm == this.currentOdometerKm &&
          other.odometerUnit == this.odometerUnit &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VehicleProfilesCompanion extends UpdateCompanion<VehicleProfile> {
  final Value<int> id;
  final Value<int> vehicleTypeId;
  final Value<int> vehicleBrandId;
  final Value<int> vehicleModelId;
  final Value<String?> engineDetails;
  final Value<String?> drivetrain;
  final Value<int?> year;
  final Value<String?> nickname;
  final Value<String?> vin;
  final Value<int> currentOdometerKm;
  final Value<String> odometerUnit;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VehicleProfilesCompanion({
    this.id = const Value.absent(),
    this.vehicleTypeId = const Value.absent(),
    this.vehicleBrandId = const Value.absent(),
    this.vehicleModelId = const Value.absent(),
    this.engineDetails = const Value.absent(),
    this.drivetrain = const Value.absent(),
    this.year = const Value.absent(),
    this.nickname = const Value.absent(),
    this.vin = const Value.absent(),
    this.currentOdometerKm = const Value.absent(),
    this.odometerUnit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VehicleProfilesCompanion.insert({
    this.id = const Value.absent(),
    required int vehicleTypeId,
    required int vehicleBrandId,
    required int vehicleModelId,
    this.engineDetails = const Value.absent(),
    this.drivetrain = const Value.absent(),
    this.year = const Value.absent(),
    this.nickname = const Value.absent(),
    this.vin = const Value.absent(),
    this.currentOdometerKm = const Value.absent(),
    this.odometerUnit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : vehicleTypeId = Value(vehicleTypeId),
       vehicleBrandId = Value(vehicleBrandId),
       vehicleModelId = Value(vehicleModelId);
  static Insertable<VehicleProfile> custom({
    Expression<int>? id,
    Expression<int>? vehicleTypeId,
    Expression<int>? vehicleBrandId,
    Expression<int>? vehicleModelId,
    Expression<String>? engineDetails,
    Expression<String>? drivetrain,
    Expression<int>? year,
    Expression<String>? nickname,
    Expression<String>? vin,
    Expression<int>? currentOdometerKm,
    Expression<String>? odometerUnit,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleTypeId != null) 'vehicle_type_id': vehicleTypeId,
      if (vehicleBrandId != null) 'vehicle_brand_id': vehicleBrandId,
      if (vehicleModelId != null) 'vehicle_model_id': vehicleModelId,
      if (engineDetails != null) 'engine_details': engineDetails,
      if (drivetrain != null) 'drivetrain': drivetrain,
      if (year != null) 'year': year,
      if (nickname != null) 'nickname': nickname,
      if (vin != null) 'vin': vin,
      if (currentOdometerKm != null) 'current_odometer_km': currentOdometerKm,
      if (odometerUnit != null) 'odometer_unit': odometerUnit,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VehicleProfilesCompanion copyWith({
    Value<int>? id,
    Value<int>? vehicleTypeId,
    Value<int>? vehicleBrandId,
    Value<int>? vehicleModelId,
    Value<String?>? engineDetails,
    Value<String?>? drivetrain,
    Value<int?>? year,
    Value<String?>? nickname,
    Value<String?>? vin,
    Value<int>? currentOdometerKm,
    Value<String>? odometerUnit,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VehicleProfilesCompanion(
      id: id ?? this.id,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleBrandId: vehicleBrandId ?? this.vehicleBrandId,
      vehicleModelId: vehicleModelId ?? this.vehicleModelId,
      engineDetails: engineDetails ?? this.engineDetails,
      drivetrain: drivetrain ?? this.drivetrain,
      year: year ?? this.year,
      nickname: nickname ?? this.nickname,
      vin: vin ?? this.vin,
      currentOdometerKm: currentOdometerKm ?? this.currentOdometerKm,
      odometerUnit: odometerUnit ?? this.odometerUnit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleTypeId.present) {
      map['vehicle_type_id'] = Variable<int>(vehicleTypeId.value);
    }
    if (vehicleBrandId.present) {
      map['vehicle_brand_id'] = Variable<int>(vehicleBrandId.value);
    }
    if (vehicleModelId.present) {
      map['vehicle_model_id'] = Variable<int>(vehicleModelId.value);
    }
    if (engineDetails.present) {
      map['engine_details'] = Variable<String>(engineDetails.value);
    }
    if (drivetrain.present) {
      map['drivetrain'] = Variable<String>(drivetrain.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (vin.present) {
      map['vin'] = Variable<String>(vin.value);
    }
    if (currentOdometerKm.present) {
      map['current_odometer_km'] = Variable<int>(currentOdometerKm.value);
    }
    if (odometerUnit.present) {
      map['odometer_unit'] = Variable<String>(odometerUnit.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleProfilesCompanion(')
          ..write('id: $id, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('vehicleBrandId: $vehicleBrandId, ')
          ..write('vehicleModelId: $vehicleModelId, ')
          ..write('engineDetails: $engineDetails, ')
          ..write('drivetrain: $drivetrain, ')
          ..write('year: $year, ')
          ..write('nickname: $nickname, ')
          ..write('vin: $vin, ')
          ..write('currentOdometerKm: $currentOdometerKm, ')
          ..write('odometerUnit: $odometerUnit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ServiceTypesTable extends ServiceTypes
    with TableInfo<$ServiceTypesTable, ServiceType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultIntervalKmMeta = const VerificationMeta(
    'defaultIntervalKm',
  );
  @override
  late final GeneratedColumn<int> defaultIntervalKm = GeneratedColumn<int>(
    'default_interval_km',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultIntervalMonthsMeta =
      const VerificationMeta('defaultIntervalMonths');
  @override
  late final GeneratedColumn<int> defaultIntervalMonths = GeneratedColumn<int>(
    'default_interval_months',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    defaultIntervalKm,
    defaultIntervalMonths,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('default_interval_km')) {
      context.handle(
        _defaultIntervalKmMeta,
        defaultIntervalKm.isAcceptableOrUnknown(
          data['default_interval_km']!,
          _defaultIntervalKmMeta,
        ),
      );
    }
    if (data.containsKey('default_interval_months')) {
      context.handle(
        _defaultIntervalMonthsMeta,
        defaultIntervalMonths.isAcceptableOrUnknown(
          data['default_interval_months']!,
          _defaultIntervalMonthsMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      defaultIntervalKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_interval_km'],
      ),
      defaultIntervalMonths: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_interval_months'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ServiceTypesTable createAlias(String alias) {
    return $ServiceTypesTable(attachedDatabase, alias);
  }
}

class ServiceType extends DataClass implements Insertable<ServiceType> {
  final int id;
  final String code;
  final String name;
  final String? description;
  final int? defaultIntervalKm;
  final int? defaultIntervalMonths;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ServiceType({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    this.defaultIntervalKm,
    this.defaultIntervalMonths,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || defaultIntervalKm != null) {
      map['default_interval_km'] = Variable<int>(defaultIntervalKm);
    }
    if (!nullToAbsent || defaultIntervalMonths != null) {
      map['default_interval_months'] = Variable<int>(defaultIntervalMonths);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ServiceTypesCompanion toCompanion(bool nullToAbsent) {
    return ServiceTypesCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      defaultIntervalKm: defaultIntervalKm == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultIntervalKm),
      defaultIntervalMonths: defaultIntervalMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultIntervalMonths),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ServiceType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceType(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      defaultIntervalKm: serializer.fromJson<int?>(json['defaultIntervalKm']),
      defaultIntervalMonths: serializer.fromJson<int?>(
        json['defaultIntervalMonths'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'defaultIntervalKm': serializer.toJson<int?>(defaultIntervalKm),
      'defaultIntervalMonths': serializer.toJson<int?>(defaultIntervalMonths),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ServiceType copyWith({
    int? id,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<int?> defaultIntervalKm = const Value.absent(),
    Value<int?> defaultIntervalMonths = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ServiceType(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    defaultIntervalKm: defaultIntervalKm.present
        ? defaultIntervalKm.value
        : this.defaultIntervalKm,
    defaultIntervalMonths: defaultIntervalMonths.present
        ? defaultIntervalMonths.value
        : this.defaultIntervalMonths,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ServiceType copyWithCompanion(ServiceTypesCompanion data) {
    return ServiceType(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      defaultIntervalKm: data.defaultIntervalKm.present
          ? data.defaultIntervalKm.value
          : this.defaultIntervalKm,
      defaultIntervalMonths: data.defaultIntervalMonths.present
          ? data.defaultIntervalMonths.value
          : this.defaultIntervalMonths,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceType(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultIntervalKm: $defaultIntervalKm, ')
          ..write('defaultIntervalMonths: $defaultIntervalMonths, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    description,
    defaultIntervalKm,
    defaultIntervalMonths,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceType &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.defaultIntervalKm == this.defaultIntervalKm &&
          other.defaultIntervalMonths == this.defaultIntervalMonths &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ServiceTypesCompanion extends UpdateCompanion<ServiceType> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<int?> defaultIntervalKm;
  final Value<int?> defaultIntervalMonths;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ServiceTypesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.defaultIntervalKm = const Value.absent(),
    this.defaultIntervalMonths = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ServiceTypesCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    this.description = const Value.absent(),
    this.defaultIntervalKm = const Value.absent(),
    this.defaultIntervalMonths = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<ServiceType> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? defaultIntervalKm,
    Expression<int>? defaultIntervalMonths,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (defaultIntervalKm != null) 'default_interval_km': defaultIntervalKm,
      if (defaultIntervalMonths != null)
        'default_interval_months': defaultIntervalMonths,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ServiceTypesCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<int?>? defaultIntervalKm,
    Value<int?>? defaultIntervalMonths,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ServiceTypesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultIntervalKm: defaultIntervalKm ?? this.defaultIntervalKm,
      defaultIntervalMonths:
          defaultIntervalMonths ?? this.defaultIntervalMonths,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (defaultIntervalKm.present) {
      map['default_interval_km'] = Variable<int>(defaultIntervalKm.value);
    }
    if (defaultIntervalMonths.present) {
      map['default_interval_months'] = Variable<int>(
        defaultIntervalMonths.value,
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceTypesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultIntervalKm: $defaultIntervalKm, ')
          ..write('defaultIntervalMonths: $defaultIntervalMonths, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReminderRulesTable extends ReminderRules
    with TableInfo<$ReminderRulesTable, ReminderRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serviceTypeIdMeta = const VerificationMeta(
    'serviceTypeId',
  );
  @override
  late final GeneratedColumn<int> serviceTypeId = GeneratedColumn<int>(
    'service_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES service_types (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _intervalKmMeta = const VerificationMeta(
    'intervalKm',
  );
  @override
  late final GeneratedColumn<int> intervalKm = GeneratedColumn<int>(
    'interval_km',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intervalMonthsMeta = const VerificationMeta(
    'intervalMonths',
  );
  @override
  late final GeneratedColumn<int> intervalMonths = GeneratedColumn<int>(
    'interval_months',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _advanceNoticeKmMeta = const VerificationMeta(
    'advanceNoticeKm',
  );
  @override
  late final GeneratedColumn<int> advanceNoticeKm = GeneratedColumn<int>(
    'advance_notice_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(500),
  );
  static const VerificationMeta _advanceNoticeDaysMeta = const VerificationMeta(
    'advanceNoticeDays',
  );
  @override
  late final GeneratedColumn<int> advanceNoticeDays = GeneratedColumn<int>(
    'advance_notice_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(14),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    serviceTypeId,
    intervalKm,
    intervalMonths,
    advanceNoticeKm,
    advanceNoticeDays,
    isEnabled,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_type_id')) {
      context.handle(
        _serviceTypeIdMeta,
        serviceTypeId.isAcceptableOrUnknown(
          data['service_type_id']!,
          _serviceTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceTypeIdMeta);
    }
    if (data.containsKey('interval_km')) {
      context.handle(
        _intervalKmMeta,
        intervalKm.isAcceptableOrUnknown(data['interval_km']!, _intervalKmMeta),
      );
    }
    if (data.containsKey('interval_months')) {
      context.handle(
        _intervalMonthsMeta,
        intervalMonths.isAcceptableOrUnknown(
          data['interval_months']!,
          _intervalMonthsMeta,
        ),
      );
    }
    if (data.containsKey('advance_notice_km')) {
      context.handle(
        _advanceNoticeKmMeta,
        advanceNoticeKm.isAcceptableOrUnknown(
          data['advance_notice_km']!,
          _advanceNoticeKmMeta,
        ),
      );
    }
    if (data.containsKey('advance_notice_days')) {
      context.handle(
        _advanceNoticeDaysMeta,
        advanceNoticeDays.isAcceptableOrUnknown(
          data['advance_notice_days']!,
          _advanceNoticeDaysMeta,
        ),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      serviceTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}service_type_id'],
      )!,
      intervalKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_km'],
      ),
      intervalMonths: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_months'],
      ),
      advanceNoticeKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_notice_km'],
      )!,
      advanceNoticeDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_notice_days'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReminderRulesTable createAlias(String alias) {
    return $ReminderRulesTable(attachedDatabase, alias);
  }
}

class ReminderRule extends DataClass implements Insertable<ReminderRule> {
  final int id;
  final int serviceTypeId;
  final int? intervalKm;
  final int? intervalMonths;
  final int advanceNoticeKm;
  final int advanceNoticeDays;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ReminderRule({
    required this.id,
    required this.serviceTypeId,
    this.intervalKm,
    this.intervalMonths,
    required this.advanceNoticeKm,
    required this.advanceNoticeDays,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_type_id'] = Variable<int>(serviceTypeId);
    if (!nullToAbsent || intervalKm != null) {
      map['interval_km'] = Variable<int>(intervalKm);
    }
    if (!nullToAbsent || intervalMonths != null) {
      map['interval_months'] = Variable<int>(intervalMonths);
    }
    map['advance_notice_km'] = Variable<int>(advanceNoticeKm);
    map['advance_notice_days'] = Variable<int>(advanceNoticeDays);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReminderRulesCompanion toCompanion(bool nullToAbsent) {
    return ReminderRulesCompanion(
      id: Value(id),
      serviceTypeId: Value(serviceTypeId),
      intervalKm: intervalKm == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalKm),
      intervalMonths: intervalMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalMonths),
      advanceNoticeKm: Value(advanceNoticeKm),
      advanceNoticeDays: Value(advanceNoticeDays),
      isEnabled: Value(isEnabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReminderRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRule(
      id: serializer.fromJson<int>(json['id']),
      serviceTypeId: serializer.fromJson<int>(json['serviceTypeId']),
      intervalKm: serializer.fromJson<int?>(json['intervalKm']),
      intervalMonths: serializer.fromJson<int?>(json['intervalMonths']),
      advanceNoticeKm: serializer.fromJson<int>(json['advanceNoticeKm']),
      advanceNoticeDays: serializer.fromJson<int>(json['advanceNoticeDays']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceTypeId': serializer.toJson<int>(serviceTypeId),
      'intervalKm': serializer.toJson<int?>(intervalKm),
      'intervalMonths': serializer.toJson<int?>(intervalMonths),
      'advanceNoticeKm': serializer.toJson<int>(advanceNoticeKm),
      'advanceNoticeDays': serializer.toJson<int>(advanceNoticeDays),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReminderRule copyWith({
    int? id,
    int? serviceTypeId,
    Value<int?> intervalKm = const Value.absent(),
    Value<int?> intervalMonths = const Value.absent(),
    int? advanceNoticeKm,
    int? advanceNoticeDays,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ReminderRule(
    id: id ?? this.id,
    serviceTypeId: serviceTypeId ?? this.serviceTypeId,
    intervalKm: intervalKm.present ? intervalKm.value : this.intervalKm,
    intervalMonths: intervalMonths.present
        ? intervalMonths.value
        : this.intervalMonths,
    advanceNoticeKm: advanceNoticeKm ?? this.advanceNoticeKm,
    advanceNoticeDays: advanceNoticeDays ?? this.advanceNoticeDays,
    isEnabled: isEnabled ?? this.isEnabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReminderRule copyWithCompanion(ReminderRulesCompanion data) {
    return ReminderRule(
      id: data.id.present ? data.id.value : this.id,
      serviceTypeId: data.serviceTypeId.present
          ? data.serviceTypeId.value
          : this.serviceTypeId,
      intervalKm: data.intervalKm.present
          ? data.intervalKm.value
          : this.intervalKm,
      intervalMonths: data.intervalMonths.present
          ? data.intervalMonths.value
          : this.intervalMonths,
      advanceNoticeKm: data.advanceNoticeKm.present
          ? data.advanceNoticeKm.value
          : this.advanceNoticeKm,
      advanceNoticeDays: data.advanceNoticeDays.present
          ? data.advanceNoticeDays.value
          : this.advanceNoticeDays,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRule(')
          ..write('id: $id, ')
          ..write('serviceTypeId: $serviceTypeId, ')
          ..write('intervalKm: $intervalKm, ')
          ..write('intervalMonths: $intervalMonths, ')
          ..write('advanceNoticeKm: $advanceNoticeKm, ')
          ..write('advanceNoticeDays: $advanceNoticeDays, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    serviceTypeId,
    intervalKm,
    intervalMonths,
    advanceNoticeKm,
    advanceNoticeDays,
    isEnabled,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRule &&
          other.id == this.id &&
          other.serviceTypeId == this.serviceTypeId &&
          other.intervalKm == this.intervalKm &&
          other.intervalMonths == this.intervalMonths &&
          other.advanceNoticeKm == this.advanceNoticeKm &&
          other.advanceNoticeDays == this.advanceNoticeDays &&
          other.isEnabled == this.isEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReminderRulesCompanion extends UpdateCompanion<ReminderRule> {
  final Value<int> id;
  final Value<int> serviceTypeId;
  final Value<int?> intervalKm;
  final Value<int?> intervalMonths;
  final Value<int> advanceNoticeKm;
  final Value<int> advanceNoticeDays;
  final Value<bool> isEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ReminderRulesCompanion({
    this.id = const Value.absent(),
    this.serviceTypeId = const Value.absent(),
    this.intervalKm = const Value.absent(),
    this.intervalMonths = const Value.absent(),
    this.advanceNoticeKm = const Value.absent(),
    this.advanceNoticeDays = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReminderRulesCompanion.insert({
    this.id = const Value.absent(),
    required int serviceTypeId,
    this.intervalKm = const Value.absent(),
    this.intervalMonths = const Value.absent(),
    this.advanceNoticeKm = const Value.absent(),
    this.advanceNoticeDays = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : serviceTypeId = Value(serviceTypeId);
  static Insertable<ReminderRule> custom({
    Expression<int>? id,
    Expression<int>? serviceTypeId,
    Expression<int>? intervalKm,
    Expression<int>? intervalMonths,
    Expression<int>? advanceNoticeKm,
    Expression<int>? advanceNoticeDays,
    Expression<bool>? isEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceTypeId != null) 'service_type_id': serviceTypeId,
      if (intervalKm != null) 'interval_km': intervalKm,
      if (intervalMonths != null) 'interval_months': intervalMonths,
      if (advanceNoticeKm != null) 'advance_notice_km': advanceNoticeKm,
      if (advanceNoticeDays != null) 'advance_notice_days': advanceNoticeDays,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReminderRulesCompanion copyWith({
    Value<int>? id,
    Value<int>? serviceTypeId,
    Value<int?>? intervalKm,
    Value<int?>? intervalMonths,
    Value<int>? advanceNoticeKm,
    Value<int>? advanceNoticeDays,
    Value<bool>? isEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ReminderRulesCompanion(
      id: id ?? this.id,
      serviceTypeId: serviceTypeId ?? this.serviceTypeId,
      intervalKm: intervalKm ?? this.intervalKm,
      intervalMonths: intervalMonths ?? this.intervalMonths,
      advanceNoticeKm: advanceNoticeKm ?? this.advanceNoticeKm,
      advanceNoticeDays: advanceNoticeDays ?? this.advanceNoticeDays,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceTypeId.present) {
      map['service_type_id'] = Variable<int>(serviceTypeId.value);
    }
    if (intervalKm.present) {
      map['interval_km'] = Variable<int>(intervalKm.value);
    }
    if (intervalMonths.present) {
      map['interval_months'] = Variable<int>(intervalMonths.value);
    }
    if (advanceNoticeKm.present) {
      map['advance_notice_km'] = Variable<int>(advanceNoticeKm.value);
    }
    if (advanceNoticeDays.present) {
      map['advance_notice_days'] = Variable<int>(advanceNoticeDays.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRulesCompanion(')
          ..write('id: $id, ')
          ..write('serviceTypeId: $serviceTypeId, ')
          ..write('intervalKm: $intervalKm, ')
          ..write('intervalMonths: $intervalMonths, ')
          ..write('advanceNoticeKm: $advanceNoticeKm, ')
          ..write('advanceNoticeDays: $advanceNoticeDays, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceRecordsTable extends MaintenanceRecords
    with TableInfo<$MaintenanceRecordsTable, MaintenanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _serviceTypeIdMeta = const VerificationMeta(
    'serviceTypeId',
  );
  @override
  late final GeneratedColumn<int> serviceTypeId = GeneratedColumn<int>(
    'service_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES service_types (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _odometerKmMeta = const VerificationMeta(
    'odometerKm',
  );
  @override
  late final GeneratedColumn<int> odometerKm = GeneratedColumn<int>(
    'odometer_km',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceDateMeta = const VerificationMeta(
    'serviceDate',
  );
  @override
  late final GeneratedColumn<DateTime> serviceDate = GeneratedColumn<DateTime>(
    'service_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    serviceTypeId,
    odometerKm,
    serviceDate,
    location,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaintenanceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('service_type_id')) {
      context.handle(
        _serviceTypeIdMeta,
        serviceTypeId.isAcceptableOrUnknown(
          data['service_type_id']!,
          _serviceTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceTypeIdMeta);
    }
    if (data.containsKey('odometer_km')) {
      context.handle(
        _odometerKmMeta,
        odometerKm.isAcceptableOrUnknown(data['odometer_km']!, _odometerKmMeta),
      );
    } else if (isInserting) {
      context.missing(_odometerKmMeta);
    }
    if (data.containsKey('service_date')) {
      context.handle(
        _serviceDateMeta,
        serviceDate.isAcceptableOrUnknown(
          data['service_date']!,
          _serviceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceDateMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaintenanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      serviceTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}service_type_id'],
      )!,
      odometerKm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}odometer_km'],
      )!,
      serviceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}service_date'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MaintenanceRecordsTable createAlias(String alias) {
    return $MaintenanceRecordsTable(attachedDatabase, alias);
  }
}

class MaintenanceRecord extends DataClass
    implements Insertable<MaintenanceRecord> {
  final int id;
  final int vehicleId;
  final int serviceTypeId;
  final int odometerKm;
  final DateTime serviceDate;
  final String? location;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MaintenanceRecord({
    required this.id,
    required this.vehicleId,
    required this.serviceTypeId,
    required this.odometerKm,
    required this.serviceDate,
    this.location,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['service_type_id'] = Variable<int>(serviceTypeId);
    map['odometer_km'] = Variable<int>(odometerKm);
    map['service_date'] = Variable<DateTime>(serviceDate);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MaintenanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceRecordsCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      serviceTypeId: Value(serviceTypeId),
      odometerKm: Value(odometerKm),
      serviceDate: Value(serviceDate),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MaintenanceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceRecord(
      id: serializer.fromJson<int>(json['id']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      serviceTypeId: serializer.fromJson<int>(json['serviceTypeId']),
      odometerKm: serializer.fromJson<int>(json['odometerKm']),
      serviceDate: serializer.fromJson<DateTime>(json['serviceDate']),
      location: serializer.fromJson<String?>(json['location']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'serviceTypeId': serializer.toJson<int>(serviceTypeId),
      'odometerKm': serializer.toJson<int>(odometerKm),
      'serviceDate': serializer.toJson<DateTime>(serviceDate),
      'location': serializer.toJson<String?>(location),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MaintenanceRecord copyWith({
    int? id,
    int? vehicleId,
    int? serviceTypeId,
    int? odometerKm,
    DateTime? serviceDate,
    Value<String?> location = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MaintenanceRecord(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    serviceTypeId: serviceTypeId ?? this.serviceTypeId,
    odometerKm: odometerKm ?? this.odometerKm,
    serviceDate: serviceDate ?? this.serviceDate,
    location: location.present ? location.value : this.location,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MaintenanceRecord copyWithCompanion(MaintenanceRecordsCompanion data) {
    return MaintenanceRecord(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      serviceTypeId: data.serviceTypeId.present
          ? data.serviceTypeId.value
          : this.serviceTypeId,
      odometerKm: data.odometerKm.present
          ? data.odometerKm.value
          : this.odometerKm,
      serviceDate: data.serviceDate.present
          ? data.serviceDate.value
          : this.serviceDate,
      location: data.location.present ? data.location.value : this.location,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecord(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('serviceTypeId: $serviceTypeId, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('serviceDate: $serviceDate, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleId,
    serviceTypeId,
    odometerKm,
    serviceDate,
    location,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceRecord &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.serviceTypeId == this.serviceTypeId &&
          other.odometerKm == this.odometerKm &&
          other.serviceDate == this.serviceDate &&
          other.location == this.location &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MaintenanceRecordsCompanion extends UpdateCompanion<MaintenanceRecord> {
  final Value<int> id;
  final Value<int> vehicleId;
  final Value<int> serviceTypeId;
  final Value<int> odometerKm;
  final Value<DateTime> serviceDate;
  final Value<String?> location;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MaintenanceRecordsCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.serviceTypeId = const Value.absent(),
    this.odometerKm = const Value.absent(),
    this.serviceDate = const Value.absent(),
    this.location = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MaintenanceRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int vehicleId,
    required int serviceTypeId,
    required int odometerKm,
    required DateTime serviceDate,
    this.location = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       serviceTypeId = Value(serviceTypeId),
       odometerKm = Value(odometerKm),
       serviceDate = Value(serviceDate);
  static Insertable<MaintenanceRecord> custom({
    Expression<int>? id,
    Expression<int>? vehicleId,
    Expression<int>? serviceTypeId,
    Expression<int>? odometerKm,
    Expression<DateTime>? serviceDate,
    Expression<String>? location,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (serviceTypeId != null) 'service_type_id': serviceTypeId,
      if (odometerKm != null) 'odometer_km': odometerKm,
      if (serviceDate != null) 'service_date': serviceDate,
      if (location != null) 'location': location,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MaintenanceRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? vehicleId,
    Value<int>? serviceTypeId,
    Value<int>? odometerKm,
    Value<DateTime>? serviceDate,
    Value<String?>? location,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return MaintenanceRecordsCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      serviceTypeId: serviceTypeId ?? this.serviceTypeId,
      odometerKm: odometerKm ?? this.odometerKm,
      serviceDate: serviceDate ?? this.serviceDate,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (serviceTypeId.present) {
      map['service_type_id'] = Variable<int>(serviceTypeId.value);
    }
    if (odometerKm.present) {
      map['odometer_km'] = Variable<int>(odometerKm.value);
    }
    if (serviceDate.present) {
      map['service_date'] = Variable<DateTime>(serviceDate.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('serviceTypeId: $serviceTypeId, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('serviceDate: $serviceDate, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VehicleTypesTable vehicleTypes = $VehicleTypesTable(this);
  late final $VehicleBrandsTable vehicleBrands = $VehicleBrandsTable(this);
  late final $VehicleModelsTable vehicleModels = $VehicleModelsTable(this);
  late final $VehicleProfilesTable vehicleProfiles = $VehicleProfilesTable(
    this,
  );
  late final $ServiceTypesTable serviceTypes = $ServiceTypesTable(this);
  late final $ReminderRulesTable reminderRules = $ReminderRulesTable(this);
  late final $MaintenanceRecordsTable maintenanceRecords =
      $MaintenanceRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehicleTypes,
    vehicleBrands,
    vehicleModels,
    vehicleProfiles,
    serviceTypes,
    reminderRules,
    maintenanceRecords,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicle_types',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vehicle_brands', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicle_brands',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vehicle_models', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'service_types',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminder_rules', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicle_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('maintenance_records', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$VehicleTypesTableCreateCompanionBuilder =
    VehicleTypesCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VehicleTypesTableUpdateCompanionBuilder =
    VehicleTypesCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VehicleTypesTableReferences
    extends BaseReferences<_$AppDatabase, $VehicleTypesTable, VehicleType> {
  $$VehicleTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VehicleBrandsTable, List<VehicleBrand>>
  _vehicleBrandsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleBrands,
    aliasName: $_aliasNameGenerator(
      db.vehicleTypes.id,
      db.vehicleBrands.vehicleTypeId,
    ),
  );

  $$VehicleBrandsTableProcessedTableManager get vehicleBrandsRefs {
    final manager = $$VehicleBrandsTableTableManager(
      $_db,
      $_db.vehicleBrands,
    ).filter((f) => f.vehicleTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vehicleBrandsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VehicleProfilesTable, List<VehicleProfile>>
  _vehicleProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleProfiles,
    aliasName: $_aliasNameGenerator(
      db.vehicleTypes.id,
      db.vehicleProfiles.vehicleTypeId,
    ),
  );

  $$VehicleProfilesTableProcessedTableManager get vehicleProfilesRefs {
    final manager = $$VehicleProfilesTableTableManager(
      $_db,
      $_db.vehicleProfiles,
    ).filter((f) => f.vehicleTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vehicleProfilesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehicleTypesTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vehicleBrandsRefs(
    Expression<bool> Function($$VehicleBrandsTableFilterComposer f) f,
  ) {
    final $$VehicleBrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableFilterComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vehicleProfilesRefs(
    Expression<bool> Function($$VehicleProfilesTableFilterComposer f) f,
  ) {
    final $$VehicleProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> vehicleBrandsRefs<T extends Object>(
    Expression<T> Function($$VehicleBrandsTableAnnotationComposer a) f,
  ) {
    final $$VehicleBrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vehicleProfilesRefs<T extends Object>(
    Expression<T> Function($$VehicleProfilesTableAnnotationComposer a) f,
  ) {
    final $$VehicleProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleTypesTable,
          VehicleType,
          $$VehicleTypesTableFilterComposer,
          $$VehicleTypesTableOrderingComposer,
          $$VehicleTypesTableAnnotationComposer,
          $$VehicleTypesTableCreateCompanionBuilder,
          $$VehicleTypesTableUpdateCompanionBuilder,
          (VehicleType, $$VehicleTypesTableReferences),
          VehicleType,
          PrefetchHooks Function({
            bool vehicleBrandsRefs,
            bool vehicleProfilesRefs,
          })
        > {
  $$VehicleTypesTableTableManager(_$AppDatabase db, $VehicleTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleTypesCompanion(
                id: id,
                code: code,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleTypesCompanion.insert(
                id: id,
                code: code,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({vehicleBrandsRefs = false, vehicleProfilesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vehicleBrandsRefs) db.vehicleBrands,
                    if (vehicleProfilesRefs) db.vehicleProfiles,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vehicleBrandsRefs)
                        await $_getPrefetchedData<
                          VehicleType,
                          $VehicleTypesTable,
                          VehicleBrand
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleTypesTableReferences
                              ._vehicleBrandsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).vehicleBrandsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vehicleProfilesRefs)
                        await $_getPrefetchedData<
                          VehicleType,
                          $VehicleTypesTable,
                          VehicleProfile
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleTypesTableReferences
                              ._vehicleProfilesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).vehicleProfilesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehicleTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleTypesTable,
      VehicleType,
      $$VehicleTypesTableFilterComposer,
      $$VehicleTypesTableOrderingComposer,
      $$VehicleTypesTableAnnotationComposer,
      $$VehicleTypesTableCreateCompanionBuilder,
      $$VehicleTypesTableUpdateCompanionBuilder,
      (VehicleType, $$VehicleTypesTableReferences),
      VehicleType,
      PrefetchHooks Function({bool vehicleBrandsRefs, bool vehicleProfilesRefs})
    >;
typedef $$VehicleBrandsTableCreateCompanionBuilder =
    VehicleBrandsCompanion Function({
      Value<int> id,
      required int vehicleTypeId,
      required String name,
      Value<bool> isUserDefined,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VehicleBrandsTableUpdateCompanionBuilder =
    VehicleBrandsCompanion Function({
      Value<int> id,
      Value<int> vehicleTypeId,
      Value<String> name,
      Value<bool> isUserDefined,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VehicleBrandsTableReferences
    extends BaseReferences<_$AppDatabase, $VehicleBrandsTable, VehicleBrand> {
  $$VehicleBrandsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehicleTypesTable _vehicleTypeIdTable(_$AppDatabase db) =>
      db.vehicleTypes.createAlias(
        $_aliasNameGenerator(
          db.vehicleBrands.vehicleTypeId,
          db.vehicleTypes.id,
        ),
      );

  $$VehicleTypesTableProcessedTableManager get vehicleTypeId {
    final $_column = $_itemColumn<int>('vehicle_type_id')!;

    final manager = $$VehicleTypesTableTableManager(
      $_db,
      $_db.vehicleTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VehicleModelsTable, List<VehicleModel>>
  _vehicleModelsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleModels,
    aliasName: $_aliasNameGenerator(
      db.vehicleBrands.id,
      db.vehicleModels.vehicleBrandId,
    ),
  );

  $$VehicleModelsTableProcessedTableManager get vehicleModelsRefs {
    final manager = $$VehicleModelsTableTableManager(
      $_db,
      $_db.vehicleModels,
    ).filter((f) => f.vehicleBrandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vehicleModelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VehicleProfilesTable, List<VehicleProfile>>
  _vehicleProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleProfiles,
    aliasName: $_aliasNameGenerator(
      db.vehicleBrands.id,
      db.vehicleProfiles.vehicleBrandId,
    ),
  );

  $$VehicleProfilesTableProcessedTableManager get vehicleProfilesRefs {
    final manager = $$VehicleProfilesTableTableManager(
      $_db,
      $_db.vehicleProfiles,
    ).filter((f) => f.vehicleBrandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vehicleProfilesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehicleBrandsTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleBrandsTable> {
  $$VehicleBrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehicleTypesTableFilterComposer get vehicleTypeId {
    final $$VehicleTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> vehicleModelsRefs(
    Expression<bool> Function($$VehicleModelsTableFilterComposer f) f,
  ) {
    final $$VehicleModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleModels,
      getReferencedColumn: (t) => t.vehicleBrandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleModelsTableFilterComposer(
            $db: $db,
            $table: $db.vehicleModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vehicleProfilesRefs(
    Expression<bool> Function($$VehicleProfilesTableFilterComposer f) f,
  ) {
    final $$VehicleProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleBrandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleBrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleBrandsTable> {
  $$VehicleBrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehicleTypesTableOrderingComposer get vehicleTypeId {
    final $$VehicleTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleBrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleBrandsTable> {
  $$VehicleBrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehicleTypesTableAnnotationComposer get vehicleTypeId {
    final $$VehicleTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> vehicleModelsRefs<T extends Object>(
    Expression<T> Function($$VehicleModelsTableAnnotationComposer a) f,
  ) {
    final $$VehicleModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleModels,
      getReferencedColumn: (t) => t.vehicleBrandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vehicleProfilesRefs<T extends Object>(
    Expression<T> Function($$VehicleProfilesTableAnnotationComposer a) f,
  ) {
    final $$VehicleProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleBrandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleBrandsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleBrandsTable,
          VehicleBrand,
          $$VehicleBrandsTableFilterComposer,
          $$VehicleBrandsTableOrderingComposer,
          $$VehicleBrandsTableAnnotationComposer,
          $$VehicleBrandsTableCreateCompanionBuilder,
          $$VehicleBrandsTableUpdateCompanionBuilder,
          (VehicleBrand, $$VehicleBrandsTableReferences),
          VehicleBrand,
          PrefetchHooks Function({
            bool vehicleTypeId,
            bool vehicleModelsRefs,
            bool vehicleProfilesRefs,
          })
        > {
  $$VehicleBrandsTableTableManager(_$AppDatabase db, $VehicleBrandsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleBrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleBrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleBrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleTypeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isUserDefined = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleBrandsCompanion(
                id: id,
                vehicleTypeId: vehicleTypeId,
                name: name,
                isUserDefined: isUserDefined,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vehicleTypeId,
                required String name,
                Value<bool> isUserDefined = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleBrandsCompanion.insert(
                id: id,
                vehicleTypeId: vehicleTypeId,
                name: name,
                isUserDefined: isUserDefined,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleBrandsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                vehicleTypeId = false,
                vehicleModelsRefs = false,
                vehicleProfilesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vehicleModelsRefs) db.vehicleModels,
                    if (vehicleProfilesRefs) db.vehicleProfiles,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicleTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleTypeId,
                                    referencedTable:
                                        $$VehicleBrandsTableReferences
                                            ._vehicleTypeIdTable(db),
                                    referencedColumn:
                                        $$VehicleBrandsTableReferences
                                            ._vehicleTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vehicleModelsRefs)
                        await $_getPrefetchedData<
                          VehicleBrand,
                          $VehicleBrandsTable,
                          VehicleModel
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleBrandsTableReferences
                              ._vehicleModelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleBrandsTableReferences(
                                db,
                                table,
                                p0,
                              ).vehicleModelsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleBrandId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vehicleProfilesRefs)
                        await $_getPrefetchedData<
                          VehicleBrand,
                          $VehicleBrandsTable,
                          VehicleProfile
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleBrandsTableReferences
                              ._vehicleProfilesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleBrandsTableReferences(
                                db,
                                table,
                                p0,
                              ).vehicleProfilesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleBrandId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehicleBrandsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleBrandsTable,
      VehicleBrand,
      $$VehicleBrandsTableFilterComposer,
      $$VehicleBrandsTableOrderingComposer,
      $$VehicleBrandsTableAnnotationComposer,
      $$VehicleBrandsTableCreateCompanionBuilder,
      $$VehicleBrandsTableUpdateCompanionBuilder,
      (VehicleBrand, $$VehicleBrandsTableReferences),
      VehicleBrand,
      PrefetchHooks Function({
        bool vehicleTypeId,
        bool vehicleModelsRefs,
        bool vehicleProfilesRefs,
      })
    >;
typedef $$VehicleModelsTableCreateCompanionBuilder =
    VehicleModelsCompanion Function({
      Value<int> id,
      required int vehicleBrandId,
      required String name,
      Value<bool> isUserDefined,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VehicleModelsTableUpdateCompanionBuilder =
    VehicleModelsCompanion Function({
      Value<int> id,
      Value<int> vehicleBrandId,
      Value<String> name,
      Value<bool> isUserDefined,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VehicleModelsTableReferences
    extends BaseReferences<_$AppDatabase, $VehicleModelsTable, VehicleModel> {
  $$VehicleModelsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehicleBrandsTable _vehicleBrandIdTable(_$AppDatabase db) =>
      db.vehicleBrands.createAlias(
        $_aliasNameGenerator(
          db.vehicleModels.vehicleBrandId,
          db.vehicleBrands.id,
        ),
      );

  $$VehicleBrandsTableProcessedTableManager get vehicleBrandId {
    final $_column = $_itemColumn<int>('vehicle_brand_id')!;

    final manager = $$VehicleBrandsTableTableManager(
      $_db,
      $_db.vehicleBrands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleBrandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VehicleProfilesTable, List<VehicleProfile>>
  _vehicleProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleProfiles,
    aliasName: $_aliasNameGenerator(
      db.vehicleModels.id,
      db.vehicleProfiles.vehicleModelId,
    ),
  );

  $$VehicleProfilesTableProcessedTableManager get vehicleProfilesRefs {
    final manager = $$VehicleProfilesTableTableManager(
      $_db,
      $_db.vehicleProfiles,
    ).filter((f) => f.vehicleModelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vehicleProfilesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehicleModelsTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleModelsTable> {
  $$VehicleModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehicleBrandsTableFilterComposer get vehicleBrandId {
    final $$VehicleBrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableFilterComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> vehicleProfilesRefs(
    Expression<bool> Function($$VehicleProfilesTableFilterComposer f) f,
  ) {
    final $$VehicleProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleModelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleModelsTable> {
  $$VehicleModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehicleBrandsTableOrderingComposer get vehicleBrandId {
    final $$VehicleBrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleModelsTable> {
  $$VehicleModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isUserDefined => $composableBuilder(
    column: $table.isUserDefined,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehicleBrandsTableAnnotationComposer get vehicleBrandId {
    final $$VehicleBrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> vehicleProfilesRefs<T extends Object>(
    Expression<T> Function($$VehicleProfilesTableAnnotationComposer a) f,
  ) {
    final $$VehicleProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.vehicleModelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleModelsTable,
          VehicleModel,
          $$VehicleModelsTableFilterComposer,
          $$VehicleModelsTableOrderingComposer,
          $$VehicleModelsTableAnnotationComposer,
          $$VehicleModelsTableCreateCompanionBuilder,
          $$VehicleModelsTableUpdateCompanionBuilder,
          (VehicleModel, $$VehicleModelsTableReferences),
          VehicleModel,
          PrefetchHooks Function({
            bool vehicleBrandId,
            bool vehicleProfilesRefs,
          })
        > {
  $$VehicleModelsTableTableManager(_$AppDatabase db, $VehicleModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleBrandId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isUserDefined = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleModelsCompanion(
                id: id,
                vehicleBrandId: vehicleBrandId,
                name: name,
                isUserDefined: isUserDefined,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vehicleBrandId,
                required String name,
                Value<bool> isUserDefined = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleModelsCompanion.insert(
                id: id,
                vehicleBrandId: vehicleBrandId,
                name: name,
                isUserDefined: isUserDefined,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleModelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({vehicleBrandId = false, vehicleProfilesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vehicleProfilesRefs) db.vehicleProfiles,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicleBrandId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleBrandId,
                                    referencedTable:
                                        $$VehicleModelsTableReferences
                                            ._vehicleBrandIdTable(db),
                                    referencedColumn:
                                        $$VehicleModelsTableReferences
                                            ._vehicleBrandIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vehicleProfilesRefs)
                        await $_getPrefetchedData<
                          VehicleModel,
                          $VehicleModelsTable,
                          VehicleProfile
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleModelsTableReferences
                              ._vehicleProfilesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleModelsTableReferences(
                                db,
                                table,
                                p0,
                              ).vehicleProfilesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleModelId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehicleModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleModelsTable,
      VehicleModel,
      $$VehicleModelsTableFilterComposer,
      $$VehicleModelsTableOrderingComposer,
      $$VehicleModelsTableAnnotationComposer,
      $$VehicleModelsTableCreateCompanionBuilder,
      $$VehicleModelsTableUpdateCompanionBuilder,
      (VehicleModel, $$VehicleModelsTableReferences),
      VehicleModel,
      PrefetchHooks Function({bool vehicleBrandId, bool vehicleProfilesRefs})
    >;
typedef $$VehicleProfilesTableCreateCompanionBuilder =
    VehicleProfilesCompanion Function({
      Value<int> id,
      required int vehicleTypeId,
      required int vehicleBrandId,
      required int vehicleModelId,
      Value<String?> engineDetails,
      Value<String?> drivetrain,
      Value<int?> year,
      Value<String?> nickname,
      Value<String?> vin,
      Value<int> currentOdometerKm,
      Value<String> odometerUnit,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VehicleProfilesTableUpdateCompanionBuilder =
    VehicleProfilesCompanion Function({
      Value<int> id,
      Value<int> vehicleTypeId,
      Value<int> vehicleBrandId,
      Value<int> vehicleModelId,
      Value<String?> engineDetails,
      Value<String?> drivetrain,
      Value<int?> year,
      Value<String?> nickname,
      Value<String?> vin,
      Value<int> currentOdometerKm,
      Value<String> odometerUnit,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VehicleProfilesTableReferences
    extends
        BaseReferences<_$AppDatabase, $VehicleProfilesTable, VehicleProfile> {
  $$VehicleProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehicleTypesTable _vehicleTypeIdTable(_$AppDatabase db) =>
      db.vehicleTypes.createAlias(
        $_aliasNameGenerator(
          db.vehicleProfiles.vehicleTypeId,
          db.vehicleTypes.id,
        ),
      );

  $$VehicleTypesTableProcessedTableManager get vehicleTypeId {
    final $_column = $_itemColumn<int>('vehicle_type_id')!;

    final manager = $$VehicleTypesTableTableManager(
      $_db,
      $_db.vehicleTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VehicleBrandsTable _vehicleBrandIdTable(_$AppDatabase db) =>
      db.vehicleBrands.createAlias(
        $_aliasNameGenerator(
          db.vehicleProfiles.vehicleBrandId,
          db.vehicleBrands.id,
        ),
      );

  $$VehicleBrandsTableProcessedTableManager get vehicleBrandId {
    final $_column = $_itemColumn<int>('vehicle_brand_id')!;

    final manager = $$VehicleBrandsTableTableManager(
      $_db,
      $_db.vehicleBrands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleBrandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VehicleModelsTable _vehicleModelIdTable(_$AppDatabase db) =>
      db.vehicleModels.createAlias(
        $_aliasNameGenerator(
          db.vehicleProfiles.vehicleModelId,
          db.vehicleModels.id,
        ),
      );

  $$VehicleModelsTableProcessedTableManager get vehicleModelId {
    final $_column = $_itemColumn<int>('vehicle_model_id')!;

    final manager = $$VehicleModelsTableTableManager(
      $_db,
      $_db.vehicleModels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleModelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MaintenanceRecordsTable, List<MaintenanceRecord>>
  _maintenanceRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.maintenanceRecords,
        aliasName: $_aliasNameGenerator(
          db.vehicleProfiles.id,
          db.maintenanceRecords.vehicleId,
        ),
      );

  $$MaintenanceRecordsTableProcessedTableManager get maintenanceRecordsRefs {
    final manager = $$MaintenanceRecordsTableTableManager(
      $_db,
      $_db.maintenanceRecords,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _maintenanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehicleProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleProfilesTable> {
  $$VehicleProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engineDetails => $composableBuilder(
    column: $table.engineDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drivetrain => $composableBuilder(
    column: $table.drivetrain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vin => $composableBuilder(
    column: $table.vin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentOdometerKm => $composableBuilder(
    column: $table.currentOdometerKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get odometerUnit => $composableBuilder(
    column: $table.odometerUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehicleTypesTableFilterComposer get vehicleTypeId {
    final $$VehicleTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleBrandsTableFilterComposer get vehicleBrandId {
    final $$VehicleBrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableFilterComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleModelsTableFilterComposer get vehicleModelId {
    final $$VehicleModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleModelId,
      referencedTable: $db.vehicleModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleModelsTableFilterComposer(
            $db: $db,
            $table: $db.vehicleModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> maintenanceRecordsRefs(
    Expression<bool> Function($$MaintenanceRecordsTableFilterComposer f) f,
  ) {
    final $$MaintenanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.maintenanceRecords,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaintenanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.maintenanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleProfilesTable> {
  $$VehicleProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engineDetails => $composableBuilder(
    column: $table.engineDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drivetrain => $composableBuilder(
    column: $table.drivetrain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vin => $composableBuilder(
    column: $table.vin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentOdometerKm => $composableBuilder(
    column: $table.currentOdometerKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get odometerUnit => $composableBuilder(
    column: $table.odometerUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehicleTypesTableOrderingComposer get vehicleTypeId {
    final $$VehicleTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleBrandsTableOrderingComposer get vehicleBrandId {
    final $$VehicleBrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleModelsTableOrderingComposer get vehicleModelId {
    final $$VehicleModelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleModelId,
      referencedTable: $db.vehicleModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleModelsTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleProfilesTable> {
  $$VehicleProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get engineDetails => $composableBuilder(
    column: $table.engineDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get drivetrain => $composableBuilder(
    column: $table.drivetrain,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get vin =>
      $composableBuilder(column: $table.vin, builder: (column) => column);

  GeneratedColumn<int> get currentOdometerKm => $composableBuilder(
    column: $table.currentOdometerKm,
    builder: (column) => column,
  );

  GeneratedColumn<String> get odometerUnit => $composableBuilder(
    column: $table.odometerUnit,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehicleTypesTableAnnotationComposer get vehicleTypeId {
    final $$VehicleTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleBrandsTableAnnotationComposer get vehicleBrandId {
    final $$VehicleBrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleBrandId,
      referencedTable: $db.vehicleBrands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleBrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleBrands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleModelsTableAnnotationComposer get vehicleModelId {
    final $$VehicleModelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleModelId,
      referencedTable: $db.vehicleModels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleModelsTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> maintenanceRecordsRefs<T extends Object>(
    Expression<T> Function($$MaintenanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$MaintenanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.maintenanceRecords,
          getReferencedColumn: (t) => t.vehicleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaintenanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.maintenanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$VehicleProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleProfilesTable,
          VehicleProfile,
          $$VehicleProfilesTableFilterComposer,
          $$VehicleProfilesTableOrderingComposer,
          $$VehicleProfilesTableAnnotationComposer,
          $$VehicleProfilesTableCreateCompanionBuilder,
          $$VehicleProfilesTableUpdateCompanionBuilder,
          (VehicleProfile, $$VehicleProfilesTableReferences),
          VehicleProfile,
          PrefetchHooks Function({
            bool vehicleTypeId,
            bool vehicleBrandId,
            bool vehicleModelId,
            bool maintenanceRecordsRefs,
          })
        > {
  $$VehicleProfilesTableTableManager(
    _$AppDatabase db,
    $VehicleProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleTypeId = const Value.absent(),
                Value<int> vehicleBrandId = const Value.absent(),
                Value<int> vehicleModelId = const Value.absent(),
                Value<String?> engineDetails = const Value.absent(),
                Value<String?> drivetrain = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> vin = const Value.absent(),
                Value<int> currentOdometerKm = const Value.absent(),
                Value<String> odometerUnit = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleProfilesCompanion(
                id: id,
                vehicleTypeId: vehicleTypeId,
                vehicleBrandId: vehicleBrandId,
                vehicleModelId: vehicleModelId,
                engineDetails: engineDetails,
                drivetrain: drivetrain,
                year: year,
                nickname: nickname,
                vin: vin,
                currentOdometerKm: currentOdometerKm,
                odometerUnit: odometerUnit,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vehicleTypeId,
                required int vehicleBrandId,
                required int vehicleModelId,
                Value<String?> engineDetails = const Value.absent(),
                Value<String?> drivetrain = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> vin = const Value.absent(),
                Value<int> currentOdometerKm = const Value.absent(),
                Value<String> odometerUnit = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VehicleProfilesCompanion.insert(
                id: id,
                vehicleTypeId: vehicleTypeId,
                vehicleBrandId: vehicleBrandId,
                vehicleModelId: vehicleModelId,
                engineDetails: engineDetails,
                drivetrain: drivetrain,
                year: year,
                nickname: nickname,
                vin: vin,
                currentOdometerKm: currentOdometerKm,
                odometerUnit: odometerUnit,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                vehicleTypeId = false,
                vehicleBrandId = false,
                vehicleModelId = false,
                maintenanceRecordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (maintenanceRecordsRefs) db.maintenanceRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicleTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleTypeId,
                                    referencedTable:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleTypeIdTable(db),
                                    referencedColumn:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (vehicleBrandId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleBrandId,
                                    referencedTable:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleBrandIdTable(db),
                                    referencedColumn:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleBrandIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (vehicleModelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleModelId,
                                    referencedTable:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleModelIdTable(db),
                                    referencedColumn:
                                        $$VehicleProfilesTableReferences
                                            ._vehicleModelIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (maintenanceRecordsRefs)
                        await $_getPrefetchedData<
                          VehicleProfile,
                          $VehicleProfilesTable,
                          MaintenanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$VehicleProfilesTableReferences
                              ._maintenanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehicleProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).maintenanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehicleProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleProfilesTable,
      VehicleProfile,
      $$VehicleProfilesTableFilterComposer,
      $$VehicleProfilesTableOrderingComposer,
      $$VehicleProfilesTableAnnotationComposer,
      $$VehicleProfilesTableCreateCompanionBuilder,
      $$VehicleProfilesTableUpdateCompanionBuilder,
      (VehicleProfile, $$VehicleProfilesTableReferences),
      VehicleProfile,
      PrefetchHooks Function({
        bool vehicleTypeId,
        bool vehicleBrandId,
        bool vehicleModelId,
        bool maintenanceRecordsRefs,
      })
    >;
typedef $$ServiceTypesTableCreateCompanionBuilder =
    ServiceTypesCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      Value<String?> description,
      Value<int?> defaultIntervalKm,
      Value<int?> defaultIntervalMonths,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ServiceTypesTableUpdateCompanionBuilder =
    ServiceTypesCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<int?> defaultIntervalKm,
      Value<int?> defaultIntervalMonths,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ServiceTypesTableReferences
    extends BaseReferences<_$AppDatabase, $ServiceTypesTable, ServiceType> {
  $$ServiceTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReminderRulesTable, List<ReminderRule>>
  _reminderRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminderRules,
    aliasName: $_aliasNameGenerator(
      db.serviceTypes.id,
      db.reminderRules.serviceTypeId,
    ),
  );

  $$ReminderRulesTableProcessedTableManager get reminderRulesRefs {
    final manager = $$ReminderRulesTableTableManager(
      $_db,
      $_db.reminderRules,
    ).filter((f) => f.serviceTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reminderRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MaintenanceRecordsTable, List<MaintenanceRecord>>
  _maintenanceRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.maintenanceRecords,
        aliasName: $_aliasNameGenerator(
          db.serviceTypes.id,
          db.maintenanceRecords.serviceTypeId,
        ),
      );

  $$MaintenanceRecordsTableProcessedTableManager get maintenanceRecordsRefs {
    final manager = $$MaintenanceRecordsTableTableManager(
      $_db,
      $_db.maintenanceRecords,
    ).filter((f) => f.serviceTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _maintenanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServiceTypesTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceTypesTable> {
  $$ServiceTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultIntervalKm => $composableBuilder(
    column: $table.defaultIntervalKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultIntervalMonths => $composableBuilder(
    column: $table.defaultIntervalMonths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reminderRulesRefs(
    Expression<bool> Function($$ReminderRulesTableFilterComposer f) f,
  ) {
    final $$ReminderRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminderRules,
      getReferencedColumn: (t) => t.serviceTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderRulesTableFilterComposer(
            $db: $db,
            $table: $db.reminderRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> maintenanceRecordsRefs(
    Expression<bool> Function($$MaintenanceRecordsTableFilterComposer f) f,
  ) {
    final $$MaintenanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.maintenanceRecords,
      getReferencedColumn: (t) => t.serviceTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaintenanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.maintenanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServiceTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceTypesTable> {
  $$ServiceTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultIntervalKm => $composableBuilder(
    column: $table.defaultIntervalKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultIntervalMonths => $composableBuilder(
    column: $table.defaultIntervalMonths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServiceTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceTypesTable> {
  $$ServiceTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultIntervalKm => $composableBuilder(
    column: $table.defaultIntervalKm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultIntervalMonths => $composableBuilder(
    column: $table.defaultIntervalMonths,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> reminderRulesRefs<T extends Object>(
    Expression<T> Function($$ReminderRulesTableAnnotationComposer a) f,
  ) {
    final $$ReminderRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminderRules,
      getReferencedColumn: (t) => t.serviceTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.reminderRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> maintenanceRecordsRefs<T extends Object>(
    Expression<T> Function($$MaintenanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$MaintenanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.maintenanceRecords,
          getReferencedColumn: (t) => t.serviceTypeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaintenanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.maintenanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ServiceTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceTypesTable,
          ServiceType,
          $$ServiceTypesTableFilterComposer,
          $$ServiceTypesTableOrderingComposer,
          $$ServiceTypesTableAnnotationComposer,
          $$ServiceTypesTableCreateCompanionBuilder,
          $$ServiceTypesTableUpdateCompanionBuilder,
          (ServiceType, $$ServiceTypesTableReferences),
          ServiceType,
          PrefetchHooks Function({
            bool reminderRulesRefs,
            bool maintenanceRecordsRefs,
          })
        > {
  $$ServiceTypesTableTableManager(_$AppDatabase db, $ServiceTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> defaultIntervalKm = const Value.absent(),
                Value<int?> defaultIntervalMonths = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ServiceTypesCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                defaultIntervalKm: defaultIntervalKm,
                defaultIntervalMonths: defaultIntervalMonths,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int?> defaultIntervalKm = const Value.absent(),
                Value<int?> defaultIntervalMonths = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ServiceTypesCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                defaultIntervalKm: defaultIntervalKm,
                defaultIntervalMonths: defaultIntervalMonths,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({reminderRulesRefs = false, maintenanceRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reminderRulesRefs) db.reminderRules,
                    if (maintenanceRecordsRefs) db.maintenanceRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reminderRulesRefs)
                        await $_getPrefetchedData<
                          ServiceType,
                          $ServiceTypesTable,
                          ReminderRule
                        >(
                          currentTable: table,
                          referencedTable: $$ServiceTypesTableReferences
                              ._reminderRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ServiceTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).reminderRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.serviceTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (maintenanceRecordsRefs)
                        await $_getPrefetchedData<
                          ServiceType,
                          $ServiceTypesTable,
                          MaintenanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$ServiceTypesTableReferences
                              ._maintenanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ServiceTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).maintenanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.serviceTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ServiceTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceTypesTable,
      ServiceType,
      $$ServiceTypesTableFilterComposer,
      $$ServiceTypesTableOrderingComposer,
      $$ServiceTypesTableAnnotationComposer,
      $$ServiceTypesTableCreateCompanionBuilder,
      $$ServiceTypesTableUpdateCompanionBuilder,
      (ServiceType, $$ServiceTypesTableReferences),
      ServiceType,
      PrefetchHooks Function({
        bool reminderRulesRefs,
        bool maintenanceRecordsRefs,
      })
    >;
typedef $$ReminderRulesTableCreateCompanionBuilder =
    ReminderRulesCompanion Function({
      Value<int> id,
      required int serviceTypeId,
      Value<int?> intervalKm,
      Value<int?> intervalMonths,
      Value<int> advanceNoticeKm,
      Value<int> advanceNoticeDays,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ReminderRulesTableUpdateCompanionBuilder =
    ReminderRulesCompanion Function({
      Value<int> id,
      Value<int> serviceTypeId,
      Value<int?> intervalKm,
      Value<int?> intervalMonths,
      Value<int> advanceNoticeKm,
      Value<int> advanceNoticeDays,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ReminderRulesTableReferences
    extends BaseReferences<_$AppDatabase, $ReminderRulesTable, ReminderRule> {
  $$ReminderRulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ServiceTypesTable _serviceTypeIdTable(_$AppDatabase db) =>
      db.serviceTypes.createAlias(
        $_aliasNameGenerator(
          db.reminderRules.serviceTypeId,
          db.serviceTypes.id,
        ),
      );

  $$ServiceTypesTableProcessedTableManager get serviceTypeId {
    final $_column = $_itemColumn<int>('service_type_id')!;

    final manager = $$ServiceTypesTableTableManager(
      $_db,
      $_db.serviceTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serviceTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReminderRulesTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalKm => $composableBuilder(
    column: $table.intervalKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalMonths => $composableBuilder(
    column: $table.intervalMonths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advanceNoticeKm => $composableBuilder(
    column: $table.advanceNoticeKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advanceNoticeDays => $composableBuilder(
    column: $table.advanceNoticeDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ServiceTypesTableFilterComposer get serviceTypeId {
    final $$ServiceTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableFilterComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalKm => $composableBuilder(
    column: $table.intervalKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalMonths => $composableBuilder(
    column: $table.intervalMonths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advanceNoticeKm => $composableBuilder(
    column: $table.advanceNoticeKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advanceNoticeDays => $composableBuilder(
    column: $table.advanceNoticeDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServiceTypesTableOrderingComposer get serviceTypeId {
    final $$ServiceTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableOrderingComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get intervalKm => $composableBuilder(
    column: $table.intervalKm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalMonths => $composableBuilder(
    column: $table.intervalMonths,
    builder: (column) => column,
  );

  GeneratedColumn<int> get advanceNoticeKm => $composableBuilder(
    column: $table.advanceNoticeKm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get advanceNoticeDays => $composableBuilder(
    column: $table.advanceNoticeDays,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ServiceTypesTableAnnotationComposer get serviceTypeId {
    final $$ServiceTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReminderRulesTable,
          ReminderRule,
          $$ReminderRulesTableFilterComposer,
          $$ReminderRulesTableOrderingComposer,
          $$ReminderRulesTableAnnotationComposer,
          $$ReminderRulesTableCreateCompanionBuilder,
          $$ReminderRulesTableUpdateCompanionBuilder,
          (ReminderRule, $$ReminderRulesTableReferences),
          ReminderRule,
          PrefetchHooks Function({bool serviceTypeId})
        > {
  $$ReminderRulesTableTableManager(_$AppDatabase db, $ReminderRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> serviceTypeId = const Value.absent(),
                Value<int?> intervalKm = const Value.absent(),
                Value<int?> intervalMonths = const Value.absent(),
                Value<int> advanceNoticeKm = const Value.absent(),
                Value<int> advanceNoticeDays = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ReminderRulesCompanion(
                id: id,
                serviceTypeId: serviceTypeId,
                intervalKm: intervalKm,
                intervalMonths: intervalMonths,
                advanceNoticeKm: advanceNoticeKm,
                advanceNoticeDays: advanceNoticeDays,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int serviceTypeId,
                Value<int?> intervalKm = const Value.absent(),
                Value<int?> intervalMonths = const Value.absent(),
                Value<int> advanceNoticeKm = const Value.absent(),
                Value<int> advanceNoticeDays = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ReminderRulesCompanion.insert(
                id: id,
                serviceTypeId: serviceTypeId,
                intervalKm: intervalKm,
                intervalMonths: intervalMonths,
                advanceNoticeKm: advanceNoticeKm,
                advanceNoticeDays: advanceNoticeDays,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReminderRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({serviceTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (serviceTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.serviceTypeId,
                                referencedTable: $$ReminderRulesTableReferences
                                    ._serviceTypeIdTable(db),
                                referencedColumn: $$ReminderRulesTableReferences
                                    ._serviceTypeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReminderRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReminderRulesTable,
      ReminderRule,
      $$ReminderRulesTableFilterComposer,
      $$ReminderRulesTableOrderingComposer,
      $$ReminderRulesTableAnnotationComposer,
      $$ReminderRulesTableCreateCompanionBuilder,
      $$ReminderRulesTableUpdateCompanionBuilder,
      (ReminderRule, $$ReminderRulesTableReferences),
      ReminderRule,
      PrefetchHooks Function({bool serviceTypeId})
    >;
typedef $$MaintenanceRecordsTableCreateCompanionBuilder =
    MaintenanceRecordsCompanion Function({
      Value<int> id,
      required int vehicleId,
      required int serviceTypeId,
      required int odometerKm,
      required DateTime serviceDate,
      Value<String?> location,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$MaintenanceRecordsTableUpdateCompanionBuilder =
    MaintenanceRecordsCompanion Function({
      Value<int> id,
      Value<int> vehicleId,
      Value<int> serviceTypeId,
      Value<int> odometerKm,
      Value<DateTime> serviceDate,
      Value<String?> location,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$MaintenanceRecordsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MaintenanceRecordsTable,
          MaintenanceRecord
        > {
  $$MaintenanceRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehicleProfilesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicleProfiles.createAlias(
        $_aliasNameGenerator(
          db.maintenanceRecords.vehicleId,
          db.vehicleProfiles.id,
        ),
      );

  $$VehicleProfilesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id')!;

    final manager = $$VehicleProfilesTableTableManager(
      $_db,
      $_db.vehicleProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ServiceTypesTable _serviceTypeIdTable(_$AppDatabase db) =>
      db.serviceTypes.createAlias(
        $_aliasNameGenerator(
          db.maintenanceRecords.serviceTypeId,
          db.serviceTypes.id,
        ),
      );

  $$ServiceTypesTableProcessedTableManager get serviceTypeId {
    final $_column = $_itemColumn<int>('service_type_id')!;

    final manager = $$ServiceTypesTableTableManager(
      $_db,
      $_db.serviceTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serviceTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MaintenanceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get odometerKm => $composableBuilder(
    column: $table.odometerKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehicleProfilesTableFilterComposer get vehicleId {
    final $$VehicleProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTypesTableFilterComposer get serviceTypeId {
    final $$ServiceTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableFilterComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get odometerKm => $composableBuilder(
    column: $table.odometerKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehicleProfilesTableOrderingComposer get vehicleId {
    final $$VehicleProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTypesTableOrderingComposer get serviceTypeId {
    final $$ServiceTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableOrderingComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get odometerKm => $composableBuilder(
    column: $table.odometerKm,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehicleProfilesTableAnnotationComposer get vehicleId {
    final $$VehicleProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicleProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTypesTableAnnotationComposer get serviceTypeId {
    final $$ServiceTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceTypeId,
      referencedTable: $db.serviceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaintenanceRecordsTable,
          MaintenanceRecord,
          $$MaintenanceRecordsTableFilterComposer,
          $$MaintenanceRecordsTableOrderingComposer,
          $$MaintenanceRecordsTableAnnotationComposer,
          $$MaintenanceRecordsTableCreateCompanionBuilder,
          $$MaintenanceRecordsTableUpdateCompanionBuilder,
          (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
          MaintenanceRecord,
          PrefetchHooks Function({bool vehicleId, bool serviceTypeId})
        > {
  $$MaintenanceRecordsTableTableManager(
    _$AppDatabase db,
    $MaintenanceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaintenanceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaintenanceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaintenanceRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<int> serviceTypeId = const Value.absent(),
                Value<int> odometerKm = const Value.absent(),
                Value<DateTime> serviceDate = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MaintenanceRecordsCompanion(
                id: id,
                vehicleId: vehicleId,
                serviceTypeId: serviceTypeId,
                odometerKm: odometerKm,
                serviceDate: serviceDate,
                location: location,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vehicleId,
                required int serviceTypeId,
                required int odometerKm,
                required DateTime serviceDate,
                Value<String?> location = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MaintenanceRecordsCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                serviceTypeId: serviceTypeId,
                odometerKm: odometerKm,
                serviceDate: serviceDate,
                location: location,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MaintenanceRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleId = false, serviceTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vehicleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vehicleId,
                                referencedTable:
                                    $$MaintenanceRecordsTableReferences
                                        ._vehicleIdTable(db),
                                referencedColumn:
                                    $$MaintenanceRecordsTableReferences
                                        ._vehicleIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (serviceTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.serviceTypeId,
                                referencedTable:
                                    $$MaintenanceRecordsTableReferences
                                        ._serviceTypeIdTable(db),
                                referencedColumn:
                                    $$MaintenanceRecordsTableReferences
                                        ._serviceTypeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MaintenanceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaintenanceRecordsTable,
      MaintenanceRecord,
      $$MaintenanceRecordsTableFilterComposer,
      $$MaintenanceRecordsTableOrderingComposer,
      $$MaintenanceRecordsTableAnnotationComposer,
      $$MaintenanceRecordsTableCreateCompanionBuilder,
      $$MaintenanceRecordsTableUpdateCompanionBuilder,
      (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
      MaintenanceRecord,
      PrefetchHooks Function({bool vehicleId, bool serviceTypeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VehicleTypesTableTableManager get vehicleTypes =>
      $$VehicleTypesTableTableManager(_db, _db.vehicleTypes);
  $$VehicleBrandsTableTableManager get vehicleBrands =>
      $$VehicleBrandsTableTableManager(_db, _db.vehicleBrands);
  $$VehicleModelsTableTableManager get vehicleModels =>
      $$VehicleModelsTableTableManager(_db, _db.vehicleModels);
  $$VehicleProfilesTableTableManager get vehicleProfiles =>
      $$VehicleProfilesTableTableManager(_db, _db.vehicleProfiles);
  $$ServiceTypesTableTableManager get serviceTypes =>
      $$ServiceTypesTableTableManager(_db, _db.serviceTypes);
  $$ReminderRulesTableTableManager get reminderRules =>
      $$ReminderRulesTableTableManager(_db, _db.reminderRules);
  $$MaintenanceRecordsTableTableManager get maintenanceRecords =>
      $$MaintenanceRecordsTableTableManager(_db, _db.maintenanceRecords);
}
