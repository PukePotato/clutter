import 'package:clutter/ui_kit/clutter_images.dart';
import 'package:clutter/ui_kit/image_loader.dart';
import 'package:flutter/material.dart';

class ImageGridView extends StatelessWidget {
  final VoidCallback? onTapGridItem;
  final String imagePath;

  const ImageGridView(
      {Key? key, required this.onTapGridItem, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapGridItem,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: imagePath.isNotEmpty
                          ? ImageLoader(
                              imagePath: imagePath,
                              boxFit: BoxFit.fitHeight,
                              width: double.infinity,
                            )
                          : placeholderImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
