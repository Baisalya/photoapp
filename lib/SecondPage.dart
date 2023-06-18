import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';




class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final ImagePicker _picker = ImagePicker();

  Future<File?> _getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final image = await _getImage();
            Navigator.pop(context, image);
          },
          child: Text('Upload Photo'),
        ),
      ),
    );
  }
}