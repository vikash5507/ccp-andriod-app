import 'package:ccp/core/utils/localization/language.dart';
import 'package:ccp/core/utils/localization/language_constants.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/main.dart';
import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/pages/login.dart';
import 'package:ccp/ui/auth/widgets/already_have_or_not_account_check.dart';
import 'package:ccp/ui/auth/widgets/app_logo_for_appbar.dart';
import 'package:ccp/ui/auth/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LandingPageChooseLanguage extends StatelessWidget {
  final UserRepository _userRepository;

  LandingPageChooseLanguage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  void _changeLanguage(BuildContext context, Language language) async {
    Locale _locale = await setLocale(context, language.languageCode);
    CcpApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This gives total height and width of our screen
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
              SizedBox(
                height: size.height * 0.05,
              ),
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
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
              SizedBox(
                height: size.height * 0.13,
              ),
              Text(
                'Select language of your choice',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedButton(
                text: 'ENGLISH',
                onPressed: () {
                  _changeLanguage(
                      context, Language(1, "🇺🇸", "English", "en"));
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthStartedEvent(),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SignUpScreen(userRepository: _userRepository);
                  //     },
                  //   ),
                  // );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedButton(
                text: 'हिन्दी',
                color: Colors.grey,
                onPressed: () {
                  _changeLanguage(context, Language(2, "🇮🇳", "हिंदी", "hi"));
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthStartedEvent(),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SignUpScreen(userRepository: _userRepository);
                  //     },
                  //   ),
                  // );
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
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(userRepository: _userRepository,);
                      },
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
