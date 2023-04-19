import 'package:empat_app/diagram/models/language.dart';
import 'package:flutter/material.dart';

class DiagramCubitState {
  final List<Language> languages;
  final List<Animation<Offset>>? offsets;
  final Map<int, Animation<double>>? heights;
  final int year;

  const DiagramCubitState({
    required this.languages,
    required this.year,
    this.heights,
    this.offsets,
  });

  DiagramCubitState copyWith({
    List<Language>? languages,
    List<Animation<Offset>>? offsets,
    Map<int, Animation<double>>? heights,
    int? year,
  }) =>
      DiagramCubitState(
        languages: languages ?? this.languages,
        offsets: offsets ?? this.offsets,
        heights: heights ?? this.heights,
        year: year ?? this.year,
      );
}
