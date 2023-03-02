import 'package:empat_app/widgets/user_item.dart';
import 'package:empat_app/users.dart';
import 'package:flutter/cupertino.dart';

class UsersMap extends StatelessWidget {
  const UsersMap({super.key});

  @override
  Widget build(BuildContext context) {
    final map = Users.instance().map;
    return ListView.builder(
      itemCount: map.length,
      itemBuilder: (context, index) => UserItem(
        user: map.values.elementAt(index),
        trailing: map.keys.elementAt(index),
      ),
    );
  }
}
