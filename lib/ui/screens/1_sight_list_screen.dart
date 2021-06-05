import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/models/my_places_model.dart';
import '../elements/sight_card.dart';
import '../../mocks.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  FocusNode focusNode1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        title: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            width: 290,
            height: 90,
            padding: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: 'Список интересных мест',
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                focusNode: focusNode1,
                readOnly: true,
                onTap: () {
                  focusNode1.unfocus();
                  Navigator.pushNamed(context, '/filter');
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 15),
                  suffixIcon: IconButton(
                      onPressed: () {
                        focusNode1.unfocus();
                        Navigator.pushNamed(context, '/filter');
                      },
                      icon: Icon(Icons.settings, size: 15)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Поиск',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                ),
              ),
            ),
            Column(
              children: [
                for (var i = 0; i < mocks.length; i++)
                  SightCard(context.watch<MyPlacesModel>().interestingPlaces[i], cartType: 'general'),
              ],
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
