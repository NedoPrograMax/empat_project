import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final EdgeInsets? margin;
  final ImageProvider? imageProvider;
  const SquareImage(
    this.imageUrl,
    this.size, {
    this.margin,
    this.imageProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider ?? NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
