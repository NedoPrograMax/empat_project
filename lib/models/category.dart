import 'package:empat_app/models/category_type.dart';

class Category {
  final CategoryType type;
  final int countOfUnread;

  Category({
    required this.type,
    required this.countOfUnread,
  });
}
