import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:places/ui_my_app/ui_image_paths.dart';
import 'package:places/ui_my_app/ui_strings.dart';

class DialogAddPhoto extends StatelessWidget {
  const DialogAddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    UiImagePaths.icon_take_photo,
                    width: 22,
                    height: 20,
                  ),
                ),
              ),
              Text(
                UiStrings.camera,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    UiImagePaths.icon_select_image,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Text(
                UiStrings.photo,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    UiImagePaths.icon_select_file,
                    width: 18,
                    height: 20,
                  ),
                ),
              ),
              Text(
                UiStrings.file,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          UiStrings.cancelCaps,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
