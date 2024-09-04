// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StorageLocationTable extends StorageLocation
    with TableInfo<$StorageLocationTable, StorageLocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageLocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorTagMeta =
      const VerificationMeta('colorTag');
  @override
  late final GeneratedColumnWithTypeConverter<Color, int> colorTag =
      GeneratedColumn<int>('color_tag', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0xFF000000))
          .withConverter<Color>($StorageLocationTable.$convertercolorTag);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, colorTag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_location';
  @override
  VerificationContext validateIntegrity(
      Insertable<StorageLocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    context.handle(_colorTagMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageLocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageLocationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      colorTag: $StorageLocationTable.$convertercolorTag.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}color_tag'])!),
    );
  }

  @override
  $StorageLocationTable createAlias(String alias) {
    return $StorageLocationTable(attachedDatabase, alias);
  }

  static TypeConverter<Color, int> $convertercolorTag = ColorConverter();
}

class StorageLocationData extends DataClass
    implements Insertable<StorageLocationData> {
  /// Id.
  final int id;

  /// Название место хранения.
  final String name;

  /// Название место хранения
  final String? description;

  /// Цветовой тэг места.
  final Color colorTag;
  const StorageLocationData(
      {required this.id,
      required this.name,
      this.description,
      required this.colorTag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['color_tag'] = Variable<int>(
          $StorageLocationTable.$convertercolorTag.toSql(colorTag));
    }
    return map;
  }

  StorageLocationCompanion toCompanion(bool nullToAbsent) {
    return StorageLocationCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      colorTag: Value(colorTag),
    );
  }

  factory StorageLocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageLocationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      colorTag: serializer.fromJson<Color>(json['colorTag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'colorTag': serializer.toJson<Color>(colorTag),
    };
  }

  StorageLocationData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Color? colorTag}) =>
      StorageLocationData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        colorTag: colorTag ?? this.colorTag,
      );
  StorageLocationData copyWithCompanion(StorageLocationCompanion data) {
    return StorageLocationData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      colorTag: data.colorTag.present ? data.colorTag.value : this.colorTag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageLocationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorTag: $colorTag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, colorTag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageLocationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.colorTag == this.colorTag);
}

class StorageLocationCompanion extends UpdateCompanion<StorageLocationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<Color> colorTag;
  const StorageLocationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.colorTag = const Value.absent(),
  });
  StorageLocationCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.colorTag = const Value.absent(),
  }) : name = Value(name);
  static Insertable<StorageLocationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? colorTag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (colorTag != null) 'color_tag': colorTag,
    });
  }

  StorageLocationCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<Color>? colorTag}) {
    return StorageLocationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      colorTag: colorTag ?? this.colorTag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorTag.present) {
      map['color_tag'] = Variable<int>(
          $StorageLocationTable.$convertercolorTag.toSql(colorTag.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageLocationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorTag: $colorTag')
          ..write(')'))
        .toString();
  }
}

class $StorageItemTable extends StorageItem
    with TableInfo<$StorageItemTable, StorageItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updateDateMeta =
      const VerificationMeta('updateDate');
  @override
  late final GeneratedColumn<DateTime> updateDate = GeneratedColumn<DateTime>(
      'update_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES storage_location (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, name, description, photoPath, updateDate, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_item';
  @override
  VerificationContext validateIntegrity(Insertable<StorageItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('update_date')) {
      context.handle(
          _updateDateMeta,
          updateDate.isAcceptableOrUnknown(
              data['update_date']!, _updateDateMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      updateDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_date'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
    );
  }

  @override
  $StorageItemTable createAlias(String alias) {
    return $StorageItemTable(attachedDatabase, alias);
  }
}

class StorageItemData extends DataClass implements Insertable<StorageItemData> {
  /// Id.
  final int id;

  /// Число хранимых предметов.
  final int amount;

  /// Название предмета.
  final String name;

  /// Описание предмета.
  final String? description;

  /// Фотография предмета.
  final String? photoPath;

  /// Дата обновления. По умолчанию стоит дата добавления.
  final DateTime updateDate;

  /// Место хранения.
  final int location;
  const StorageItemData(
      {required this.id,
      required this.amount,
      required this.name,
      this.description,
      this.photoPath,
      required this.updateDate,
      required this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['update_date'] = Variable<DateTime>(updateDate);
    map['location'] = Variable<int>(location);
    return map;
  }

  StorageItemCompanion toCompanion(bool nullToAbsent) {
    return StorageItemCompanion(
      id: Value(id),
      amount: Value(amount),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      updateDate: Value(updateDate),
      location: Value(location),
    );
  }

  factory StorageItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageItemData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      updateDate: serializer.fromJson<DateTime>(json['updateDate']),
      location: serializer.fromJson<int>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'photoPath': serializer.toJson<String?>(photoPath),
      'updateDate': serializer.toJson<DateTime>(updateDate),
      'location': serializer.toJson<int>(location),
    };
  }

  StorageItemData copyWith(
          {int? id,
          int? amount,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> photoPath = const Value.absent(),
          DateTime? updateDate,
          int? location}) =>
      StorageItemData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        updateDate: updateDate ?? this.updateDate,
        location: location ?? this.location,
      );
  StorageItemData copyWithCompanion(StorageItemCompanion data) {
    return StorageItemData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      updateDate:
          data.updateDate.present ? data.updateDate.value : this.updateDate,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageItemData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('photoPath: $photoPath, ')
          ..write('updateDate: $updateDate, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, amount, name, description, photoPath, updateDate, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageItemData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.name == this.name &&
          other.description == this.description &&
          other.photoPath == this.photoPath &&
          other.updateDate == this.updateDate &&
          other.location == this.location);
}

