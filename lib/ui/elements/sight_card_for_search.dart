import 'package:flutter/material.dart';
import '../../domain/sight.dart';

class SightCartForSearch extends StatelessWidget {
  final Sight sight;

  SightCartForSearch(this.sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/details');
          },
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.network(
                sight.url,
                fit: BoxFit.cover,
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  sight.name,
                  maxLines: 2,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                sight.type,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
