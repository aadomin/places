import 'package:flutter/material.dart';
import '../../domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      //height: 120,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                width: double.infinity,
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Text(
                  sight.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Text(
                  sight.details,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
          Container(
            //color: Colors.green,
            padding: EdgeInsets.all(16),
            child: Text(
              sight.type,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.topRight,
            //color: Colors.yellow,
            padding: EdgeInsets.all(16),
            child: Container(
              color: Colors.white,
              height: 10,
              width: 10,
            ),
          ),
        ],
      ),
    );
  }
}
