import 'dart:io';

import 'package:ccp/ui/auth/widgets/upload_dp/image_picker_handler.dart';
import 'package:flutter/material.dart';
//import 'package:ccp/upload_dp/image_picker_dialog.dart';


class UploadDpCircle extends StatefulWidget {
  final String title;
  UploadDpCircle({Key key, this.title}) : super(key: key);

  @override
  _UploadDpCircleState createState() => _UploadDpCircleState();
}

class _UploadDpCircleState extends State<UploadDpCircle> with TickerProviderStateMixin,ImagePickerListener {

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    imagePicker = new ImagePickerHandler(this,_controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width *0.4,
      child: new GestureDetector(
        onTap: () => imagePicker.showDialog(context),
        child: new Center(
          child: _image == null ?
            new Stack(
              children: <Widget>[
                new Center(
                  child: new CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.grey,
                  ),
                ),
                new Center(
                  child: new Icon(Icons.camera),
                ),
              ],
            ) :
            new Container(
              height: 160.0,
              width: 160.0,
              decoration: new BoxDecoration(
                color: Colors.blueAccent,
                image: new DecorationImage(
                  image: new ExactAssetImage(_image.path),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.blueAccent,width: 5.0),
                borderRadius: new BorderRadius.all(const Radius.circular(80.0)),
              ),
            ),
        ),
      ),
    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }

}
