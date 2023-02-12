import 'package:flutter/material.dart';
import 'package:great_place/providers/great_places.dart';
import 'package:great_place/screens/place_form_screen.dart';
import 'package:great_place/screens/places_list_screen.dart';
import 'package:great_place/utils/app_routes.dart';
import 'package:great_place/utils/own_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Place',
        theme: tema,
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM : (context) => const PlaceFormScreen()
        },
      ),
    );
  }
}
