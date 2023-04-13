import 'package:empat_app/core/constants.dart';
import 'package:flutter/material.dart';

class TabIndicator extends StatelessWidget {
  final bool isActive;
  const TabIndicator(this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Icon(
        size: 6,
        Icons.circle,
        color: isActive ? accentColor : Colors.grey,
      ),
    );
  }
}
