import 'package:empat_app/core/constants.dart';
import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/widgets/info/color_circle.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<StudentProvider, Color>(
      selector: (p0, studProv) => studProv.student.color,
      shouldRebuild: (previous, next) => next != previous,
      builder: (context, chosenColor, child) => SizedBox(
        height: 40,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => ColorCircle(
            colors[index],
            colors[index] == chosenColor,
          ),
        ),
      ),
    );
  }
}
