import 'package:ccp/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'CCP',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 120.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration:  InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:  BorderSide(color: Colors.blueAccent)
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(color: Colors.blueAccent)
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(1.0,0.0),
                  padding: EdgeInsets.only(top: 15.0,left: 20.0),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blue,
                    color: Colors.blueAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: ImageIcon(AssetImage(
                              'assets/images/facebook_icon.png',
                          )),
                        ),
                        Center(
                          child: Text(
                              'Log in with Facebook',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

