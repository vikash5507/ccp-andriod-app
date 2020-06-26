import 'package:ccp/components/already_have_or_not_account_check.dart';
import 'package:ccp/screens/login.dart';
import 'package:ccp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/skip_to_feed.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';

//This is landing page of app which asks user for choosing language
//make all UI responsive to orientation/add rotation animation and for different screen sizes - TODO

class LandingPageChooseLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This gives total height and width of our screen
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: AppLogo(),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height*0.05,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Duckhosla',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Text(
                    'See what\'s',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'happening in your',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'locality right now.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height*0.13,),
              Text(
                'Select language of your choice',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height*0.05,),
              RoundedButton(
                text: 'ENGLISH',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height*0.02,),
              RoundedButton(
                text: 'हिन्दी',
                color: Colors.grey,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        elevation: 0.0,
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AlreadyHaveOrNotAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) {return LoginScreen();},
                  ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

