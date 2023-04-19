import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ground extends HookWidget {
  final Stream<double> skyStream;
  const Ground({required this.skyStream, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final offset = useStream(skyStream).data ?? 0;
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: 107 - offset * 150,
            left: 0,
            right: 0,
            height: 150 * offset,
            child: SvgPicture.asset(
              "assets/images/flower.svg",
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: -20 - offset * 100,
            child: SvgPicture.asset(
              "assets/images/grass.svg",
              width: width,
              colorFilter: ColorFilter.mode(
                  Colors.green.withAlpha((255 * offset).toInt()),
                  BlendMode.srcIn),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/ground.jpg",
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
