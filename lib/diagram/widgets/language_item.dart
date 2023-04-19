import 'package:empat_app/diagram/extensions.dart';
import 'package:empat_app/diagram/models/language.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final Animation<Offset>? offset;
  final Animation<double>? height;
  final Language language;
  const LanguageItem({
    required this.language,
    required this.offset,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (offset != null && height != null) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SlideTransition(
          position: offset!,
          child: AnimatedBuilder(
            animation: height!,
            builder: (context, child) => Container(
              height: height!.value,
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    language.color,
                    language.color.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: child!,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(language.name),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 100,
        color: language.color,
        child: Text(language.name),
      );
    }
  }
}
