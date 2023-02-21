import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_place/screens/map_screen.dart';
import 'package:great_place/utils/location_util.dart';
import 'package:location/location.dart';
import 'dart:developer' as dev;

class LocationInput extends StatefulWidget {

  final Function onSelectPosition;

  const LocationInput({super.key, required this.onSelectPosition});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    updatePreviewImageMap(locData.latitude!, locData.longitude!); 
  }

  Future<void> _selectOnMap() async {
    final LatLng selectPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const MapScreen(),
      ),
    );

    if (selectPosition == null) return;

    dev.log(
      selectPosition.toString(),
      name: 'Localização'
    );

    updatePreviewImageMap(selectPosition.latitude, selectPosition.longitude); 
    widget.onSelectPosition(selectPosition);
  }

  void updatePreviewImageMap(double latitude, double longitude){
    final staticMapUrlImage = LocationUtil.generateLocationPreviewImage(
        latitude: latitude,
        longitude: longitude);

    setState(() {
      _previewImageUrl = staticMapUrlImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text('Localização não informada')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Localização atual'),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Selecione no mapa'),
            ),
          ],
        )
      ],
    );
  }
}
