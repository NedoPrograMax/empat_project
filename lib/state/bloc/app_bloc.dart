import 'package:empat_app/models/dtos/weather_dto.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:empat_app/state/bloc/app_events.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:empat_app/core/exceptions.dart';
import 'package:empat_app/services/api.dart';

import '../../models/weather.dart';

class AppBloc extends HydratedBloc<AppEvents, AppState> {
  AppBloc() : super(MainState()) {
    on<LoadCity>((event, emit) async {
      final previousWeather = (state as MainState).weather;
      emit(
        MainState(
          isLoading: true,
          weather: previousWeather,
          degreeType: state.degreeType,
        ),
      );
      await Api.loadCity(event.city)
          .then(
        (weather) => emit(
          MainState(
            weather: weather,
            degreeType: state.degreeType,
          ),
        ),
      )
          .catchError((error) {
        if (error is MyException) {
          emit(
            MainState(
              errorMessage: error.message,
              weather: previousWeather,
              degreeType: state.degreeType,
            ),
          );
        } else {
          emit(
            MainState(
              errorMessage: error.toString(),
              weather: previousWeather,
              degreeType: state.degreeType,
            ),
          );
        }
      });
    });
    on<LoadWithLocation>((event, emit) async {
      final previousWeather = (state as MainState).weather;
      emit(
        MainState(
          isLoading: true,
          weather: previousWeather,
          degreeType: state.degreeType,
        ),
      );
      await Api.loadWithLocation()
          .then(
        (weather) => emit(
          MainState(
            weather: weather,
            degreeType: state.degreeType,
          ),
        ),
      )
          .catchError((error) {
        if (error is MyException) {
          emit(
            MainState(
              errorMessage: error.message,
              weather: previousWeather,
              degreeType: state.degreeType,
            ),
          );
        } else {
          emit(
            MainState(
              errorMessage: error.toString(),
              weather: previousWeather,
              degreeType: state.degreeType,
            ),
          );
        }
      });
    });

    on<Clear>(
      (event, emit) => emit(
        MainState(
          weather: (state as MainState).weather,
          degreeType: state.degreeType,
        ),
      ),
    );
    on<ChangeDegreeType>(
      (event, emit) => emit(
        MainState(
          weather: (state as MainState).weather,
          degreeType: event.type,
        ),
      ),
    );
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      final weather = Weather.fromJson(json);
      return MainState(weather: weather);
    } catch (_) {
      return MainState();
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) =>
      (state as MainState).weather?.toJson();
}
