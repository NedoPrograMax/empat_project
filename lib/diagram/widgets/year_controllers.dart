import 'package:empat_app/diagram/state/diagram_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YearControllers extends StatelessWidget {
  const YearControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => context.read<DiagramCubit>().previousYear(),
          icon: const Icon(
            Icons.skip_previous,
            size: 60,
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () => context.read<DiagramCubit>().automate(),
          icon: const Icon(
            Icons.auto_mode,
            size: 60,
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () => context.read<DiagramCubit>().nextYear(),
          icon: const Icon(
            Icons.skip_next,
            size: 60,
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
