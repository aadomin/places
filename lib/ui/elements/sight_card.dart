import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../../common.dart';
import '../../routes.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final Function onTap;
  final SightCardType placeCardType;
  final Key key;

  SightCard(
    this.sight, {
    this.key,
    this.placeCardType = SightCardType.general,
    this.onTap,
  });

  Widget _cardIcons() {
    switch (placeCardType) {
      case SightCardType.general:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.favorite_outline, color: Colors.white),
                onTap: () {
                  print('General, like');
                },
              ),
            ),
          ],
        );
      case SightCardType.wished:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.calendar_today, color: Colors.white),
                onTap: () {
                  print('Wish, calendar');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.close, color: Colors.white),
                onTap: onTap,
              ),
            ),
          ],
        );
      case SightCardType.seen:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.share, color: Colors.white),
                onTap: () {
                  print('Seen, share');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.close, color: Colors.white),
                onTap: onTap,
              ),
            ),
          ],
        );
    }
    return Text('ошибка');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, ROUTE_DETAILS);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      sight.url,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    sight.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4, right: 16, left: 16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    sight.details,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              ],
            ),
            //
            // Type of place on the top of card
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                sight.type,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              width: double.infinity,
            ),
            //
            // Icons on the top of card
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(16),
              child: _cardIcons(),
            ),
          ],
        ),
      ),
    );
  }
}
