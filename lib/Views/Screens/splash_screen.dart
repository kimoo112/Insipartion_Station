import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Helpers/colors.dart';
import 'package:notes/Logic/App%20Theme%20cubit/app_theme_cubit.dart';
import 'package:notes/Views/Screens/home_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        if (state is AppThemeDark) {
          return FlutterSplashScreen.fadeIn(
              defaultNextScreen: const HomeView(),
              backgroundColor: cDark,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/images/Note.json"),
                  Text(
                    "Inspiration Station".toUpperCase(),
                    style: const TextStyle(
                        color: cDarkC,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ));
        } else if (state is AppThemeLight) {
          return FlutterSplashScreen.fadeIn(
              defaultNextScreen: const HomeView(),
              backgroundColor: cLight,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/images/Note.json"),
                  Text(
                    "Inspiration Station".toUpperCase(),
                    style: const TextStyle(
                        color: cAmethyst,
                        fontSize: 18,
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ));
        }
        return Container();
      },
    ));
  }
}
