import 'package:empat_app/constants.dart';
import 'package:empat_app/providers/data_source.dart';
import 'package:empat_app/widgets/main/main_drawer.dart';
import 'package:empat_app/widgets/main/theme_swticher_fab.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  var _currentIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabItems.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empat App"),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _tabController.animateTo(value);
          });
        },
      ),
      drawer: const MainDrawer(),
      floatingActionButton: ThemeSwitcherFAB(),
    );
  }
}
