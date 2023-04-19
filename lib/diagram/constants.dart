import 'package:flutter/material.dart';

import 'models/language.dart';

const Map<int, List<int>> percentages = {
  1: [20, 26, 18],
  2: [12, 8, 17],
  3: [23, 12, 25],
  4: [14, 18, 6],
  5: [19, 24, 15],
  6: [10, 11, 4],
  7: [15, 20, 19],
  8: [19, 15, 17],
};

final List<Language> languages = [
  Language(
    name: "Dart",
    id: 1,
    color: Colors.blue,
  ),
  Language(
    name: "C++",
    id: 2,
    color: Colors.amber,
  ),
  Language(
    name: "Java",
    id: 3,
    color: Colors.red,
  ),
  Language(
    name: "Pascal",
    id: 4,
    color: Colors.grey,
  ),
  Language(
    name: "Ruby",
    id: 5,
    color: Colors.green,
  ),
  Language(
    name: "JS",
    id: 6,
    color: Colors.orange,
  ),
  Language(
    name: "Go",
    id: 7,
    color: Colors.brown,
  ),
  Language(
    name: "Kotlin",
    id: 8,
    color: Colors.indigo,
  ),
];

const Size languageItemSize = Size(80, 100);
