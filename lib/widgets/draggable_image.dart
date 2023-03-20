import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'cached_image.dart';

class DraggableImage extends StatelessWidget {
  final String imageUrl;
  final String id;
  const DraggableImage(this.imageUrl, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: id,
      feedback: CachedImage(imageUrl),
      child: CachedImage(imageUrl),
    );
  }
}
