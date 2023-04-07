import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/utils.dart';

class WindDirection extends HookWidget {
  final int degree;
  final double? size;
  const WindDirection(this.degree, {this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final compas = useStream(FlutterCompass.events);

    if (compas.hasData && compas.data != null) {
      final rotationController = useAnimationController(
        lowerBound: -1.0,
        upperBound: 1.0,
        initialValue: getWind(degree, compas.data!.heading!),
      );
      rotationController.animateTo(
        getWind(degree, compas.data!.heading!),
        duration: const Duration(milliseconds: 300),
      );

      return RotationTransition(
        turns: rotationController,
        child: Icon(
          Icons.send,
          size: size,
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
