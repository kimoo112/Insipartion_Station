// ignore_for_file: use_build_context_synchronously

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Helpers/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Logic/App Theme cubit/app_theme_cubit.dart';
import '../../Model/Enums/theme_state.dart';

class DarkAndLight extends StatefulWidget {
  const DarkAndLight({
    super.key,
  });

  @override
  State<DarkAndLight> createState() => _DarkAndLightState();
}

class _DarkAndLightState extends State<DarkAndLight> {
  bool isDarkModeEnabled = true;

  saveInitial() async {
    final prefs = await SharedPreferences.getInstance();
    bool? initial = prefs.getBool('switch');

    if (initial == null) {
      isDarkModeEnabled = true;
    } else {
      isDarkModeEnabled = initial;
    }
  }

  @override
  void initState() {
    super.initState();
    saveInitial();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 20.0),
      child: Row(
        children: [
          DayNightSwitcher(
            nightBackgroundColor: cPrimary,
            isDarkModeEnabled: isDarkModeEnabled,
            onStateChanged: (isChecked) async {
              final prefs = await SharedPreferences.getInstance();
              setState(() {
                isDarkModeEnabled = isChecked;
                prefs.setBool('switch', isChecked);
              });

              if (isChecked) {
                BlocProvider.of<AppThemeCubit>(context)
                    .changeTheme(ThemeState.dark);
              } else {
                BlocProvider.of<AppThemeCubit>(context)
                    .changeTheme(ThemeState.light);
              }
            },
          ),

          // IconButton(
          //     onPressed: () {
          //       BlocProvider.of<AppThemeCubit>(context)
          //           .changeTheme(ThemeState.dark);
          //     },
          //     icon: const Icon(CupertinoIcons.moon_circle_fill)),
          // const SizedBox(
          //   height: 20,
          // ),
          // IconButton(
          //     onPressed: () {
          //       BlocProvider.of<AppThemeCubit>(context)
          //           .changeTheme(ThemeState.light);
          //     },
          //     icon: const Icon(CupertinoIcons.sun_haze)),
        ],
      ),
    );
  }
}
