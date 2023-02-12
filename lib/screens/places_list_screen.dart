import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:great_place/providers/great_places.dart';
import 'package:great_place/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Nenhum local cadastrado!'),
        ),
        builder: (context, greatPlaces, child) {
          return greatPlaces.itemsCount == 0
              ? child!
              : ListView.builder(
                  itemCount: greatPlaces.itemsCount,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.getItemByIndex(index).image
                      ),
                    ),
                    title: Text(greatPlaces.getItemByIndex(index).title),
                    onTap: (){},
                  ),
                );
        },
      ),
    );
  }
}
