import 'package:empat_app/person.dart';

class User with Person {
  String firstName;
  String lastName;
  int age;
  bool isValid;

  User(
    this.firstName,
    this.lastName, [
    this.age = 0,
  ]) : isValid = true;

  get _fullName => fullNameFromParts(
        firstName,
        lastName,
      );

  String get userData {
    try {
      assert(age > 0);
      String? data;
      data ??= "$_fullName. ${addYears()(5)} years old.";
      return data;
    } catch (e) {
      isValid = false;
      return "Invalid data";
    }
  }

  AddYears addYears() => calculateAgeAfter(age);
}

typedef AddYears = int Function(int);
