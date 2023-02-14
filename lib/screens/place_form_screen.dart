import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_place/providers/great_places.dart';
import 'package:great_place/widget/image_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleCointroller = TextEditingController();
  File? _pickedImage;

  void _selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleCointroller.text.isEmpty || _pickedImage == null) return;

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleCointroller.text,
      _pickedImage!,
    );

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
                    ImageInput(_selectedImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
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
