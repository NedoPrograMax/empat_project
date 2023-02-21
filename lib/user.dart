class User {
  String _firstName;
  String _lastName;

  User()
      : _firstName = "",
        _lastName = "";

  get fullName => "$_firstName  $_lastName";

  set name(String name) {
    final nameDivided = name.split(' ');

    _firstName = nameDivided[0];

    _lastName = nameDivided[1];
  }
}
