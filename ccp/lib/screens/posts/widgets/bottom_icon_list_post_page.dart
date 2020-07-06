import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomPostIconSelector  extends StatefulWidget {
  @override
  _BottomPostIconSelectorState createState() => _BottomPostIconSelectorState();
}

class _BottomPostIconSelectorState extends State<BottomPostIconSelector > {
  //int iconIndex = 0;
  //final List<FaIcon> iconList = [FaIcon(FontAwesomeIcons.image),FaIcon(FontAwesomeIcons.video),FaIcon(FontAwesomeIcons.poll),FaIcon(FontAwesomeIcons.mapMarkerAlt)];

  @override
  Widget build(BuildContext context) {
    return Container(
                //padding: const EdgeInsets.only(left: 40, top: 100; right: 40),
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: Row(children: <Widget>[
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.image)),
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.video)),
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.poll)),
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.mapMarkerAlt)),
                ]),
              );
  }
}