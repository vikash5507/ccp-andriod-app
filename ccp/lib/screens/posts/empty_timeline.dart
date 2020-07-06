import 'package:ccp/helper/text_style.dart';
import 'package:ccp/screens/posts/create_post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyTimelinePage extends StatefulWidget {
  @override
  _EmptyTimelinePageState createState() => new _EmptyTimelinePageState();
}

class _EmptyTimelinePageState extends State<EmptyTimelinePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _bottomBarCompWidget = <Widget>[
    Text(
      'You are at Home Page!',
      style: bodyHeadingTextStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'You are at Explore Page!',
      style: bodyHeadingTextStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'You are at Write Post Page!',
      style: bodyHeadingTextStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'You are at Notification Page!',
      style: bodyHeadingTextStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'You are at Direct Messages Page!',
      style: bodyHeadingTextStyle,
      textAlign: TextAlign.center,
    ),
  ];

  void _onIconTapped(int index) {
     // TODO fix routing - use Pageview - https://www.youtube.com/watch?v=J1gE9xvph-A
    if(index == 2){
      index = 0;
      Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new CreatePostPage();
    }));
    }
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //drawer: Drawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            ),
            onPressed: () {
              print('3 bars button clicked');
            },
          ),
          title: Text(
            'Slate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff4863B7),
                fontSize: 28),
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  print('go to my profile page!');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/logged-in-user-below.png',),
                  ),
                ))
          ],
        ),
        body: Center(
          child: _bottomBarCompWidget.elementAt(_selectedPageIndex),
        ),
        //TODO - To adjust height, need to write custom bottom bar
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text(''),
              //title: Text('Home', style: TextStyle(color: textColor),),
              icon: FaIcon(
                FontAwesomeIcons.home,
              ),
              //icon: new Image.asset('assets/images/Icons/Home.png'),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              //title: Text('Explore', style: TextStyle(color: textColor),),
              //icon: new Image.asset('assets/images/Icons/Search.png', ),
              icon: FaIcon(FontAwesomeIcons.search),
            ),
            BottomNavigationBarItem(
              //TODO - Add Floating Action button - https://www.youtube.com/watch?v=2uaoEDOgk_I
              title: Text(''),
              icon: new Image.asset('assets/images/Icons/Write-button.png'),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              //title: Text('Notifications', style: TextStyle(color: textColor),),
              //icon: new Image.asset('assets/images/Icons/Bell.png'),
              icon: FaIcon(FontAwesomeIcons.bell),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              //title: Text('Messages', style: TextStyle(color: textColor),),
              //icon: new Image.asset('assets/images/Icons/icon_message.png'),
              icon: FaIcon(FontAwesomeIcons.envelope),
            ),
          ],
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onIconTapped,
          iconSize: 23,
        ));
  }
}
