import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:empat_app/constants.dart';
import 'package:empat_app/core/routes.dart';
import 'package:empat_app/providers/which_movie.dart';

import 'package:empat_app/widgets/home/home_screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/data_source.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
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
    return ThemeProvider(
      duration: const Duration(milliseconds: 500),
      initTheme: ThemeData.dark(),
      builder: (p0, theme) => Builder(builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DataSource()),
            Provider(create: (_) => WhichMovie()),
          ],
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ThemeSwitchingArea(
              child: MaterialApp(
                theme: theme,
                initialRoute: RouteGenerator.mainScreen,
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        );
      }),
    );
  }
}
