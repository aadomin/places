import 'package:flutter/material.dart';
import 'package:places/main.dart';

/// Виджет-обертка для Ink
/// (нужен для того, чтобы в режиме отладки работал flutter for web:
/// подменяет url картинки моковой картинкой)
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
  var _imageFromNetwork = const NetworkImage('');
  bool _loaded = false;

  @override
  void initState() {
    _imageFromNetwork = NetworkImage(widget.url);
    super.initState();
    _imageFromNetwork
        .resolve(ImageConfiguration.empty)
        .addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          _loaded = true;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    // отладочный режим
    if (isDebugMockImagesInPlaceOfHttp) {
      return Ink.image(
        image: const AssetImage('res/images/mock.jpg'),
        fit: widget.fit,
      );
    }

    if (!_loaded) {
      return const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Ink.image(
      image: _imageFromNetwork,
      fit: widget.fit,
    );
  }
}