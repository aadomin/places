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
            TextField(
              focusNode: focusNode1,
              readOnly: true,
              onTap: () {
                focusNode1.unfocus();
                Navigator.pushNamed(context, ROUTE_SEARCH);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, size: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: UiStrings.searching,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
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
