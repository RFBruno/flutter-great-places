import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_place/providers/great_places.dart';
import 'package:great_place/widget/image_input.dart';
import 'package:great_place/widget/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleCointroller = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectedImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectedPosition(LatLng pickedPosition) {
    setState(() {
      _pickedPosition = pickedPosition;
    });
  }

  bool _isValidForm() {
    return _titleCointroller.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleCointroller.text, _pickedImage!, _pickedPosition!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Título',
                      ),
                      controller: _titleCointroller,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectedImage),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput(onSelectPosition: _selectedPosition)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _isValidForm() ? _submitForm : null,
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
