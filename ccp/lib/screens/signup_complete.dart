import 'package:ccp/screens/posts/empty_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';

class SignUpComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        centerTitle: true,
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
          child: AppLogo(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Sign Up Complete!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                child: Image.asset(
                  'assets/images/checkmark.gif',
                  height: 150.0,
                  width: 150.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Welcome Aboard !!!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Let\'s Localize.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                'You will love it!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              RaisedButton(
                child: Text("Dummy Nav"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return EmptyTimelinePage();},),);
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        value: 1.0,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}