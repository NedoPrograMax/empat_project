import 'package:empat_app/widgets/main/current/wind_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WindDialog extends StatelessWidget {
  final int degree;
  const WindDialog(this.degree, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(100),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WindDirection(degree, size: 100),
            SizedBox(height: 10),
            Text("Wind direction"),
          ],
        ),
      ),
    );
  }
}
