import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(theme: Colors.white));

  /// constantly switch the theme after pressing button
  void themeSwitching() {
    if (state.theme == Colors.white) {
      emit(ThemeState(theme: Colors.black));
    } else if (state.theme == Colors.black) {
      emit(ThemeState(theme: Colors.blue));
    } else if (state.theme == Colors.blue) {
      emit(ThemeState(theme: Colors.green));
    } else if (state.theme == Colors.green) {
      emit(ThemeState(theme: Colors.red));
    } else {
      emit(ThemeState(theme: Colors.white));
    }
  }
}
