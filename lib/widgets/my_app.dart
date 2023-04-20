import 'package:empat_app/core/constants.dart';
import 'package:empat_app/routes/routes_generator.dart';
import 'package:empat_app/state/app_cubit/app_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/search_cubit/search_cubit.dart';
import 'package:empat_app/widgets/playlists/playlist_types.dart';
import 'package:empat_app/widgets/playlists/playlists_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppCubit(),
        ),
        BlocProvider(
          create: (_) => PlaylistCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: backgroundColor,
          ),
        ),
        themeMode: ThemeMode.dark,
        home: const MainScreen(),
      ),
    );
  }
}
