import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightbg,
  textTheme: const TextTheme(bodyText2: TextStyle(color: dark)),
  cardColor: lightblue,
  dialogBackgroundColor: white,
  canvasColor: dark,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: dark,
  textTheme: const TextTheme(bodyText2: TextStyle(color: white),),
  cardColor: dark2,
  dialogBackgroundColor: dark2,
);