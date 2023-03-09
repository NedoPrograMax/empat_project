import 'package:empat_app/widgets/drawer_header.dart' as myHeader;
import 'package:empat_app/widgets/drawer_items.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: myHeader.DrawerHeader(),
          ),
          Expanded(
            flex: 3,
            child: DrawerItems(),
          ),
        ],
      ),
    );
  }
}
