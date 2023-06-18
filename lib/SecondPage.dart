import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';




class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final ImagePicker _picker = ImagePicker();

  Future<File?> _getImage(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final image = await _getImage(ImageSource.gallery);
                Navigator.pop(context, image);
              },
              child: Text('Choose Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final image = await _getImage(ImageSource.camera);
                Navigator.pop(context, image);
              },
              child: Text('Take Photo'),
            ),
          ],
        ),
      ),
    );
  }
}