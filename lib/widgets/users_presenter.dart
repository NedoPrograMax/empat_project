import 'package:empat_app/bloc/bloc.dart';
import 'package:empat_app/bloc/state.dart';
import 'package:empat_app/widgets/users_list.dart';
import 'package:empat_app/widgets/users_map.dart';
import 'package:empat_app/widgets/users_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums.dart';

class UsersPresenter extends StatelessWidget {
  const UsersPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is MainState) {
          switch (state.collectionType) {
            case CollectionType.list:
              return const UsersList();

            case CollectionType.set:
              return const UsersSet();

            case CollectionType.map:
              return const UsersMap();
          }
        } else {
          return const Text("This shouldn't happen... I guess🤔");
        }
      },
    );
  }
}
