// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) {
  return _PlaceDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceDto {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get placeType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDtoCopyWith<PlaceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDtoCopyWith<$Res> {
  factory $PlaceDtoCopyWith(PlaceDto value, $Res Function(PlaceDto) then) =
      _$PlaceDtoCopyWithImpl<$Res>;
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
class _$PlaceDtoCopyWithImpl<$Res> implements $PlaceDtoCopyWith<$Res> {
  _$PlaceDtoCopyWithImpl(this._value, this._then);

  final PlaceDto _value;
  // ignore: unused_field
  final $Res Function(PlaceDto) _then;

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
abstract class _$$_PlaceDtoCopyWith<$Res> implements $PlaceDtoCopyWith<$Res> {
  factory _$$_PlaceDtoCopyWith(
          _$_PlaceDto value, $Res Function(_$_PlaceDto) then) =
      __$$_PlaceDtoCopyWithImpl<$Res>;
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
class __$$_PlaceDtoCopyWithImpl<$Res> extends _$PlaceDtoCopyWithImpl<$Res>
    implements _$$_PlaceDtoCopyWith<$Res> {
  __$$_PlaceDtoCopyWithImpl(
      _$_PlaceDto _value, $Res Function(_$_PlaceDto) _then)
      : super(_value, (v) => _then(v as _$_PlaceDto));

  @override
  _$_PlaceDto get _value => super._value as _$_PlaceDto;

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
    return _then(_$_PlaceDto(
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
class _$_PlaceDto implements _PlaceDto {
  const _$_PlaceDto(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name,
      required final List<String> urls,
      required this.placeType,
      required this.description})
      : _urls = urls;

  factory _$_PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDtoFromJson(json);

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
    return 'PlaceDto(id: $id, lat: $lat, lng: $lng, name: $name, urls: $urls, placeType: $placeType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDto &&
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
  _$$_PlaceDtoCopyWith<_$_PlaceDto> get copyWith =>
      __$$_PlaceDtoCopyWithImpl<_$_PlaceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDtoToJson(
      this,
    );
  }
}

abstract class _PlaceDto implements PlaceDto {
  const factory _PlaceDto(
      {required final int id,
      required final double lat,
      required final double lng,
      required final String name,
      required final List<String> urls,
      required final String placeType,
      required final String description}) = _$_PlaceDto;

  factory _PlaceDto.fromJson(Map<String, dynamic> json) = _$_PlaceDto.fromJson;

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
  _$$_PlaceDtoCopyWith<_$_PlaceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
