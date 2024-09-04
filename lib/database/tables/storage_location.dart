import 'dart:ui';

import 'package:drift/drift.dart';

/// Место хранения.
class StorageLocation extends Table {
  /// Id.
  IntColumn get id => integer().unique().autoIncrement()();

  /// Название место хранения.
  TextColumn get name => text()();

  /// Название место хранения
  TextColumn get description => text().nullable()();

  /// Цветовой тэг места.
  IntColumn get colorTag =>
      integer().map(ColorConverter()).withDefault(const Constant(0xFF000000))();
}

/// Конвертер цвета.
class ColorConverter extends TypeConverter<Color, int> {
  @override
  Color fromSql(int fromDb) {
    return Color(fromDb);
  }

  @override
  int toSql(Color value) {
    return value.value;
  }
}
