import 'package:flutter/material.dart';
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
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) {
          return  snapshot.connectionState == ConnectionState.waiting ? 
          const Center(child: CircularProgressIndicator(),) :
          Consumer<GreatPlaces>(
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
          );
        }
      ),
    );
  }
}
