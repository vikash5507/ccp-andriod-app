import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/widgets/app_logo_for_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpComplete extends StatelessWidget {
  final String name;

  const SignUpComplete({Key key, this.name}) : super(key: key);

  
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
                'Welcome Aboard $name !!!',
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
                child: Text("Logout"),
                onPressed: (){
                  //ToDO remove this navigation
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthLoggedOutEvent(),
                  );
                  //Navigator.push(context, MaterialPageRoute(builder: (context) {return EmptyTimelinePage();},),);
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
