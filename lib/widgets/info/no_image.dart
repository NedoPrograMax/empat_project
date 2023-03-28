import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/student_provider.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<StudentProvider, Color>(
      selector: (p0, studProv) => studProv.student.color,
      shouldRebuild: (previous, next) => next != previous,
      builder: (context, choosedColor, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              choosedColor,
            ],
          ),
          borderRadius: BorderRadius.circular(70),
        ),
        child: const Center(
          child: Text(
            "Choose an image please",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
