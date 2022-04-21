import 'package:flutter/material.dart';
import 'package:places/main.dart';

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
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _imageFromNetwork = NetworkImage(widget.url);
    _imageFromNetwork.resolve(ImageConfiguration.empty).addListener(
          ImageStreamListener(
            (_, __) {
              //ТУТВОПРОС
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            onError: (_, __) {
              setState(() {
                _isError = true;
                _isLoading = false;
              });
            },
          ),
        );
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

    if (_isLoading) {
      return const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_isError) {
      return const Center(
        child: ColoredBox(
          color: Colors.red,
          child: Text('ошибка сети'),
        ),
      );
    }

    return Ink.image(
      image: _imageFromNetwork,
      fit: widget.fit,
    );
  }
}
