import 'package:flutter/material.dart';
import 'dart:io';

import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  File? _image;

  void _navigateToSecondPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
    if (result != null) {
      setState(() {
        _image = result;
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
              _image!,
              height: 200,
            )
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToSecondPage,
              child: Text('Add Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteImage,
              child: Text('Delete Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
