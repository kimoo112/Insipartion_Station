// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/Helpers/shared_preferences.dart';
import 'package:notes/Model/Enums/theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        if (sharedPreferences!.getBool('theme') != null) {
          if (sharedPreferences!.getBool('theme') == true) {
            emit(AppThemeLight());
          } else {
            emit(AppThemeDark());
          }
        }
        break;
      case ThemeState.light:
        sharedPreferences!.setBool('theme', true);
        emit(AppThemeLight());

        break;
      case ThemeState.dark:
        sharedPreferences!.setBool('theme', false);

        emit(AppThemeDark());
        break;
      default:
    }
  }
}
