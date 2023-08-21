import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData themeDataLight(context) => ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
      appBarTheme: AppBarTheme(
          backgroundColor: cTransperet,
          elevation: 0,
          scrolledUnderElevation: 2,
          shadowColor: cDark.withOpacity(.4)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: cLightFloating, foregroundColor: cDark),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: cSlateGray.withOpacity(.5),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Rubik',
            bodyColor: cLight,
          ),
    );
