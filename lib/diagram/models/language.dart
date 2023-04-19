import 'package:flutter/material.dart';

class Language {
  final String name;

  final int percent;
  final int id;
  final Color color;

  Language({
    required this.name,
    required this.id,
    required this.color,
    this.percent = 0,
  });

  Language copyWithPercent(int percent) => Language(
        name: name,
        id: id,
        percent: percent,
        color: color,
      );
}
