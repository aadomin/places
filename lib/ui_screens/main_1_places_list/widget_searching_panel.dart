import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Поле с поиском
///
class WidgetSearchingPanel extends StatelessWidget {
  const WidgetSearchingPanel({
    required this.focusNode1,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode1;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            //
            // Поле поиска
            //
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: TextField(
                focusNode: focusNode1,
                readOnly: true,
                onTap: () {
                  focusNode1.unfocus();
                  Navigator.pushNamed(context, appRouteSearch);
                },
                decoration: InputDecoration(
                  hintText: UiStrings.searching,
                  contentPadding: const EdgeInsets.only(
                      top: 15, bottom: 10, left: 10, right: 10),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Theme.of(context).disabledColor,
                  //
                  // Значок Поиск
                  //
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(9),
                    child: SvgPicture.asset(
                      UiImagePaths.search,
                      width: 18,
                      height: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
            //
            // Значек фильтр
            //
            Container(
              padding: const EdgeInsets.only(top: 3),
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  focusNode1.unfocus();
                  Navigator.pushNamed(context, appRouteFilter);
                },
                icon: SvgPicture.asset(
                  UiImagePaths.filter,
                  width: 20,
                  height: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
