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
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: double.infinity,

        child: SingleChildScrollView (
          child: Column( //all elements of page in a column
            children: <Widget>[
              Align ( //for logo of app
                alignment: Alignment.topCenter,
                child:
                  Container (
                    margin: EdgeInsets.only(top: 85),
                    child: Image.asset(
                      'assets/images/ci-logo-big.png',
                      height: 60,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  )
              ),
              SizedBox(height: 10),
              Column( // for text
                children: <Widget>[
                  Container(
                    child: Text(
                      'Duckoshla',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0.0),
                    child: Text(
                      'Select The Language of Your Choice.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                    child: Text(
                      'अपनी पसंद की भाषा चुनें |',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
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
                      SizedBox(height: 20),
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
                  SizedBox(height: 110),
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

