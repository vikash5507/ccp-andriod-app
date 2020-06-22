import 'package:ccp/screens/login.dart';
import 'package:ccp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/skip_to_feed.dart';

//This is landing page of app which asks user for choosing language

class LandingPageChooseLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This gives total height and width of our screen
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,

          child: Column( //all elements of page in a column
            children: <Widget>[
              Row ( //for logo of app
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height*0.25),
                  Container (
                    child: Image.asset(
                      'assets/images/ci-logo-big.png',
                      height: 60,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              Column( // for text
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Select The Language of Your Choice.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 0.0),
                    child: Text(
                      'अपनी पसंद की भाषा चुनें |',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        text: 'ENGLISH',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return SignUpScreen();
                                },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      RoundedButton(
                        text: 'हिन्दी',
                        color: Colors.lightBlueAccent,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SkipToFeed(
                        press: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

