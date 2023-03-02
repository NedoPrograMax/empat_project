import 'package:empat_app/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
    this.trailing = "",
  }) : super(key: key);

  final User user;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.userData,
        style: TextStyle(
          fontSize: 28,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: user.isValid ? Colors.green : Colors.red,
        ),
      ),
      trailing: Text(trailing),
    );
  }
}
