import 'package:flutter/material.dart';

///
/// Иконка для очистки текстового поля - распологается внутри него,
/// видима если в поле не ''
///
class WidgetTextFieldClearButton extends StatelessWidget {
  const WidgetTextFieldClearButton({
    required this.textController,
    required this.fieldHasFocus,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final bool fieldHasFocus;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (textController.text != '') && fieldHasFocus,
      child: InkWell(
        onTap: () {
          textController.clear();
        },
        child: UnconstrainedBox(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: SizedBox(
              width: 20,
              height: 20,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.close,
                  size: 14,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