class StorageItemCompanion extends UpdateCompanion<StorageItemData> {
  final Value<int> id;
  final Value<int> amount;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> photoPath;
  final Value<DateTime> updateDate;
  final Value<int> location;
  const StorageItemCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.location = const Value.absent(),
  });
  StorageItemCompanion.insert({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.updateDate = const Value.absent(),
    required int location,
  })  : name = Value(name),
        location = Value(location);
  static Insertable<StorageItemData> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? photoPath,
    Expression<DateTime>? updateDate,
    Expression<int>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (photoPath != null) 'photo_path': photoPath,
      if (updateDate != null) 'update_date': updateDate,
      if (location != null) 'location': location,
    });
  }

  StorageItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? photoPath,
      Value<DateTime>? updateDate,
      Value<int>? location}) {
    return StorageItemCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      name: name ?? this.name,
      description: description ?? this.description,
      photoPath: photoPath ?? this.photoPath,
      updateDate: updateDate ?? this.updateDate,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<DateTime>(updateDate.value);
    }
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageItemCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('photoPath: $photoPath, ')
          ..write('updateDate: $updateDate, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StorageLocationTable storageLocation =
      $StorageLocationTable(this);
  late final $StorageItemTable storageItem = $StorageItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [storageLocation, storageItem];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$StorageLocationTableCreateCompanionBuilder = StorageLocationCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<Color> colorTag,
});
typedef $$StorageLocationTableUpdateCompanionBuilder = StorageLocationCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<Color> colorTag,
});

