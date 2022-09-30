import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Диалог "Добавить фото"
class DialogAddPhoto extends StatelessWidget {
  const DialogAddPhoto({
    required this.onTakePhoto,
    required this.onSelectFile,
    required this.onSelectImage,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTakePhoto;
  final VoidCallback onSelectImage;
  final VoidCallback onSelectFile;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: onTakePhoto,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    UiImagePaths.iconTakePhoto,
                    width: 22,
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
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
          onPressed: onSelectImage,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    UiImagePaths.iconSelectImage,
                    width: 24,
                    height: 24,
                    color: Theme.of(context).colorScheme.secondary,
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
          onPressed: onSelectFile,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    UiImagePaths.iconSelectFile,
                    width: 18,
                    height: 20,
                    color: Theme.of(context).colorScheme.secondary,
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
        onPressed: onCancel,
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
