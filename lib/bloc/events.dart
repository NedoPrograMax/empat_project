import 'package:empat_app/enums.dart';

abstract class Event {}

class ChangeCollectionTypeEvent extends Event {
  final CollectionType collectionType;
  ChangeCollectionTypeEvent(this.collectionType);
}
