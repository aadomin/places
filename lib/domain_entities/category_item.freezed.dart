// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return _CategoryItem.fromJson(json);
}

/// @nodoc
mixin _$CategoryItem {
  String get name => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryItemCopyWith<CategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemCopyWith<$Res> {
  factory $CategoryItemCopyWith(
          CategoryItem value, $Res Function(CategoryItem) then) =
      _$CategoryItemCopyWithImpl<$Res>;
  $Res call({String name, bool isSelected});
}

/// @nodoc
class _$CategoryItemCopyWithImpl<$Res> implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._value, this._then);

  final CategoryItem _value;
  // ignore: unused_field
  final $Res Function(CategoryItem) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryItemCopyWith<$Res>
    implements $CategoryItemCopyWith<$Res> {
  factory _$$_CategoryItemCopyWith(
          _$_CategoryItem value, $Res Function(_$_CategoryItem) then) =
      __$$_CategoryItemCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool isSelected});
}

/// @nodoc
class __$$_CategoryItemCopyWithImpl<$Res>
    extends _$CategoryItemCopyWithImpl<$Res>
    implements _$$_CategoryItemCopyWith<$Res> {
  __$$_CategoryItemCopyWithImpl(
      _$_CategoryItem _value, $Res Function(_$_CategoryItem) _then)
      : super(_value, (v) => _then(v as _$_CategoryItem));

  @override
  _$_CategoryItem get _value => super._value as _$_CategoryItem;

  @override
  $Res call({
    Object? name = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_CategoryItem(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryItem implements _CategoryItem {
  const _$_CategoryItem({required this.name, required this.isSelected});

  factory _$_CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryItemFromJson(json);

  @override
  final String name;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'CategoryItem(name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryItem &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryItemCopyWith<_$_CategoryItem> get copyWith =>
      __$$_CategoryItemCopyWithImpl<_$_CategoryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryItemToJson(
      this,
    );
  }
}

abstract class _CategoryItem implements CategoryItem {
  const factory _CategoryItem(
      {required final String name,
      required final bool isSelected}) = _$_CategoryItem;

  factory _CategoryItem.fromJson(Map<String, dynamic> json) =
      _$_CategoryItem.fromJson;

  @override
  String get name;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryItemCopyWith<_$_CategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
