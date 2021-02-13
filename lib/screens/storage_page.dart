import 'package:firebase_capac/storageService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  File _image;
  ImagePicker imgPicker = ImagePicker();
  StorageService storage = StorageService.getInstance();

  Future getImage() async {
    PickedFile image;
    await imgPicker.getImage(source: ImageSource.gallery).then((value) {
      image = value;
    });

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TITAN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () async {
              await getImage();
              await storage.uploadImage(_image);
            },
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.transparent,
              backgroundImage: _image == null 
                ? AssetImage('images/add_a_photo_icon.png') 
                : FileImage(_image),
            ),
          ),
        ),
      ),
    );
  }
}
