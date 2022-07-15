import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({Key? key, required this.onSelectImage}) : super(key: key);
  
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    var picker = ImagePicker();
    final xfile =  await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: 600,
    );
    if(xfile == null) {
      return;
    }
    final imagePath = File(xfile.path);
    setState(() {
      _storedImage = imagePath;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagePath.path);
    final savedImage = await imagePath.copy("${appDir.path}/$fileName");
    widget.onSelectImage(savedImage);
  
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  "No Image taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(width: 10),
        TextButton.icon(
          onPressed: 
            _takePicture
          ,
          icon: const Icon(Icons.camera),
          label: const Text("Take picture"),
        ),
      ],
    );
  }
}
