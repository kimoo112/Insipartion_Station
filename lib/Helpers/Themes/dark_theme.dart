import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData themeDataDark(context) => ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      appBarTheme: AppBarTheme(
          backgroundColor: cTransperet,
          elevation: 0,
          scrolledUnderElevation: 2,
          shadowColor: cGrey.withOpacity(.1)),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: cSlateGray.withOpacity(.8),
      ),
      colorScheme: const ColorScheme.dark(primary: cLight),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: cDarkFloating, foregroundColor: cLight),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Rubik',
            bodyColor: cDark,
            decorationColor: cAmber,
          ),
    );
