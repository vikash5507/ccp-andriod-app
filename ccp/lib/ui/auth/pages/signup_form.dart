import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/ui/auth/bloc/auth_bloc.dart';
import 'package:ccp/ui/auth/bloc/signup/bloc/signup_bloc.dart';
import 'package:ccp/ui/auth/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  final UserRepository _userRepository;

  const SignupForm({Key key, @required UserRepository userRepository}) : assert(userRepository != null), _userRepository= userRepository, super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  SignupBloc _signupBloc;
  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignupButtonEnabled(SignupState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _signupBloc = BlocProvider.of<SignupBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthBloc>(context)
              .add(AuthLoggedInEvent());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  //SizedBox(height: screenHeight(context, multiplyBy: 0.03)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Create your account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  //SizedBox(height: screenHeight(context, multiplyBy: 0.1)),
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person, color: primaryCcpColor),
                        //labelText: 'Enter Full Name',
                        hintText: 'Full Name',
                      ),
                      keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email, color: primaryCcpColor),
                        //labelText: 'Enter Email or Phone Number',
                        hintText: 'Email or Phone Number',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isEmailValid ? 'Invalid Email' : null;
                      },
                  ),
                  TextFormField(
                    controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock, color: primaryCcpColor),
                        //labelText: 'Enter Password',
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isPasswordValid ? 'Invalid Password' : null;
                      },
                  ),
                  //SizedBox(height: screenHeight(context, multiplyBy: 0.03)),
                  SizedBox(height: 20,),
                  SignupButton(
                            onPressed: isSignupButtonEnabled(state)
                                ? _onFormSubmitted
                                : null,
                          ),
                  // RoundedButton(
                  //   text: 'SIGNUP',
                  //   onPressed: isSignupButtonEnabled(state) ? _onFormSubmitted : null,
                  //   // press: () {
                  //   //   Navigator.push(context, MaterialPageRoute(builder: (context) {return VerifyOtp();},),);
                  //   // },
                  // ),
                  //SizedBox(height: screenHeight(context, multiplyBy: 0.02)),
                  /*AlreadyHaveOrNotAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        }
                      ),
                      );
                    },
                  ),*/
                  //SizedBox(height: screenHeight(context, multiplyBy: 0.01)),
                  //OrDivider(),
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      'By signing up, you agree to our Terms, \nData Policy and Cokiee Policy'
                    ),
                  ),
                  // Text(
                  //   'Data Policy and Cokiee Policy'
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _signupBloc.add(
      SignupEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _signupBloc.add(
      SignupPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _signupBloc.add(
      SignupSubmitted(
        fullname: _fullnameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

}
