import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_place/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: 50,
        longitude: 10,
      ),
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
