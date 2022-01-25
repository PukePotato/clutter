import 'package:clutter/env/endpoints.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imagePath;
  final BoxFit boxFit;
  final double? width;
  final double? height;

  ImageLoader({required this.imagePath, this.boxFit = BoxFit.fitWidth, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return imagePath.isNotEmpty
        ? Image.network(
            Endpoints.posterEndpoint + imagePath,
            fit: boxFit,
          )
        : IgnorePointer();
  }
}
