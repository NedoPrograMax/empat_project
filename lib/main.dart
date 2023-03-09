import 'package:empat_app/constants.dart';
import 'package:empat_app/widgets/main_drawer.dart';
import 'package:empat_app/widgets/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mainColor,
        appBarTheme: AppBarTheme(color: mainColor),
        drawerTheme: DrawerThemeData(backgroundColor: mainColor),
        hoverColor: subMainColor,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Empat App"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search, size: 26),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: const MainScreen(),
        floatingActionButton: FloatingActionButton(
          elevation: 20,
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(88, 163, 229, 1),
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
