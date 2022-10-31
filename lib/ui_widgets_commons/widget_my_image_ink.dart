import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';

///
/// ТУТВОПРОС серьезный
///
/// Виджет-обертка для Ink (Image для работы ribble effect'a)
/// (нужен для того, чтобы в режиме отладки работал flutter for web:
/// подменяет url картинки моковой картинкой)
///
class WidgetMyImageInk extends StatefulWidget {
  const WidgetMyImageInk({
    required this.url,
    required this.fit,
    Key? key,
  }) : super(key: key);

  final String url;
  final BoxFit fit;

  @override
  State<WidgetMyImageInk> createState() => _WidgetMyImageInkState();
}

class _WidgetMyImageInkState extends State<WidgetMyImageInk> {
  late NetworkImage _imageFromNetwork;

  WidgetStatus status = WidgetStatus.isLoading;

  @override
  void initState() {
    super.initState();
    _imageFromNetwork = NetworkImage(widget.url);
    _imageFromNetwork.resolve(ImageConfiguration.empty).addListener(
          ImageStreamListener(
            (_, __) async {
              // // TODO(me): удалить, искуственная пауза
              // await Future.delayed(const Duration(seconds: 1));

              // ВАЖНО
              if (mounted) {
                setState(() {
                  status = WidgetStatus.isReady;
                });
              }
            },
            onError: (_, __) {
              setState(() {
                status = WidgetStatus.isError;
              });
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // отладочный режим
    if (isDebugModeForImages) {
      return Ink.image(
        image: const AssetImage('res/images/mock.jpg'),
        fit: widget.fit,
      );
    }

    return Material(
      child: AnimatedCrossFade(
        crossFadeState: (status == WidgetStatus.isLoading) ||
                (status == WidgetStatus.isError)
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(seconds: 1),
        //
        // Image
        //
        firstChild: Ink.image(
          image: _imageFromNetwork,
          fit: widget.fit,
        ),
        //
        // Placeholder
        //
        secondChild: ColoredBox(
          color: Theme.of(context).colorScheme.sightImagePlaceholder,
          child: Center(
            child: Image.asset(
              UiImagePaths.placePlaceholder,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
