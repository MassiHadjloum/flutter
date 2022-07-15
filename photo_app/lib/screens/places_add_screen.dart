import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_app/providers/greate_places.dart';
import 'package:photo_app/widgets/image_input.dart';
import 'package:photo_app/widgets/place_input.dart';
import 'package:provider/provider.dart';

class PlaceAddScreen extends StatefulWidget {
  static const routeName = "/add_place";

  const PlaceAddScreen({Key? key}) : super(key: key);

  @override
  _PlaceAddScreenState createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Place"),
      ),
      body: Column(
      
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    const SizedBox(height: 10.0),
                    ImageInput(onSelectImage: _selectImage),
                    const SizedBox(height: 10.0),
                    const LocationInput(),
                  ],
                ),
              ),
            ),
          ),
        
          ElevatedButton.icon(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).secondaryHeaderColor),
            ),
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
