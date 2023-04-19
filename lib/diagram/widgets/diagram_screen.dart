import 'package:empat_app/diagram/widgets/year_controllers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../state/diagram_cubit.dart';
import 'langauges_row.dart';

class DiagramScreen extends HookWidget {
  const DiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 2000));
    return Scaffold(
      body: BlocProvider(
        create: (context) => DiagramCubit(controller: controller)..doStep(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(child: LanguagesRow()),
              Expanded(child: YearControllers()),
            ],
          ),
        ),
      ),
    );
  }
}
