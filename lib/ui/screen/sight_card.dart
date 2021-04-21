import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../res/text_styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
                  style: styleH3,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 4, right: 16, left: 16),
                alignment: Alignment.topLeft,
                child: Text(
                  sight.details,
                  style: styleH6,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              sight.type,
              style: styleOfLabel,
            ),
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
