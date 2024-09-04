import 'package:drift/drift.dart';

import 'storage_location.dart';

/// Предмет в хранилище.
class StorageItem extends Table {
  /// Id.
  IntColumn get id => integer().unique().autoIncrement()();

  /// Число хранимых предметов.
  IntColumn get amount => integer().withDefault(const Constant<int>(1))();

  /// Название предмета.
  TextColumn get name => text()();

  /// Описание предмета.
  TextColumn get description => text().nullable()();

  /// Фотография предмета.
  TextColumn get photoPath => text().nullable()();

  /// Дата обновления. По умолчанию стоит дата добавления.
  DateTimeColumn get updateDate => dateTime().withDefault(currentDateAndTime)();

  /// Место хранения.
  IntColumn get location => integer().references(StorageLocation, #id)();
}
