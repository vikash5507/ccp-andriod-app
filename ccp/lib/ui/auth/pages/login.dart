import 'package:auto_route/auto_route.dart';
import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/core/utils/localization/language_constants.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/bloc/login/bloc/login_bloc.dart';
import 'package:ccp/ui/auth/pages/login_form.dart';
import 'package:ccp/ui/auth/widgets/app_logo_for_appbar.dart';
import 'package:ccp/ui/auth/widgets/skip_to_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//login screen

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryCcpColor,
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 18.0, 15.0, 0.0),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(AuthStartedEvent());
                
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
              },
              child: Text(
                getTranslated(context, 'home_page'),
                //'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SkipToFeed(
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  // BlocProvider<LoginBloc> buildBody(
  //     BuildContext context, UserRepository userRepository) {
  //   return BlocProvider<LoginBloc>(
  //     create: (context) => LoginBloc(userRepository: _userRepository),
  //     child: LoginForm(userRepository: _userRepository),
  //   );
  // }
}
