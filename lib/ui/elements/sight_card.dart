import 'package:flutter/material.dart';
import '../../domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final String cartType;

  SightCard(this.sight, {this.cartType = 'common'});

  Widget _cardIcons() {
    switch (cartType) {
      case 'general':
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
      case 'wish':
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
                onTap: () {
                  print('Wish, delete');
                },
              ),
            ),
          ],
        );
      case 'seen':
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
                onTap: () {
                  print('Wish, delete');
                },
              ),
            ),
          ],
        );
    }
    return Center(child: Text('Error'));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/details');
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
