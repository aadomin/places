import 'package:flutter/material.dart';

bool isMocking = true;

/// Для отладки - для того, чтобы работал flutter for web подменяет
/// url картинки моковой картинкой
class MyImageWidget extends StatelessWidget {
  const MyImageWidget({
    required this.url,
    required this.fit,
    Key? key,
  }) : super(key: key);

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return isMocking
        ? Image.asset(
            'res/images/mock.jpg',
            fit: fit,
          )
        : Image.network(
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
          );
  }
}
