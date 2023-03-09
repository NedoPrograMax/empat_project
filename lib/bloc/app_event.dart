import 'package:empat_app/models/category_type.dart';

abstract class AppEvent {}

class EventChooseCategoty extends AppEvent {
  final CategoryType type;

  EventChooseCategoty(this.type);
}
