import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

const cloudWidth = 150.0;

class Sky extends StatelessWidget {
  final StreamController<double> streamController;
  const Sky({required this.streamController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: StreamBuilder(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  final factor = (snapshot.data ?? 0);
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withAlpha((255 * factor).toInt()),
                          blurRadius: 100,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/images/sun.svg",
                      height: 100,
                      colorFilter: ColorFilter.mode(
                          Colors.amber.withAlpha((255 * factor).toInt()),
                          BlendMode.srcIn),
                    ),
                  );
                }),
          ),
          Positioned(
            right: -3,
            top: -20,
            child: Draggable(
              childWhenDragging: Container(),
              onDragUpdate: (details) {
                streamController.sink
                    .add(1 - details.globalPosition.dx / width);
              },
              onDragEnd: (details) {
                streamController.sink.add(0);
              },
              feedback: SvgPicture.asset(
                "assets/images/cloud.svg",
                height: 150,
                width: cloudWidth,
              ),
              axis: Axis.horizontal,
              child: SvgPicture.asset(
                "assets/images/cloud.svg",
                height: 150,
                width: cloudWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
