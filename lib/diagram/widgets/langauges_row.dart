import 'package:empat_app/diagram/state/diagram_cubit.dart';
import 'package:empat_app/diagram/state/diagram_cubit_state.dart';
import 'package:empat_app/diagram/widgets/language_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesRow extends StatelessWidget {
  const LanguagesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagramCubit, DiagramCubitState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.year.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.languages.length,
                itemBuilder: (context, index) => LanguageItem(
                  key: ValueKey(state.languages[index].id),
                  language: state.languages[index],
                  offset: state.offsets?[index],
                  height: state.heights?[state.languages[index].id],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
