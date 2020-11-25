import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagepickFn);
  final void Function(File pickedImage) imagepickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _image;
  final picker = ImagePicker();
  void _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    widget.imagepickFn(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 43,
            backgroundColor: Colors.grey,
            backgroundImage: _image == null ? null : FileImage(_image)),
        FlatButton.icon(
            onPressed: _pickImage,
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.image),
            label: Text('Add Image')),
      ],
    );
  }
}
