import 'package:flutter/material.dart';
import 'package:places/ui_my_app/routes.dart';
import 'package:places/ui_my_app/ui_strings.dart';

class WidgetSearchingHeader extends StatelessWidget {
  const WidgetSearchingHeader({
    Key? key,
    required this.focusNode1,
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
            Align(
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
