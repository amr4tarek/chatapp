part of 'theme_cubit.dart';

// Define the possible theme modes
enum ThemeMode { light, dark }

// Define the state for the theme Cubit
class ThemeState {
  final ThemeMode mode;
  final ThemeData theme;

  ThemeState(this.mode, this.theme);
}


