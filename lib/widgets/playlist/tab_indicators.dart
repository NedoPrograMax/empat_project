import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'tab_indicator.dart';

class TabsIndicators extends StatelessWidget {
  final int length;
  final int activeIndex;
  const TabsIndicators({
    required this.length,
    required this.activeIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: length,
          itemBuilder: (context, index) => TabIndicator(index == activeIndex),
        ),
      ),
    );
  }
}
