import 'package:flutter/material.dart';

enum CollectionType {
  list,
  set,
  map;

  Color colorIfEqual(CollectionType type) {
    if (type == this) {
      return Colors.amber;
    } else {
      return Colors.transparent;
    }
  }
}
