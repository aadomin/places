// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterSettings _$FilterSettingsFromJson(Map<String, dynamic> json) {
  return _FilterSettings.fromJson(json);
}

/// @nodoc
mixin _$FilterSettings {
  List<CategoryItem> get filterItemsState => throw _privateConstructorUsedError;
  int get radiusOfSearch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterSettingsCopyWith<FilterSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterSettingsCopyWith<$Res> {
  factory $FilterSettingsCopyWith(
          FilterSettings value, $Res Function(FilterSettings) then) =
      _$FilterSettingsCopyWithImpl<$Res>;
  $Res call({List<CategoryItem> filterItemsState, int radiusOfSearch});
}

/// @nodoc
class _$FilterSettingsCopyWithImpl<$Res>
    implements $FilterSettingsCopyWith<$Res> {
  _$FilterSettingsCopyWithImpl(this._value, this._then);

  final FilterSettings _value;
  // ignore: unused_field
  final $Res Function(FilterSettings) _then;

  @override
  $Res call({
    Object? filterItemsState = freezed,
    Object? radiusOfSearch = freezed,
  }) {
    return _then(_value.copyWith(
      filterItemsState: filterItemsState == freezed
          ? _value.filterItemsState
          : filterItemsState // ignore: cast_nullable_to_non_nullable
              as List<CategoryItem>,
      radiusOfSearch: radiusOfSearch == freezed
          ? _value.radiusOfSearch
          : radiusOfSearch // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FilterSettingsCopyWith<$Res>
    implements $FilterSettingsCopyWith<$Res> {
  factory _$$_FilterSettingsCopyWith(
          _$_FilterSettings value, $Res Function(_$_FilterSettings) then) =
      __$$_FilterSettingsCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryItem> filterItemsState, int radiusOfSearch});
}

/// @nodoc
class __$$_FilterSettingsCopyWithImpl<$Res>
    extends _$FilterSettingsCopyWithImpl<$Res>
    implements _$$_FilterSettingsCopyWith<$Res> {
  __$$_FilterSettingsCopyWithImpl(
      _$_FilterSettings _value, $Res Function(_$_FilterSettings) _then)
      : super(_value, (v) => _then(v as _$_FilterSettings));

  @override
  _$_FilterSettings get _value => super._value as _$_FilterSettings;

  @override
  $Res call({
    Object? filterItemsState = freezed,
    Object? radiusOfSearch = freezed,
  }) {
    return _then(_$_FilterSettings(
      filterItemsState: filterItemsState == freezed
          ? _value._filterItemsState
          : filterItemsState // ignore: cast_nullable_to_non_nullable
              as List<CategoryItem>,
      radiusOfSearch: radiusOfSearch == freezed
          ? _value.radiusOfSearch
          : radiusOfSearch // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterSettings implements _FilterSettings {
  const _$_FilterSettings(
      {required final List<CategoryItem> filterItemsState,
      required this.radiusOfSearch})
      : _filterItemsState = filterItemsState;

  factory _$_FilterSettings.fromJson(Map<String, dynamic> json) =>
      _$$_FilterSettingsFromJson(json);

  final List<CategoryItem> _filterItemsState;
  @override
  List<CategoryItem> get filterItemsState {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterItemsState);
  }

  @override
  final int radiusOfSearch;

  @override
  String toString() {
    return 'FilterSettings(filterItemsState: $filterItemsState, radiusOfSearch: $radiusOfSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterSettings &&
            const DeepCollectionEquality()
                .equals(other._filterItemsState, _filterItemsState) &&
            const DeepCollectionEquality()
                .equals(other.radiusOfSearch, radiusOfSearch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterItemsState),
      const DeepCollectionEquality().hash(radiusOfSearch));

  @JsonKey(ignore: true)
  @override
  _$$_FilterSettingsCopyWith<_$_FilterSettings> get copyWith =>
      __$$_FilterSettingsCopyWithImpl<_$_FilterSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterSettingsToJson(
      this,
    );
  }
}

abstract class _FilterSettings implements FilterSettings {
  const factory _FilterSettings(
      {required final List<CategoryItem> filterItemsState,
      required final int radiusOfSearch}) = _$_FilterSettings;

  factory _FilterSettings.fromJson(Map<String, dynamic> json) =
      _$_FilterSettings.fromJson;

  @override
  List<CategoryItem> get filterItemsState;
  @override
  int get radiusOfSearch;
  @override
  @JsonKey(ignore: true)
  _$$_FilterSettingsCopyWith<_$_FilterSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
