import 'package:flutter/material.dart';

class UnreadCount extends StatelessWidget {
  const UnreadCount({
    required this.count,
    super.key,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count > 0) {
      return CircleAvatar(
        radius: 10,
        backgroundColor: Color.fromARGB(172, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
