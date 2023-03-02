import 'package:empat_app/bloc/events.dart';
import 'package:empat_app/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<Event, AppState> {
  AppBloc() : super(MainState()) {
    on<ChangeCollectionTypeEvent>(
      (event, emit) {
        emit(MainState(event.collectionType));
      },
    );
  }
}
