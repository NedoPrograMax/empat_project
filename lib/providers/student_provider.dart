import 'package:empat_app/models/student.dart';
import 'package:flutter/material.dart';

class StudentProvider with ChangeNotifier {
  var student = Student();

  set color(Color value) {
    student.color = value;
    notifyListeners();
  }
}
