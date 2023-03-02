import 'package:empat_app/user.dart';

class Users {
  Users._() : map = {};
  static final _shared = Users._();
  factory Users.instance() => _shared;

  Map<String, User> map;

  List<User> get list => map.values.toList()
    ..sort(
      (a, b) => a.age.compareTo(b.age),
    );
  Set<User> get set => map.values.toSet();

  void fillWithDummyData() {
    final driver = User("Ross", "Green", 47);
    map = {
      "Plumber": User("John", "Genry", 52),
      "Fireman": User("Frank", "Geller", 31),
      "Policeman": User("George", "Buffey"),
      "Actor": User("Adam", "Something", 24),
      "Driver": driver,
      "Driver2": driver,
      "Swimmer": User("Hoyt", "Adamson", 29),
      "Magician": User("Gendalf", "Grey"),
    };
  }
}
