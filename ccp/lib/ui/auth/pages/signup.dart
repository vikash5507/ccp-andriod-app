import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/bloc/signup/bloc/signup_bloc.dart';
import 'package:ccp/ui/auth/pages/signup_form.dart';
import 'package:ccp/ui/auth/widgets/app_logo_for_appbar.dart';
import 'package:ccp/ui/auth/widgets/skip_to_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//signup page

class SignUpScreen extends StatelessWidget {
  final UserRepository _userRepository;

  SignUpScreen({Key key, @required UserRepository userRepository})
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
                BlocProvider.of<AuthBloc>(context).add(AuthLoggedOutEvent());
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
                'Login',
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
      //body: buildBody(context, _userRepository),
      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(userRepository: _userRepository),
        child: SignupForm(userRepository: _userRepository),
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

  // BlocProvider<SignupBloc> buildBody(
  //     BuildContext context, UserRepository _userRepository) {
  //   return BlocProvider(
  //     create: (context) => SignupBloc(userRepository: _userRepository),
  //     child: SignupForm(userRepository: _userRepository),
  //   );
  // }
}
