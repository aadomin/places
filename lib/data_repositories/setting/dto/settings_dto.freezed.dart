// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) {
  return _SettingsDto.fromJson(json);
}

/// @nodoc
mixin _$SettingsDto {
  bool? get isDarkThemeOn => throw _privateConstructorUsedError;
  FilterSettings? get filterSettings => throw _privateConstructorUsedError;
  bool? get isThatTheFirstRun => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsDtoCopyWith<SettingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDtoCopyWith<$Res> {
  factory $SettingsDtoCopyWith(
          SettingsDto value, $Res Function(SettingsDto) then) =
      _$SettingsDtoCopyWithImpl<$Res>;
  $Res call(
      {bool? isDarkThemeOn,
      FilterSettings? filterSettings,
      bool? isThatTheFirstRun});

  $FilterSettingsCopyWith<$Res>? get filterSettings;
}

/// @nodoc
class _$SettingsDtoCopyWithImpl<$Res> implements $SettingsDtoCopyWith<$Res> {
  _$SettingsDtoCopyWithImpl(this._value, this._then);

  final SettingsDto _value;
  // ignore: unused_field
  final $Res Function(SettingsDto) _then;

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
              as bool?,
      filterSettings: filterSettings == freezed
          ? _value.filterSettings
          : filterSettings // ignore: cast_nullable_to_non_nullable
              as FilterSettings?,
      isThatTheFirstRun: isThatTheFirstRun == freezed
          ? _value.isThatTheFirstRun
          : isThatTheFirstRun // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $FilterSettingsCopyWith<$Res>? get filterSettings {
    if (_value.filterSettings == null) {
      return null;
    }

    return $FilterSettingsCopyWith<$Res>(_value.filterSettings!, (value) {
      return _then(_value.copyWith(filterSettings: value));
    });
  }
}

/// @nodoc
abstract class _$$_SettingsDtoCopyWith<$Res>
    implements $SettingsDtoCopyWith<$Res> {
  factory _$$_SettingsDtoCopyWith(
          _$_SettingsDto value, $Res Function(_$_SettingsDto) then) =
      __$$_SettingsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? isDarkThemeOn,
      FilterSettings? filterSettings,
      bool? isThatTheFirstRun});

  @override
  $FilterSettingsCopyWith<$Res>? get filterSettings;
}

/// @nodoc
class __$$_SettingsDtoCopyWithImpl<$Res> extends _$SettingsDtoCopyWithImpl<$Res>
    implements _$$_SettingsDtoCopyWith<$Res> {
  __$$_SettingsDtoCopyWithImpl(
      _$_SettingsDto _value, $Res Function(_$_SettingsDto) _then)
      : super(_value, (v) => _then(v as _$_SettingsDto));

  @override
  _$_SettingsDto get _value => super._value as _$_SettingsDto;

  @override
  $Res call({
    Object? isDarkThemeOn = freezed,
    Object? filterSettings = freezed,
    Object? isThatTheFirstRun = freezed,
  }) {
    return _then(_$_SettingsDto(
      isDarkThemeOn: isDarkThemeOn == freezed
          ? _value.isDarkThemeOn
          : isDarkThemeOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      filterSettings: filterSettings == freezed
          ? _value.filterSettings
          : filterSettings // ignore: cast_nullable_to_non_nullable
              as FilterSettings?,
      isThatTheFirstRun: isThatTheFirstRun == freezed
          ? _value.isThatTheFirstRun
          : isThatTheFirstRun // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsDto implements _SettingsDto {
  const _$_SettingsDto(
      {required this.isDarkThemeOn,
      required this.filterSettings,
      required this.isThatTheFirstRun});

  factory _$_SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsDtoFromJson(json);

  @override
  final bool? isDarkThemeOn;
  @override
  final FilterSettings? filterSettings;
  @override
  final bool? isThatTheFirstRun;

  @override
  String toString() {
    return 'SettingsDto(isDarkThemeOn: $isDarkThemeOn, filterSettings: $filterSettings, isThatTheFirstRun: $isThatTheFirstRun)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsDto &&
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
  _$$_SettingsDtoCopyWith<_$_SettingsDto> get copyWith =>
      __$$_SettingsDtoCopyWithImpl<_$_SettingsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsDtoToJson(
      this,
    );
  }
}

abstract class _SettingsDto implements SettingsDto {
  const factory _SettingsDto(
      {required final bool? isDarkThemeOn,
      required final FilterSettings? filterSettings,
      required final bool? isThatTheFirstRun}) = _$_SettingsDto;

  factory _SettingsDto.fromJson(Map<String, dynamic> json) =
      _$_SettingsDto.fromJson;

  @override
  bool? get isDarkThemeOn;
  @override
  FilterSettings? get filterSettings;
  @override
  bool? get isThatTheFirstRun;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsDtoCopyWith<_$_SettingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
