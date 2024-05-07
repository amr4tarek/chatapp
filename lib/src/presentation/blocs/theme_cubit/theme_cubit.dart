import 'package:bloc/bloc.dart';
import 'package:chatapp/constants/themes/color_scheme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.light, lightmode));

  // Method to toggle between light and dark themes
  void toggleTheme() {
    emit(state.mode == ThemeMode.light
        ? ThemeState(ThemeMode.dark, darkmode)
        : ThemeState(ThemeMode.light, lightmode));
  }
}
