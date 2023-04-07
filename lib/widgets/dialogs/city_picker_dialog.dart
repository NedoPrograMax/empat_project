import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_events.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CityPickerDialog extends HookWidget {
  const CityPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Enter city",
              ),
              textInputAction: TextInputAction.search,
              onEditingComplete: () =>
                  context.read<AppBloc>().add(LoadCity(textController.text)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => context
                      .read<AppBloc>()
                      .add(LoadCity(textController.text)),
                  child: const Text("Find city"),
                ),
                TextButton(
                  onPressed: () =>
                      context.read<AppBloc>().add(LoadWithLocation()),
                  child: const Text("Use current location"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
