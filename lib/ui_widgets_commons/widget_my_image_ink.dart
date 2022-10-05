import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/ui_commons/enums.dart';

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
            (_, __) {
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

    switch (status) {
      case WidgetStatus.isEmpty:
        {
          return const ColoredBox(
            color: Colors.grey,
          );
        }
      case WidgetStatus.isLoading:
        {
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          );
        }
      case WidgetStatus.isError:
        {
          return const ColoredBox(
            color: Colors.grey,
          );
        }
      case WidgetStatus.isReady:
        {
          return Ink.image(
            image: _imageFromNetwork,
            fit: widget.fit,
          );
        }
    }
  }
}
