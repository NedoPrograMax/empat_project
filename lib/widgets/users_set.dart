import 'package:empat_app/widgets/user_item.dart';
import 'package:empat_app/users.dart';
import 'package:flutter/cupertino.dart';

class UsersSet extends StatelessWidget {
  const UsersSet({super.key});

  @override
  Widget build(BuildContext context) {
    final set = Users.instance().set;
    return ListView.builder(
      itemCount: set.length,
      itemBuilder: (context, index) => UserItem(
        user: set.elementAt(index),
      ),
    );
  }
}
