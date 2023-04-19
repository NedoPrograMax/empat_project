import 'dart:async';

import 'package:empat_app/plant/sky.dart';
import 'package:flutter/material.dart';

import 'ground.dart';

class PlantScreen extends StatelessWidget {
  PlantScreen({super.key});

  final StreamController<double> streamController =
      StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    final sky = Sky(streamController: streamController);
    final ground = Ground(skyStream: streamController.stream);

    final child = Column(
      children: [sky, ground],
    );

    return Scaffold(
      body: StreamBuilder<double>(
        stream: streamController.stream,
        builder: (context, snapshot) => AnimatedContainer(
          padding: const EdgeInsets.only(top: 50),
          duration: const Duration(milliseconds: 100),
          color: Colors.grey.shade800
              .withAlpha((255 * (1 - (snapshot.data ?? 0))).toInt()),
          child: child,
        ),
      ),
    );
  }
}
