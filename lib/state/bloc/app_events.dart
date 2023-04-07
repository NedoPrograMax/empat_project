import 'package:empat_app/models/enums/degree_types.dart';

abstract class AppEvents {
  const AppEvents();
}

class LoadCity extends AppEvents {
  final String city;
  const LoadCity(this.city);
}

class LoadWithLocation extends AppEvents {
  const LoadWithLocation();
}

class Clear extends AppEvents {
  const Clear();
}

class ChangeDegreeType extends AppEvents {
  final DegreeTypes type;
  const ChangeDegreeType(this.type);
}
