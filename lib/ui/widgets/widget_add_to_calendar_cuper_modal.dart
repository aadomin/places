import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCalendarCuperModal extends StatefulWidget {
  const AddToCalendarCuperModal({Key? key}) : super(key: key);

  @override
  _AddToCalendarCuperModalState createState() =>
      _AddToCalendarCuperModalState();
}

class _AddToCalendarCuperModalState extends State<AddToCalendarCuperModal> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).canvasColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (selected) {
                    setState(() {
                      _date = selected;
                    });
                  },
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop(_date);
                },
                child: const Text('Готово'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
