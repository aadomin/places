// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_post_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePostAPI _$PlacePostAPIFromJson(Map<String, dynamic> json) {
  return _PlacePostAPI.fromJson(json);
}

/// @nodoc
mixin _$PlacePostAPI {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get placeType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePostAPICopyWith<PlacePostAPI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePostAPICopyWith<$Res> {
  factory $PlacePostAPICopyWith(
          PlacePostAPI value, $Res Function(PlacePostAPI) then) =
      _$PlacePostAPICopyWithImpl<$Res>;
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
class _$PlacePostAPICopyWithImpl<$Res> implements $PlacePostAPICopyWith<$Res> {
  _$PlacePostAPICopyWithImpl(this._value, this._then);

  final PlacePostAPI _value;
  // ignore: unused_field
  final $Res Function(PlacePostAPI) _then;

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
abstract class _$$_PlacePostAPICopyWith<$Res>
    implements $PlacePostAPICopyWith<$Res> {
  factory _$$_PlacePostAPICopyWith(
          _$_PlacePostAPI value, $Res Function(_$_PlacePostAPI) then) =
      __$$_PlacePostAPICopyWithImpl<$Res>;
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
class __$$_PlacePostAPICopyWithImpl<$Res>
    extends _$PlacePostAPICopyWithImpl<$Res>
    implements _$$_PlacePostAPICopyWith<$Res> {
  __$$_PlacePostAPICopyWithImpl(
      _$_PlacePostAPI _value, $Res Function(_$_PlacePostAPI) _then)
      : super(_value, (v) => _then(v as _$_PlacePostAPI));

  @override
  _$_PlacePostAPI get _value => super._value as _$_PlacePostAPI;

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
    return _then(_$_PlacePostAPI(
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
class _$_PlacePostAPI implements _PlacePostAPI {
  const _$_PlacePostAPI(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name,
      required final List<String> urls,
      required this.placeType,
      required this.description})
      : _urls = urls;

  factory _$_PlacePostAPI.fromJson(Map<String, dynamic> json) =>
      _$$_PlacePostAPIFromJson(json);

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
    return 'PlacePostAPI(id: $id, lat: $lat, lng: $lng, name: $name, urls: $urls, placeType: $placeType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacePostAPI &&
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
  _$$_PlacePostAPICopyWith<_$_PlacePostAPI> get copyWith =>
      __$$_PlacePostAPICopyWithImpl<_$_PlacePostAPI>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacePostAPIToJson(
      this,
    );
  }
}

abstract class _PlacePostAPI implements PlacePostAPI {
  const factory _PlacePostAPI(
      {required final int id,
      required final double lat,
      required final double lng,
      required final String name,
      required final List<String> urls,
      required final String placeType,
      required final String description}) = _$_PlacePostAPI;

  factory _PlacePostAPI.fromJson(Map<String, dynamic> json) =
      _$_PlacePostAPI.fromJson;

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
  _$$_PlacePostAPICopyWith<_$_PlacePostAPI> get copyWith =>
      throw _privateConstructorUsedError;
}
