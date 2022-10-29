// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_item.freezed.dart';
part 'category_item.g.dart';

// flutter pub run build_runner build

///
/// Доменный слой приложения. Базовая бизнес-логика
/// Модель категории
///
@freezed
class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String name,
    required bool isSelected,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, Object?> json) =>
      _$CategoryItemFromJson(json);
}
