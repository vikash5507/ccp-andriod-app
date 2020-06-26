import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/rounded_input_field.dart';
import 'package:ccp/screens/signup_complete.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';

class ChooseLocation extends StatelessWidget {
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
                'Almost done, confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Text(
                'your location',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    RoundedInputField(
                      bordered: true,
                      hintText: null,
                      borderedInputSize: 0.8,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Hometown (Optional)',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    RoundedInputField(
                      bordered: true,
                      hintText: null,
                      borderedInputSize: 0.8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              RoundedButton(
                text: 'Done',
                width: 0.8,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUpComplete();},),);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        value: 0.75,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}
