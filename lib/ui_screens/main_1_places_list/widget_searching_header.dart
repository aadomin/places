import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Поле с поиском
class WidgetSearchingHeader extends StatelessWidget {
  const WidgetSearchingHeader({
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
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: TextField(
                focusNode: focusNode1,
                readOnly: true,
                onTap: () {
                  focusNode1.unfocus();
                  Navigator.pushNamed(context, ROUTE_SEARCH);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, size: 15),
                  hintText: UiStrings.searching,
                  contentPadding: const EdgeInsets.only(
                      top: 15, bottom: 10, left: 10, right: 10),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Theme.of(context).disabledColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 3),
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  focusNode1.unfocus();
                  Navigator.pushNamed(context, ROUTE_FILTER);
                },
                icon: Icon(
                  Icons.settings,
                  size: 15,
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
