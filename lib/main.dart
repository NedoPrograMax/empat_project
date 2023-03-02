import 'package:empat_app/bloc/bloc.dart';
import 'package:empat_app/users.dart';
import 'package:empat_app/widgets/type_selector.dart';
import 'package:empat_app/widgets/users_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Users.instance().fillWithDummyData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Empat App"),
        ),
        body: const AppContent(),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Flexible(
            child: TypeSelector(),
            fit: FlexFit.loose,
            flex: 1,
          ),
          Expanded(
            child: UsersPresenter(),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
