import 'package:flutter/material.dart';
import 'package:places/main.dart';

/// 
/// Виджет-обертка для Image
/// (нужен для того, чтобы в режиме отладки работал flutter for web:
/// подменяет url картинки моковой картинкой)
/// 
class WidgetMyImage extends StatelessWidget {
  const WidgetMyImage({
    required this.url,
    required this.fit,
    Key? key,
  }) : super(key: key);

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // отладочный режим
    if (isDebugModeForImages) {
      return Image.asset(
        'res/images/mock.jpg',
        fit: fit,
      );
    }

    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          ),
        );
      },
      errorBuilder: (context, object, stackTrace) {
        return Container(color: Colors.grey.shade400);
      },
    );
  }
}
