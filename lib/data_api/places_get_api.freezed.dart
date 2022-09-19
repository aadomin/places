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
  List<PlaceDTO> get places => throw _privateConstructorUsedError;

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
  $Res call({List<PlaceDTO> places});
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
              as List<PlaceDTO>,
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
  $Res call({List<PlaceDTO> places});
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
              as List<PlaceDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacesGetAPI implements _PlacesGetAPI {
  const _$_PlacesGetAPI({required final List<PlaceDTO> places})
      : _places = places;

  factory _$_PlacesGetAPI.fromJson(Map<String, dynamic> json) =>
      _$$_PlacesGetAPIFromJson(json);

  final List<PlaceDTO> _places;
  @override
  List<PlaceDTO> get places {
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
  const factory _PlacesGetAPI({required final List<PlaceDTO> places}) =
      _$_PlacesGetAPI;

  factory _PlacesGetAPI.fromJson(Map<String, dynamic> json) =
      _$_PlacesGetAPI.fromJson;

  @override
  List<PlaceDTO> get places;
  @override
  @JsonKey(ignore: true)
  _$$_PlacesGetAPICopyWith<_$_PlacesGetAPI> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceDTO _$PlaceDTOFromJson(Map<String, dynamic> json) {
  return _PlaceDTO.fromJson(json);
}

/// @nodoc
mixin _$PlaceDTO {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get placeType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDTOCopyWith<PlaceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDTOCopyWith<$Res> {
  factory $PlaceDTOCopyWith(PlaceDTO value, $Res Function(PlaceDTO) then) =
      _$PlaceDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double lat,
      double lng,
      String name,
      List<String> urls,
      String placeType,
      String description});
}

/// @nodoc
class _$PlaceDTOCopyWithImpl<$Res> implements $PlaceDTOCopyWith<$Res> {
  _$PlaceDTOCopyWithImpl(this._value, this._then);

  final PlaceDTO _value;
  // ignore: unused_field
  final $Res Function(PlaceDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? urls = freezed,
    Object? placeType = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PlaceDTOCopyWith<$Res> implements $PlaceDTOCopyWith<$Res> {
  factory _$$_PlaceDTOCopyWith(
          _$_PlaceDTO value, $Res Function(_$_PlaceDTO) then) =
      __$$_PlaceDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double lat,
      double lng,
      String name,
      List<String> urls,
      String placeType,
      String description});
}

/// @nodoc
class __$$_PlaceDTOCopyWithImpl<$Res> extends _$PlaceDTOCopyWithImpl<$Res>
    implements _$$_PlaceDTOCopyWith<$Res> {
  __$$_PlaceDTOCopyWithImpl(
      _$_PlaceDTO _value, $Res Function(_$_PlaceDTO) _then)
      : super(_value, (v) => _then(v as _$_PlaceDTO));

  @override
  _$_PlaceDTO get _value => super._value as _$_PlaceDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? urls = freezed,
    Object? placeType = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_PlaceDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceDTO implements _PlaceDTO {
  const _$_PlaceDTO(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name,
      required final List<String> urls,
      required this.placeType,
      required this.description})
      : _urls = urls;

  factory _$_PlaceDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDTOFromJson(json);

  @override
  final int id;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String name;
  final List<String> _urls;
  @override
  List<String> get urls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  final String placeType;
  @override
  final String description;

  @override
  String toString() {
    return 'PlaceDTO(id: $id, lat: $lat, lng: $lng, name: $name, urls: $urls, placeType: $placeType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            const DeepCollectionEquality().equals(other.placeType, placeType) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_urls),
      const DeepCollectionEquality().hash(placeType),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_PlaceDTOCopyWith<_$_PlaceDTO> get copyWith =>
      __$$_PlaceDTOCopyWithImpl<_$_PlaceDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDTOToJson(
      this,
    );
  }
}

abstract class _PlaceDTO implements PlaceDTO {
  const factory _PlaceDTO(
      {required final int id,
      required final double lat,
      required final double lng,
      required final String name,
      required final List<String> urls,
      required final String placeType,
      required final String description}) = _$_PlaceDTO;

  factory _PlaceDTO.fromJson(Map<String, dynamic> json) = _$_PlaceDTO.fromJson;

  @override
  int get id;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get name;
  @override
  List<String> get urls;
  @override
  String get placeType;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDTOCopyWith<_$_PlaceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
