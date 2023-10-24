import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadField extends StatefulWidget {
  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _image == null
            ? const Icon(
                Icons.account_box_outlined,
                color: Colors.blue,
                size: 50,
              )
            : Image.file(
                File(_image!.path),
                width: 150,
                height: 150,
              ),
        TextButton(
          onPressed: _pickImage,
          child: const Text("Select Image"),
        ),
      ],
    );
  }
}
