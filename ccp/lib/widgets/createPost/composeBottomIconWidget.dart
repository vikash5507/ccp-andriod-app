import 'dart:io';

import 'package:ccp/helper/theme.dart';
import 'package:ccp/state/createPostState.dart';
import 'package:flutter/material.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ComposeBottomIconWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(File) onImageIconSelcted;
  ComposeBottomIconWidget(
      {Key key, this.textEditingController, this.onImageIconSelcted})
      : super(key: key);

  @override
  _ComposeBottomIconWidgetState createState() =>
      _ComposeBottomIconWidgetState();
}

class _ComposeBottomIconWidgetState extends State<ComposeBottomIconWidget> {
  bool reachToWarning = false;
  bool reachToOver = false;
  Color wordCountColor;
  String tweet = '';

  @override
  void initState() {
    wordCountColor = Colors.blue;
    widget.textEditingController.addListener(updateUI);
    super.initState();
  }

  void updateUI() {
    setState(() {
      tweet = widget.textEditingController.text;
      if (widget.textEditingController.text != null &&
          widget.textEditingController.text.isNotEmpty) {
        if (widget.textEditingController.text.length > 259 &&
            widget.textEditingController.text.length < 280) {
          wordCountColor = Colors.orange;
        } else if (widget.textEditingController.text.length >= 280) {
          wordCountColor = Theme.of(context).errorColor;
        } else {
          wordCountColor = CcpColor.primary;
        }
      }
    });
  }

  Widget _bottomIconWidget() {
    return Container(
      width: fullWidth(context),
      height: 55,
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Theme.of(context).dividerColor)),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () {
                setImage(ImageSource.gallery);
              },
              icon: Icon(
                Icons.photo,
                color: Theme.of(context).primaryColor,
                size: 28,
              )),
          IconButton(
              onPressed: () {
                setImage(ImageSource.camera);
              },
              icon: Icon(
                Icons.photo_camera,
                color: Theme.of(context).primaryColor,
                size: 28,
              )),
              IconButton(
              onPressed: () {
                print("Create Polling OVERLAY UI!!");
                Navigator.of(context).pushNamed('/CreatePoll');//ToDo
              },
              icon: Icon(
                Icons.poll,
                color: Theme.of(context).primaryColor,
                size: 28,
              )),
              IconButton(
              onPressed: () {
                print("Create Location Overlay UI to ask location and auto fetch location!!");
                Navigator.of(context).pushNamed('/AskLocation');//ToDo
              },
              icon: Icon(
                Icons.place,
                color: Theme.of(context).primaryColor,
                size: 28,
              )),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: tweet != null && tweet.length > 289
                    ? Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: customText('${280 - tweet.length}',
                            style:
                                TextStyle(color: Theme.of(context).errorColor)),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(
                            value: getTweetLimit(),
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(wordCountColor),
                          ),
                          tweet.length > 259
                              ? customText('${280 - tweet.length}',
                                  style: TextStyle(color: wordCountColor))
                              : customText('',
                                  style: TextStyle(color: wordCountColor))
                        ],
                      )),
          ))
        ],
      ),
    );
  }

  void setImage(ImageSource source) async{
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: source, imageQuality: 20);
    File file = File(image.path);
    //var createPostState = Provider.of<CreatePostState>(context, listen: false);
    //print("Outside!!! when assest changed!");
    setState(() {
      //print("when assest changed!");
      widget.onImageIconSelcted(file);
      //createPostState.onAssestChanged(file);
    });
    // ImagePicker.pickImage(source: source, imageQuality: 20).then((File file) {
    //   setState(() {
    //     // _image = file;
    //     widget.onImageIconSelcted(file);
    //   });
    // });
  }

  double getTweetLimit() {
    if (tweet == null || tweet.isEmpty) {
      return 0.0;
    }
    if (tweet.length > 280) {
      return 1.0;
    }
    var length = tweet.length;
    var val = length * 100 / 28000.0;
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _bottomIconWidget(),
    );
  }
}
