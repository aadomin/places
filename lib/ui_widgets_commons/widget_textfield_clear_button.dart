import 'package:flutter/material.dart';

///
/// Иконка для очистки текстового поля - распологается внутри него
///
class WidgetTextFieldClearButton extends StatelessWidget {
  const WidgetTextFieldClearButton({
    required this.textController,
    this.onTap,
    this.showOnlyItHasThatFocus,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final bool? showOnlyItHasThatFocus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final showBecauseOfFocusOrConstant = showOnlyItHasThatFocus ?? true;
    
    return Visibility(
      visible: (textController.text != '') && showBecauseOfFocusOrConstant,
      child: InkWell(
        onTap: () {
          textController.clear();
          onTap?.call();
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
