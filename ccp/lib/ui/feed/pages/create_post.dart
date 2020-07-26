import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/core/utils/text_style.dart';
import 'package:ccp/ui/feed/widgets/bottom_icon_list_post_page.dart';
import 'package:flutter/material.dart';


class CreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SlatePad',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff4863B7),
              fontSize: 28),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
            child: MaterialButton(
              child: Text('Add Slate'),
              onPressed: () {
                print("object");
              },
              color: primaryCcpColor,
              //splashColor: Colors.pink,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 4),
                child: Row(
                  children: <Widget>[
                    Container(
                        child: InkWell(
                            child: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Image.asset(
                        'assets/images/logged-in-user-below.png',
                        scale: 2.5,
                      ),
                    ))),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, bottom: 36),
                      child: Container(
                          child: Text(
                        "Mahesh Babu",
                        style: bodySmallHeadingTextStyle,
                      )),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black38),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                    //height: size.height * 0.35,
                    //color: Colors.black26,
                    padding:
                        EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
                    child: TextField(
                        autofocus: true,
                        maxLines: null,
                        scrollPadding: EdgeInsets.all(8),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write on your Slatepad, here!',
                          hintStyle: bodyBigTextStyle,
                        ))),
              ),
              BottomPostIconSelector(),
              Container(
                child: MaterialButton(
                  height: size.height * 0.05,
                  minWidth: size.width * 0.8,
                  child: Text('Add Slate'),
                  onPressed: () {
                    print("object");
                  },
                  color: primaryCcpColor,
                  //splashColor: Colors.pink,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
