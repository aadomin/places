// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'places_get_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacesGetAPI _$PlacesGetAPIFromJson(Map<String, dynamic> json) {
  return _PlacesGetAPI.fromJson(json);
}

/// @nodoc
mixin _$PlacesGetAPI {
  List<PlaceDto> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesGetAPICopyWith<PlacesGetAPI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesGetAPICopyWith<$Res> {
  factory $PlacesGetAPICopyWith(
          PlacesGetAPI value, $Res Function(PlacesGetAPI) then) =
      _$PlacesGetAPICopyWithImpl<$Res>;
  $Res call({List<PlaceDto> places});
}

/// @nodoc
class _$PlacesGetAPICopyWithImpl<$Res> implements $PlacesGetAPICopyWith<$Res> {
  _$PlacesGetAPICopyWithImpl(this._value, this._then);

  final PlacesGetAPI _value;
  // ignore: unused_field
  final $Res Function(PlacesGetAPI) _then;

  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_value.copyWith(
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_PlacesGetAPICopyWith<$Res>
    implements $PlacesGetAPICopyWith<$Res> {
  factory _$$_PlacesGetAPICopyWith(
          _$_PlacesGetAPI value, $Res Function(_$_PlacesGetAPI) then) =
      __$$_PlacesGetAPICopyWithImpl<$Res>;
  @override
  $Res call({List<PlaceDto> places});
}

/// @nodoc
class __$$_PlacesGetAPICopyWithImpl<$Res>
    extends _$PlacesGetAPICopyWithImpl<$Res>
    implements _$$_PlacesGetAPICopyWith<$Res> {
  __$$_PlacesGetAPICopyWithImpl(
      _$_PlacesGetAPI _value, $Res Function(_$_PlacesGetAPI) _then)
      : super(_value, (v) => _then(v as _$_PlacesGetAPI));

  @override
  _$_PlacesGetAPI get _value => super._value as _$_PlacesGetAPI;

  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_$_PlacesGetAPI(
      places: places == freezed
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacesGetAPI implements _PlacesGetAPI {
  const _$_PlacesGetAPI({required final List<PlaceDto> places})
      : _places = places;

  factory _$_PlacesGetAPI.fromJson(Map<String, dynamic> json) =>
      _$$_PlacesGetAPIFromJson(json);

  final List<PlaceDto> _places;
  @override
  List<PlaceDto> get places {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'PlacesGetAPI(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacesGetAPI &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  _$$_PlacesGetAPICopyWith<_$_PlacesGetAPI> get copyWith =>
      __$$_PlacesGetAPICopyWithImpl<_$_PlacesGetAPI>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacesGetAPIToJson(
      this,
    );
  }
}

abstract class _PlacesGetAPI implements PlacesGetAPI {
  const factory _PlacesGetAPI({required final List<PlaceDto> places}) =
      _$_PlacesGetAPI;

  factory _PlacesGetAPI.fromJson(Map<String, dynamic> json) =
      _$_PlacesGetAPI.fromJson;

  @override
  List<PlaceDto> get places;
  @override
  @JsonKey(ignore: true)
  _$$_PlacesGetAPICopyWith<_$_PlacesGetAPI> get copyWith =>
      throw _privateConstructorUsedError;
}
