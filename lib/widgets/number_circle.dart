import 'package:flutter/material.dart';

class NumberCircle extends StatelessWidget {
  final int number;
  const NumberCircle(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return number == 0
        ? Container()
        : Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(child: Text(number.toString())),
            ),
          );
  }
}
