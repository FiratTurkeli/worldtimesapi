import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldtimeapi/splash.dart';
import 'constants/themes.dart';
import 'database/theme_mode_provider.dart';
import 'services/world_time_services.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(
      MultiProvider(
        providers: [
          Provider<WorldTimeServices>(create: (context) => WorldTimeServices()),
          ChangeNotifierProvider<ThemeModeProvider>(create: (context) => ThemeModeProvider()),
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      title: 'World Times',
      home: const SplashScreen(),
    );
  }
}


