import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ccp/upload_dp/image_picker_dialog.dart';

//handler for image selection


class ImagePickerHandler {
  ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;
  final _picker = ImagePicker();

  ImagePickerHandler(this._listener,this._controller);

  openCamera() async {
    imagePicker.dismissDialog();
    var image = await _picker.getImage(source: ImageSource.camera);
    File tmpFile = File(image.path); // Error here 
    /*Exception has occurred.
NoSuchMethodError (NoSuchMethodError: The getter 'path' was called on null.
Receiver: null
Tried calling: path)
    */
    cropImage(tmpFile);
  }

  openGallery() async {
    imagePicker.dismissDialog();
    var image = await _picker.getImage(source: ImageSource.gallery);
    File tmpFile = File(image.path);
    cropImage(tmpFile);
  }

  void init() {
    imagePicker = new ImagePickerDialog(this,_controller);
    imagePicker.initState();
  }

  Future cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blueAccent,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      maxWidth: 512,
      maxHeight: 512,
    );
    _listener.userImage(croppedFile);
  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);
  }
}

abstract class ImagePickerListener {
  userImage(File _image);
}