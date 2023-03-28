import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'my_painter.dart';

class CustomAppBar extends HookWidget implements PreferredSizeWidget {
  final Size size;
  const CustomAppBar({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    );
    controller.repeat(reverse: true);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => CustomPaint(
        foregroundPainter: AppBarPainter(
          Theme.of(context).primaryColor,
          controller.value,
        ),
        child: AppBar(
          title: const Text("Empat App"),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => size;
}
