import 'package:flutter/material.dart';
import 'package:places/domain_entities/place.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';
import 'package:places/ui_widgets_commons/widget_my_image.dart';

/// Маленькая карточка места, например, для экрана поиска
class WidgetPlaceCartForSearch extends StatelessWidget {
  const WidgetPlaceCartForSearch({
    required this.place,
    required this.searchingText,
    Key? key,
  }) : super(key: key);

  final Place place;
  final String searchingText;

  /// Делаем так, чтобы искомый текст был выделен
  /// ТУТ ВОПРОС оптимизация производительности
  List<InlineSpan> _makeNameWithPartlyBoldText({
    required String searchingText,
    required String text,
    required BuildContext context,
  }) {
    final List<String> textParts = [];
    final List<bool> textPartsBoldeness = [];

    // разрезаем
    text.toLowerCase().splitMapJoin(
      searchingText.toLowerCase(),
      onMatch: (t) {
        textParts.add(searchingText);
        textPartsBoldeness.add(true);
        return '';
      },
      onNonMatch: (t) {
        textParts.add(t);
        textPartsBoldeness.add(false);
        return '';
      },
    );

    //мы потеряли информацию о регистре, восстанавливаем ее
    int _pointer = 0;
    for (var i = 0; i < textParts.length; i++) {
      textParts[i] = text.substring(_pointer, _pointer + textParts[i].length);
      _pointer = _pointer + textParts[i].length;
    }

    // делаем лист виджетов
    final List<InlineSpan> ___result = [];
    for (var i = 0; i < textParts.length; i++) {
      ___result.add(
        TextSpan(
          text: textParts[i],
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight:
                textPartsBoldeness[i] ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
    }
    return ___result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showModalBottomSheet<bool>(
              isScrollControlled: true,
              context: context,
              builder: (_) => createScreenPlaceDetails(
                context: context,
                placeId: place.id,
              ),
            );
          },
          leading: WidgetImageWithRoundedCorners(place: place),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: RichText(
                  text: TextSpan(
                    children: _makeNameWithPartlyBoldText(
                      text: place.name,
                      searchingText: searchingText,
                      context: context,
                    ),
                  ),
                ),
              ),
              Text(
                place.type,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class WidgetImageWithRoundedCorners extends StatelessWidget {
  const WidgetImageWithRoundedCorners({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: WidgetMyImage(
          url: place.urls.isNotEmpty ? place.urls[0] : '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
