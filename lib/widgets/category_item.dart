import 'package:empat_app/models/category.dart';
import 'package:empat_app/widgets/unread_count.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    required this.isChosen,
    required this.onPressed,
    super.key,
  });

  final Category category;
  final bool isChosen;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isChosen ? Theme.of(context).hoverColor : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.type.name,
              style: TextStyle(
                color: isChosen ? Theme.of(context).hoverColor : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            UnreadCount(count: category.countOfUnread),
          ],
        ),
      ),
    );
  }
}
