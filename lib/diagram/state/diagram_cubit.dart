import 'package:empat_app/diagram/constants.dart';
import 'package:empat_app/diagram/extensions.dart';
import 'package:empat_app/diagram/models/language.dart';
import 'package:empat_app/diagram/state/diagram_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramCubit extends Cubit<DiagramCubitState> {
  int currentStep = 0;
  final AnimationController controller;
  List<Language> newLanguagesSorted = [];
  bool isAutomatic = true;
  bool isForward = true;

  DiagramCubit({
    required this.controller,
  }) : super(
          DiagramCubitState(
            languages: languages
                .map(
                  (language) =>
                      language.copyWithPercent(percentages[language.id]![0]),
                )
                .toList()
              ..sort(
                (a, b) => b.percent.compareTo(a.percent),
              ),
            year: 2030,
          ),
        ) {
    var lastStatus = AnimationStatus.completed;
    controller.addStatusListener((status) {
      if (lastStatus != AnimationStatus.dismissed &&
          status == AnimationStatus.completed) {
        emit(
          state.copyWith(
            languages: newLanguagesSorted,
            heights: isAutomatic ? state.heights : _createDummyHeights(),
          ),
        );
        controller.reset();

        currentStep = _getNextStep();

        if (isAutomatic) {
          doStep();
        }
      }

      lastStatus = status;
    });
  }

  void doStep() async {
    final newLanguages = state.languages.map((language) {
      final percent = percentages[language.id]![_getNextStep()];
      return language.copyWithPercent(percent);
    }).toList();
    newLanguagesSorted = [...newLanguages]..sort(
        (a, b) => b.percent.compareTo(a.percent),
      );

    final List<Animation<Offset>> offsets = [];
    final Map<int, Animation<double>> heights = {};

    for (int i = 0; i < state.languages.length; i++) {
      final newId = newLanguagesSorted
          .indexWhere((element) => element.id == state.languages[i].id);
      final difference = newId - i;
      offsets.add(
        Tween(
          begin: Offset.zero,
          end: Offset(difference.toDouble(), 0),
        ).animate(controller),
      );
      final animation = Tween(
        begin: state.languages[i].percent.toPixels(),
        end: newLanguages[i].percent.toPixels(),
      ).animate(controller);

      heights.putIfAbsent(newLanguagesSorted[newId].id, () => animation);
    }

    emit(
      state.copyWith(
        languages: newLanguages,
        offsets: offsets,
        heights: heights,
        year: 2030 + currentStep + 1,
      ),
    );
    controller.forward();
  }

  int _getNextStep() {
    if (isAutomatic || isForward) {
      if (currentStep == percentages[1]!.length - 1) {
        return 0;
      }
      return currentStep + 1;
    } else {
      if (currentStep == 0) {
        return percentages[1]!.length - 1;
      }
      return currentStep - 1;
    }
  }

  void nextYear() {
    controller.reset();
    isAutomatic = false;
    isForward = true;
    doStep();
  }

  void previousYear() {
    controller.reset();
    isAutomatic = false;
    isForward = false;
    doStep();
  }

  void automate() {
    controller.reset();
    isAutomatic = true;
    isForward = true;
    doStep();
  }

  Map<int, Animation<double>> _createDummyHeights() {
    final Map<int, Animation<double>> heights = {};

    for (int i = 0; i < newLanguagesSorted.length; i++) {
      final animation = Tween(
        begin: newLanguagesSorted[i].percent.toPixels(),
        end: newLanguagesSorted[i].percent.toPixels(),
      ).animate(controller);

      heights.putIfAbsent(newLanguagesSorted[i].id, () => animation);
    }
    return heights;
  }
}
