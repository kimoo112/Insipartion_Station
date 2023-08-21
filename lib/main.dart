import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/Helpers/shared_preferences.dart';
import 'package:notes/Logic/Read%20Notes%20Cubit/notes_cubit.dart';
import 'package:notes/Model/Enums/theme_state.dart';
import 'package:notes/Model/note_model.dart';
import 'package:notes/Views/Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helpers/Themes/dark_theme.dart';
import 'Helpers/Themes/light_theme.dart';
import 'Helpers/constants.dart';
import 'Logic/App Theme cubit/app_theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(hiveBox);
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit()..changeTheme(ThemeState.initial),
        ),
        BlocProvider(create: (context) => NotesCubit())
      ],
      child:
          BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
        if (state is AppThemeLight) {
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Note App',
                  theme: themeDataLight(context),
                  home: const SplashScreen(),
                );
              });
        } else if (state is AppThemeDark) {
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Note App',
                  theme: themeDataDark(context),
                  home: const SplashScreen(),
                );
              });
        }
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Note App',
              theme: ThemeData(
                fontFamily: "Roboto",
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            );
          },
        );
      }),
    );
  }
}
