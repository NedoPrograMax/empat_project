import 'package:empat_app/constants.dart';
import 'package:empat_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drawerItems.length,
      itemBuilder: (context, index) => DrawerItem(
        icon: drawerItems[index].icon,
        name: drawerItems[index].name,
      ),
    );
  }
}
