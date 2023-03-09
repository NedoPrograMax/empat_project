import 'package:empat_app/bloc/app_bloc.dart';
import 'package:empat_app/widgets/categories.dart';
import 'package:empat_app/widgets/chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: Column(
        children: const [
          Categories(),
          Expanded(child: Chats()),
        ],
      ),
    );
  }
}
