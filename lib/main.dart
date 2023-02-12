import 'package:flutter/material.dart';
import 'package:great_place/screens/place_form_screen.dart';
import 'package:great_place/screens/places_list_screen.dart';
import 'package:great_place/utils/app_routes.dart';
import 'package:great_place/utils/own_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Place',
      theme: tema,
      // ThemeData(
      //   primarySwatch: Colors.indigo,
      //   accentColor: Colors.amber,
      //   visualDensity: VisualDensity.adaptivePlatformDensity
      // ),
      home: const PlaceFormScreen(),
      routes: {
        AppRoutes.PLACE_FORM : (context) => const PlaceFormScreen()
      },
    );
  }
}