final class $$StorageLocationTableReferences extends BaseReferences<
    _$AppDatabase, $StorageLocationTable, StorageLocationData> {
  $$StorageLocationTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StorageItemTable, List<StorageItemData>>
      _storageItemRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.storageItem,
              aliasName: $_aliasNameGenerator(
                  db.storageLocation.id, db.storageItem.location));

  $$StorageItemTableProcessedTableManager get storageItemRefs {
    final manager = $$StorageItemTableTableManager($_db, $_db.storageItem)
        .filter((f) => f.location.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_storageItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$StorageLocationTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StorageLocationTable> {
  $$StorageLocationTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Color, Color, int> get colorTag =>
      $state.composableBuilder(
          column: $state.table.colorTag,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter storageItemRefs(
      ComposableFilter Function($$StorageItemTableFilterComposer f) f) {
    final $$StorageItemTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.storageItem,
        getReferencedColumn: (t) => t.location,
        builder: (joinBuilder, parentComposers) =>
            $$StorageItemTableFilterComposer(ComposerState($state.db,
                $state.db.storageItem, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$StorageLocationTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StorageLocationTable> {
  $$StorageLocationTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colorTag => $state.composableBuilder(
      column: $state.table.colorTag,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$StorageLocationTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StorageLocationTable,
    StorageLocationData,
    $$StorageLocationTableFilterComposer,
    $$StorageLocationTableOrderingComposer,
    $$StorageLocationTableCreateCompanionBuilder,
    $$StorageLocationTableUpdateCompanionBuilder,
    (StorageLocationData, $$StorageLocationTableReferences),
    StorageLocationData,
    PrefetchHooks Function({bool storageItemRefs})> {
  $$StorageLocationTableTableManager(
      _$AppDatabase db, $StorageLocationTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StorageLocationTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StorageLocationTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Color> colorTag = const Value.absent(),
          }) =>
              StorageLocationCompanion(
            id: id,
            name: name,
            description: description,
            colorTag: colorTag,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<Color> colorTag = const Value.absent(),
          }) =>
              StorageLocationCompanion.insert(
            id: id,
            name: name,
            description: description,
            colorTag: colorTag,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StorageLocationTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({storageItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (storageItemRefs) db.storageItem],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (storageItemRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$StorageLocationTableReferences
                            ._storageItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StorageLocationTableReferences(db, table, p0)
                                .storageItemRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.location == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$StorageLocationTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StorageLocationTable,
    StorageLocationData,
    $$StorageLocationTableFilterComposer,
    $$StorageLocationTableOrderingComposer,
    $$StorageLocationTableCreateCompanionBuilder,
    $$StorageLocationTableUpdateCompanionBuilder,
    (StorageLocationData, $$StorageLocationTableReferences),
    StorageLocationData,
    PrefetchHooks Function({bool storageItemRefs})>;
typedef $$StorageItemTableCreateCompanionBuilder = StorageItemCompanion
    Function({
  Value<int> id,
  Value<int> amount,
  required String name,
  Value<String?> description,
  Value<String?> photoPath,
  Value<DateTime> updateDate,
  required int location,
});
typedef $$StorageItemTableUpdateCompanionBuilder = StorageItemCompanion
    Function({
  Value<int> id,
  Value<int> amount,
  Value<String> name,
  Value<String?> description,
  Value<String?> photoPath,
  Value<DateTime> updateDate,
  Value<int> location,
});

final class $$StorageItemTableReferences
    extends BaseReferences<_$AppDatabase, $StorageItemTable, StorageItemData> {
  $$StorageItemTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StorageLocationTable _locationTable(_$AppDatabase db) =>
      db.storageLocation.createAlias(
          $_aliasNameGenerator(db.storageItem.location, db.storageLocation.id));

  $$StorageLocationTableProcessedTableManager? get location {
    if ($_item.location == null) return null;
    final manager =
        $$StorageLocationTableTableManager($_db, $_db.storageLocation)
            .filter((f) => f.id($_item.location!));
    final item = $_typedResult.readTableOrNull(_locationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StorageItemTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StorageItemTable> {
  $$StorageItemTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get photoPath => $state.composableBuilder(
      column: $state.table.photoPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updateDate => $state.composableBuilder(
      column: $state.table.updateDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$StorageLocationTableFilterComposer get location {
    final $$StorageLocationTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.location,
            referencedTable: $state.db.storageLocation,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$StorageLocationTableFilterComposer(ComposerState($state.db,
                    $state.db.storageLocation, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$StorageItemTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StorageItemTable> {
  $$StorageItemTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get photoPath => $state.composableBuilder(
      column: $state.table.photoPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updateDate => $state.composableBuilder(
      column: $state.table.updateDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$StorageLocationTableOrderingComposer get location {
    final $$StorageLocationTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.location,
            referencedTable: $state.db.storageLocation,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$StorageLocationTableOrderingComposer(ComposerState($state.db,
                    $state.db.storageLocation, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$StorageItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StorageItemTable,
    StorageItemData,
    $$StorageItemTableFilterComposer,
    $$StorageItemTableOrderingComposer,
    $$StorageItemTableCreateCompanionBuilder,
    $$StorageItemTableUpdateCompanionBuilder,
    (StorageItemData, $$StorageItemTableReferences),
    StorageItemData,
    PrefetchHooks Function({bool location})> {
  $$StorageItemTableTableManager(_$AppDatabase db, $StorageItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StorageItemTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StorageItemTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<DateTime> updateDate = const Value.absent(),
            Value<int> location = const Value.absent(),
          }) =>
              StorageItemCompanion(
            id: id,
            amount: amount,
            name: name,
            description: description,
            photoPath: photoPath,
            updateDate: updateDate,
            location: location,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<DateTime> updateDate = const Value.absent(),
            required int location,
          }) =>
              StorageItemCompanion.insert(
            id: id,
            amount: amount,
            name: name,
            description: description,
            photoPath: photoPath,
            updateDate: updateDate,
            location: location,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StorageItemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({location = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (location) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.location,
                    referencedTable:
                        $$StorageItemTableReferences._locationTable(db),
                    referencedColumn:
                        $$StorageItemTableReferences._locationTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StorageItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StorageItemTable,
    StorageItemData,
    $$StorageItemTableFilterComposer,
    $$StorageItemTableOrderingComposer,
    $$StorageItemTableCreateCompanionBuilder,
    $$StorageItemTableUpdateCompanionBuilder,
    (StorageItemData, $$StorageItemTableReferences),
    StorageItemData,
    PrefetchHooks Function({bool location})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StorageLocationTableTableManager get storageLocation =>
      $$StorageLocationTableTableManager(_db, _db.storageLocation);
  $$StorageItemTableTableManager get storageItem =>
      $$StorageItemTableTableManager(_db, _db.storageItem);
}
