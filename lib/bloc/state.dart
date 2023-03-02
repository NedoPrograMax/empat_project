import 'package:empat_app/enums.dart';

abstract class AppState {}

class MainState extends AppState {
  final CollectionType collectionType;
  MainState([
    this.collectionType = CollectionType.list,
  ]);
}
