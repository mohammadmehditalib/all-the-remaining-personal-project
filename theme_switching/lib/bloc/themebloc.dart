import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switching/bloc/themebloc_state.dart';

import 'themebloc_events.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeBlocState> {
  ThemeBloc() : super(ThemeBlocState(theme: Colors.white)) {
    on<ChangeTheme>((event, emit) {
      if (state.theme == Colors.white) {
        emit(ThemeBlocState(theme: Colors.black));
      } else if (state.theme == Colors.black) {
        emit(ThemeBlocState(theme: Colors.blue));
      } else if (state.theme == Colors.blue) {
        emit(ThemeBlocState(theme: Colors.green));
      } else if (state.theme == Colors.green) {
        emit(ThemeBlocState(theme: Colors.red));
      } else {
        emit(ThemeBlocState(theme: Colors.white));
      }
    });
  }
}
