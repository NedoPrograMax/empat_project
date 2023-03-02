import 'package:empat_app/widgets/user_item.dart';
import 'package:empat_app/users.dart';
import 'package:flutter/cupertino.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Users.instance().list;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => UserItem(
        user: list[index],
      ),
    );
  }
}
