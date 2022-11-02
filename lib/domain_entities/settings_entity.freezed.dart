// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsEntity _$SettingsEntityFromJson(Map<String, dynamic> json) {
  return _SettingsEntity.fromJson(json);
}

/// @nodoc
mixin _$SettingsEntity {
  bool get isDarkThemeOn => throw _privateConstructorUsedError;
  FilterSettings get filterSettings =>
      throw _privateConstructorUsedError; //TODO(me) FilterCondition
  bool get isThatTheFirstRun => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsEntityCopyWith<SettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEntityCopyWith<$Res> {
  factory $SettingsEntityCopyWith(
          SettingsEntity value, $Res Function(SettingsEntity) then) =
      _$SettingsEntityCopyWithImpl<$Res>;
  $Res call(
      {bool isDarkThemeOn,
      FilterSettings filterSettings,
      bool isThatTheFirstRun});

  $FilterSettingsCopyWith<$Res> get filterSettings;
}

/// @nodoc
class _$SettingsEntityCopyWithImpl<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  _$SettingsEntityCopyWithImpl(this._value, this._then);

  final SettingsEntity _value;
  // ignore: unused_field
  final $Res Function(SettingsEntity) _then;

  @override
  $Res call({
    Object? isDarkThemeOn = freezed,
    Object? filterSettings = freezed,
    Object? isThatTheFirstRun = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkThemeOn: isDarkThemeOn == freezed
          ? _value.isDarkThemeOn
          : isDarkThemeOn // ignore: cast_nullable_to_non_nullable
              as bool,
      filterSettings: filterSettings == freezed
          ? _value.filterSettings
          : filterSettings // ignore: cast_nullable_to_non_nullable
              as FilterSettings,
      isThatTheFirstRun: isThatTheFirstRun == freezed
          ? _value.isThatTheFirstRun
          : isThatTheFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FilterSettingsCopyWith<$Res> get filterSettings {
    return $FilterSettingsCopyWith<$Res>(_value.filterSettings, (value) {
      return _then(_value.copyWith(filterSettings: value));
    });
  }
}

/// @nodoc
abstract class _$$_SettingsEntityCopyWith<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  factory _$$_SettingsEntityCopyWith(
          _$_SettingsEntity value, $Res Function(_$_SettingsEntity) then) =
      __$$_SettingsEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isDarkThemeOn,
      FilterSettings filterSettings,
      bool isThatTheFirstRun});

  @override
  $FilterSettingsCopyWith<$Res> get filterSettings;
}

/// @nodoc
class __$$_SettingsEntityCopyWithImpl<$Res>
    extends _$SettingsEntityCopyWithImpl<$Res>
    implements _$$_SettingsEntityCopyWith<$Res> {
  __$$_SettingsEntityCopyWithImpl(
      _$_SettingsEntity _value, $Res Function(_$_SettingsEntity) _then)
      : super(_value, (v) => _then(v as _$_SettingsEntity));

  @override
  _$_SettingsEntity get _value => super._value as _$_SettingsEntity;

  @override
  $Res call({
    Object? isDarkThemeOn = freezed,
    Object? filterSettings = freezed,
    Object? isThatTheFirstRun = freezed,
  }) {
    return _then(_$_SettingsEntity(
      isDarkThemeOn: isDarkThemeOn == freezed
          ? _value.isDarkThemeOn
          : isDarkThemeOn // ignore: cast_nullable_to_non_nullable
              as bool,
      filterSettings: filterSettings == freezed
          ? _value.filterSettings
          : filterSettings // ignore: cast_nullable_to_non_nullable
              as FilterSettings,
      isThatTheFirstRun: isThatTheFirstRun == freezed
          ? _value.isThatTheFirstRun
          : isThatTheFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsEntity implements _SettingsEntity {
  const _$_SettingsEntity(
      {required this.isDarkThemeOn,
      required this.filterSettings,
      required this.isThatTheFirstRun});

  factory _$_SettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsEntityFromJson(json);

  @override
  final bool isDarkThemeOn;
  @override
  final FilterSettings filterSettings;
//TODO(me) FilterCondition
  @override
  final bool isThatTheFirstRun;

  @override
  String toString() {
    return 'SettingsEntity(isDarkThemeOn: $isDarkThemeOn, filterSettings: $filterSettings, isThatTheFirstRun: $isThatTheFirstRun)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsEntity &&
            const DeepCollectionEquality()
                .equals(other.isDarkThemeOn, isDarkThemeOn) &&
            const DeepCollectionEquality()
                .equals(other.filterSettings, filterSettings) &&
            const DeepCollectionEquality()
                .equals(other.isThatTheFirstRun, isThatTheFirstRun));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isDarkThemeOn),
      const DeepCollectionEquality().hash(filterSettings),
      const DeepCollectionEquality().hash(isThatTheFirstRun));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsEntityCopyWith<_$_SettingsEntity> get copyWith =>
      __$$_SettingsEntityCopyWithImpl<_$_SettingsEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsEntityToJson(
      this,
    );
  }
}

abstract class _SettingsEntity implements SettingsEntity {
  const factory _SettingsEntity(
      {required final bool isDarkThemeOn,
      required final FilterSettings filterSettings,
      required final bool isThatTheFirstRun}) = _$_SettingsEntity;

  factory _SettingsEntity.fromJson(Map<String, dynamic> json) =
      _$_SettingsEntity.fromJson;

  @override
  bool get isDarkThemeOn;
  @override
  FilterSettings get filterSettings;
  @override //TODO(me) FilterCondition
  bool get isThatTheFirstRun;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsEntityCopyWith<_$_SettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
