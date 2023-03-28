import 'package:empat_app/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle(this.color, this.isChosen, {super.key});
  final Color color;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<StudentProvider>().color = color,
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: isChosen
              ? Border.all(
                  width: 2,
                  color: Colors.grey.shade600,
                )
              : null,
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
