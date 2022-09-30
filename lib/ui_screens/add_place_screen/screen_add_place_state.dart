import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_add_place_state.freezed.dart';
part 'screen_add_place_state.g.dart';

// flutter pub run build_runner build

@freezed
class ScreenAddPlaceState with _$ScreenAddPlaceState {
  const factory ScreenAddPlaceState({
    required String currentlySelectedCategory,
    required List<String> listOfPhotos,
    required bool isButtonSaveActive,
  }) = _ScreenAddPlaceState;

  factory ScreenAddPlaceState.fromJson(Map<String, Object?> json) =>
      _$ScreenAddPlaceStateFromJson(json);
}
