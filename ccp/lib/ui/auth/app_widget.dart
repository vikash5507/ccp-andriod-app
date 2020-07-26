import 'package:ccp/core/bloc/simple_bloc_observer.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/pages/login.dart';
import 'package:ccp/ui/auth/pages/signup.dart';
import 'package:ccp/ui/auth/pages/signup_complete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/landing_page.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('CCP Landing page')),
      body: buildBody(context),
    );
  }

  BlocProvider<AuthBloc> buildBody(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return BlocProvider(
      create: (context) => AuthBloc(userRepository: userRepository)..add(AppStartedEvent()),
      child: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(state is AppStartedState) {
              return LandingPageChooseLanguage(userRepository: userRepository,);
            }
            if(state is AuthInitialState) {
              return SignUpScreen(userRepository: userRepository);
            }
            if(state is AuthSuccessState) {
              return SignUpComplete(name: state.displayName);
            }
            if(state is AuthFailureState) {
              return LoginScreen(userRepository: userRepository);
            }
            return Container();
          },
        )
      ),
    );
  }
}
