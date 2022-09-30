// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screen_add_place_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreenAddPlaceState _$ScreenAddPlaceStateFromJson(Map<String, dynamic> json) {
  return _ScreenAddPlaceState.fromJson(json);
}

/// @nodoc
mixin _$ScreenAddPlaceState {
  String get currentlySelectedCategory => throw _privateConstructorUsedError;
  List<String> get listOfPhotos => throw _privateConstructorUsedError;
  bool get isButtonSaveActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreenAddPlaceStateCopyWith<ScreenAddPlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenAddPlaceStateCopyWith<$Res> {
  factory $ScreenAddPlaceStateCopyWith(
          ScreenAddPlaceState value, $Res Function(ScreenAddPlaceState) then) =
      _$ScreenAddPlaceStateCopyWithImpl<$Res>;
  $Res call(
      {String currentlySelectedCategory,
      List<String> listOfPhotos,
      bool isButtonSaveActive});
}

/// @nodoc
class _$ScreenAddPlaceStateCopyWithImpl<$Res>
    implements $ScreenAddPlaceStateCopyWith<$Res> {
  _$ScreenAddPlaceStateCopyWithImpl(this._value, this._then);

  final ScreenAddPlaceState _value;
  // ignore: unused_field
  final $Res Function(ScreenAddPlaceState) _then;

  @override
  $Res call({
    Object? currentlySelectedCategory = freezed,
    Object? listOfPhotos = freezed,
    Object? isButtonSaveActive = freezed,
  }) {
    return _then(_value.copyWith(
      currentlySelectedCategory: currentlySelectedCategory == freezed
          ? _value.currentlySelectedCategory
          : currentlySelectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      listOfPhotos: listOfPhotos == freezed
          ? _value.listOfPhotos
          : listOfPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isButtonSaveActive: isButtonSaveActive == freezed
          ? _value.isButtonSaveActive
          : isButtonSaveActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreenAddPlaceStateCopyWith<$Res>
    implements $ScreenAddPlaceStateCopyWith<$Res> {
  factory _$$_ScreenAddPlaceStateCopyWith(_$_ScreenAddPlaceState value,
          $Res Function(_$_ScreenAddPlaceState) then) =
      __$$_ScreenAddPlaceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String currentlySelectedCategory,
      List<String> listOfPhotos,
      bool isButtonSaveActive});
}

/// @nodoc
class __$$_ScreenAddPlaceStateCopyWithImpl<$Res>
    extends _$ScreenAddPlaceStateCopyWithImpl<$Res>
    implements _$$_ScreenAddPlaceStateCopyWith<$Res> {
  __$$_ScreenAddPlaceStateCopyWithImpl(_$_ScreenAddPlaceState _value,
      $Res Function(_$_ScreenAddPlaceState) _then)
      : super(_value, (v) => _then(v as _$_ScreenAddPlaceState));

  @override
  _$_ScreenAddPlaceState get _value => super._value as _$_ScreenAddPlaceState;

  @override
  $Res call({
    Object? currentlySelectedCategory = freezed,
    Object? listOfPhotos = freezed,
    Object? isButtonSaveActive = freezed,
  }) {
    return _then(_$_ScreenAddPlaceState(
      currentlySelectedCategory: currentlySelectedCategory == freezed
          ? _value.currentlySelectedCategory
          : currentlySelectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      listOfPhotos: listOfPhotos == freezed
          ? _value._listOfPhotos
          : listOfPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isButtonSaveActive: isButtonSaveActive == freezed
          ? _value.isButtonSaveActive
          : isButtonSaveActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreenAddPlaceState implements _ScreenAddPlaceState {
  const _$_ScreenAddPlaceState(
      {required this.currentlySelectedCategory,
      required final List<String> listOfPhotos,
      required this.isButtonSaveActive})
      : _listOfPhotos = listOfPhotos;

  factory _$_ScreenAddPlaceState.fromJson(Map<String, dynamic> json) =>
      _$$_ScreenAddPlaceStateFromJson(json);

  @override
  final String currentlySelectedCategory;
  final List<String> _listOfPhotos;
  @override
  List<String> get listOfPhotos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfPhotos);
  }

  @override
  final bool isButtonSaveActive;

  @override
  String toString() {
    return 'ScreenAddPlaceState(currentlySelectedCategory: $currentlySelectedCategory, listOfPhotos: $listOfPhotos, isButtonSaveActive: $isButtonSaveActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreenAddPlaceState &&
            const DeepCollectionEquality().equals(
                other.currentlySelectedCategory, currentlySelectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._listOfPhotos, _listOfPhotos) &&
            const DeepCollectionEquality()
                .equals(other.isButtonSaveActive, isButtonSaveActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentlySelectedCategory),
      const DeepCollectionEquality().hash(_listOfPhotos),
      const DeepCollectionEquality().hash(isButtonSaveActive));

  @JsonKey(ignore: true)
  @override
  _$$_ScreenAddPlaceStateCopyWith<_$_ScreenAddPlaceState> get copyWith =>
      __$$_ScreenAddPlaceStateCopyWithImpl<_$_ScreenAddPlaceState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreenAddPlaceStateToJson(
      this,
    );
  }
}

abstract class _ScreenAddPlaceState implements ScreenAddPlaceState {
  const factory _ScreenAddPlaceState(
      {required final String currentlySelectedCategory,
      required final List<String> listOfPhotos,
      required final bool isButtonSaveActive}) = _$_ScreenAddPlaceState;

  factory _ScreenAddPlaceState.fromJson(Map<String, dynamic> json) =
      _$_ScreenAddPlaceState.fromJson;

  @override
  String get currentlySelectedCategory;
  @override
  List<String> get listOfPhotos;
  @override
  bool get isButtonSaveActive;
  @override
  @JsonKey(ignore: true)
  _$$_ScreenAddPlaceStateCopyWith<_$_ScreenAddPlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}
