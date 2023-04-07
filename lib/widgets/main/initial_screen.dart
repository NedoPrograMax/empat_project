import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/bloc/app_bloc.dart';
import '../../state/bloc/app_state.dart';
import '../dialogs/multi_dialog.dart';
import 'main_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        if (state is MainState) {
          if (state.weather != null) {
            return MainScreen(weather: state.weather!);
          }
        }
        return Container();
      },
      buildWhen: (previous, current) {
        final areChanges =
            (previous as MainState).weather != (current as MainState).weather;
        return areChanges;
      },
      listener: (context, state) async {
        if (state.errorMessage != null) {
          await showDialog(
            context: context,
            builder: (context) => const MultiDialog(),
          );
        }
        if (state.errorMessage == null && !state.isLoading) {
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
        }
      },
    );
  }
}
