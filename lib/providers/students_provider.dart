import 'package:empat_app/core/constants.dart';
import 'package:empat_app/models/student.dart';
import 'package:flutter/material.dart';

class StudentsProvider with ChangeNotifier {
  final _students = constStudents;

  List<Student> get students => [..._students];

  void addStudent(Student student) {
    if (_students.any((element) => element.id == student.id)) {
      final index = _students.indexWhere((element) => element.id == student.id);
      _students[index] = student;
    } else {
      _students.add(student);
    }
    notifyListeners();
  }
}
