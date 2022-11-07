import 'package:flutter/material.dart';

import 'colors.dart';


// Light and dark theme data

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: myWhite,
  textTheme: const TextTheme(bodyText2: TextStyle(color: myDarkBlue)),
  cardColor: myLightBlue,
  dialogBackgroundColor: white,
  canvasColor: myDarkBlue,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: myDarkBlue,
  textTheme: const TextTheme(bodyText2: TextStyle(color: white),),
  cardColor: mySecondDarkBlue,
  dialogBackgroundColor: mySecondDarkBlue,
);
