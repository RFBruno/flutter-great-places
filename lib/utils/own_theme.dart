import 'package:flutter/material.dart';
final tema = ThemeData(
  primarySwatch: Colors.red,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.amberAccent,
    onPrimary: Colors.black87,
    secondary: Colors.indigoAccent,
    onSecondary: Colors.white70,
    error: Colors.redAccent,
    onError: Colors.black87,
    background: Colors.blueGrey[200]!,
    onBackground: Colors.black87,
    surface: const Color.fromARGB(255, 25, 48, 177),
    onSurface: Colors.white
    
  ),
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Color.fromARGB(250, 26, 35, 126),
  //   titleTextStyle: TextStyle(
  //     fontSize: 20,
  //     // fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //   ), //TextStyle
  // ), //AppBarTheme
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: Color.fromARGB(250, 255, 179, 0),
  //   foregroundColor: Colors.white,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2.0)),
  //   ),
  //   elevation: 10,
  // ),
  // textTheme: const TextTheme(
  //   bodyMedium: TextStyle(
  //       color: Colors.black, fontStyle: FontStyle.italic, fontSize: 20),
  //   headlineMedium: TextStyle(
  //       color: Color.fromARGB(250, 26, 35, 126),
  //       fontWeight: FontWeight.bold,
  //       fontSize: 40),
  // ),
);
