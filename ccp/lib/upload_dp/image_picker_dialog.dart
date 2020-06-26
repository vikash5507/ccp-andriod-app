import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ccp/upload_dp/image_picker_handler.dart';
import 'package:ccp/components/rounded_button.dart';

//for dialog box giving options when click on upload picture icon

class ImagePickerDialog extends StatelessWidget {

  ImagePickerHandler _listener;
  AnimationController _controller;
  BuildContext context;

  ImagePickerDialog(this._listener,this._controller);

  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;

  void initState() {
    _drawerContentsOpacity = new CurvedAnimation(
      parent: new ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = new Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  getImage(BuildContext context) {
    if (_controller == null ||
        _drawerDetailsPosition == null ||
        _drawerContentsOpacity == null) {
      return;
    }

    _controller.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) =>
      new SlideTransition(
        position: _drawerDetailsPosition,
        child: new FadeTransition(
          opacity: new ReverseAnimation(_drawerContentsOpacity),
          child: this,
        ),
      ),
    );
  }

  void dispose() {
    _controller.dispose();
  }

  void navigationPage() {
    Navigator.pop(context);
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 200);
    return new Timer(_duration, navigationPage);
  }

  dismissDialog() {
    _controller.reverse();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Material(
      type: MaterialType.transparency,
      child: new Opacity(
        opacity: 1.0,
        child: new Container(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RoundedButton(
                text: 'Camera',
                width: 0.4,
                press: () => _listener.openCamera(),
              ),
              const SizedBox(height: 10.0,),
              RoundedButton(
                text: 'Gallery',
                width: 0.4,
                press: () => _listener.openGallery(),
              ),
              const SizedBox(height: 20.0,),
              RoundedButton(
                text: 'Cancel',
                width: 0.4,
                press: () => dismissDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
