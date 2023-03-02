import 'package:empat_app/user.dart';

mixin Person {
  String fullNameFromParts(
    String firstName,
    String lastName,
  ) =>
      firstName.isEmpty ? "No name" : "$firstName $lastName";

  AddYears calculateAgeAfter(int age) {
    return (int years) => age + years;
  }
}
