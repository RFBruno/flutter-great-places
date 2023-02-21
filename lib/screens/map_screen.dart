import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_place/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadonly;

  const MapScreen({
    super.key,
    this.initialLocation =
        const PlaceLocation(latitude: 37.3861, longitude: 122.0839),
    this.isReadonly = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPositon(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione...'),
        actions: [
          if (!widget.isReadonly)
            IconButton(
              onPressed: _pickedPosition == null ? null : () {
                Navigator.of(context).pop(_pickedPosition);
              },
              icon: const Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude,
            ),
            zoom: 13),
        onTap: widget.isReadonly ? null : _selectPositon,
        markers: _pickedPosition == null
            ? Set<Marker>()
            : {
                Marker(
                    markerId: const MarkerId('p1'), position: _pickedPosition!),
              } as dynamic,
      ),
    );
  }
}
