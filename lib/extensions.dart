import 'package:empat_app/models/category.dart';
import 'package:empat_app/models/category_type.dart';
import 'package:empat_app/models/chat.dart';

extension ChatExtensions on List<Chat> {
  List<Category> getCategories() {
    const categotyTypes = CategoryType.values;

    final Map<CategoryType, int> countCategories = {
      for (var element in categotyTypes) element: 0
    };

    forEach((chat) {
      countCategories.update(chat.type, (value) => value + chat.countOfUnread);
      if (chat.countOfUnread > 0) {
        countCategories.update(
            CategoryType.New, (value) => value + chat.countOfUnread);
      }
    });

    final List<Category> list = [];

    countCategories.forEach((key, value) {
      list.add(Category(type: key, countOfUnread: value));
    });

    return list;
  }

  List<Chat> getChatsWithType(CategoryType type) {
    if (type == CategoryType.All) return this;
    if (type == CategoryType.New) {
      return where((chat) => chat.countOfUnread > 0).toList();
    }
    return where((chat) => chat.type == type).toList();
  }

  void sortByTime() => sort(
        (a, b) {
          int aMinutes = a.time.hour * 60 + a.time.minute;
          int bMinutes = b.time.hour * 60 + b.time.minute;
          return bMinutes.compareTo(aMinutes);
        },
      );
}
