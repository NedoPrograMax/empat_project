import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class Student {
  String firstName;
  String lastName;
  String university;
  int? yearOfStudying;
  ImageProvider? avatar;
  String id;
  Color color;

  Student({
    this.firstName = "",
    this.lastName = "",
    this.university = "",
    this.yearOfStudying,
    this.avatar,
    this.color = Colors.transparent,
  }) : id = const Uuid().v4();
}
