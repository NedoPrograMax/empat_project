import 'package:empat_app/bloc/bloc.dart';
import 'package:empat_app/bloc/events.dart';
import 'package:empat_app/bloc/state.dart';
import 'package:empat_app/enums.dart';
import 'package:empat_app/widgets/selectable_type.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

typedef AddCollection = void Function(CollectionType);

class TypeSelector extends StatelessWidget {
  const TypeSelector({super.key});

  AddCollection addCollection(
    BuildContext context,
    List<Widget> list,
    MainState state,
  ) {
    void function(CollectionType collectionType) {
      list.add(
        SelectableType(
          borderColor: state.collectionType.colorIfEqual(collectionType),
          label: collectionType.name,
          onPressed: () => context.read<AppBloc>().add(
                ChangeCollectionTypeEvent(collectionType),
              ),
        ),
      );
    }

    return function;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is MainState) {
          final List<Widget> list = [];
          final addToList = addCollection(context, list, state);

          CollectionType.values.forEach(addToList);

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...list],
          );
        }
        return Container();
      },
    );
  }
}
