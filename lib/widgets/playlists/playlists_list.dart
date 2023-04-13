import 'package:empat_app/state/app_cubit/app_cubit.dart';
import 'package:empat_app/state/app_cubit/app_cubit_state.dart';
import 'package:empat_app/widgets/playlists/playlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaylistsList extends StatelessWidget {
  const PlaylistsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
      builder: (context, state) {
        return Expanded(
          flex: 25,
          child: ListView.builder(
            itemCount: state.playlists.length,
            itemBuilder: (context, index) => PlaylistItem(
              state.playlists[index],
            ),
          ),
        );
      },
    );
  }
}
