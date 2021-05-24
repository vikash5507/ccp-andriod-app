
import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/helper/utility.dart';
import 'package:ccp/page/Auth/widget/googleLoginButton.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:ccp/widgets/newWidget/customLoader.dart';
import 'package:ccp/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final VoidCallback loginCallback;

  const SignIn({Key key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    loader = CustomLoader();
    super.initState();
  }
  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            _entryFeild(getTranslated(context, 'singin_page-form_email'), controller: _emailController),
            _entryFeild(getTranslated(context, 'singin_page-form_password'),
                controller: _passwordController, isPassword: true),
            _emailLoginButton(context),
            SizedBox(height: 20),
            _labelButton(getTranslated(context, 'singin_page-form_forget_password'), onPressed: () {
              Navigator.of(context).pushNamed('/ForgetPasswordPage');
            }),
            Divider(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            GoogleLoginButton(
              loginCallback: widget.loginCallback,
              loader: loader,
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _entryFeild(String hint,
      {TextEditingController controller, bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _labelButton(String title, {Function onPressed}) {
    return FlatButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      splashColor: Colors.grey.shade200,
      child: Text(
        title,
        style: TextStyle(
            color: CcpColor.primary, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailLoginButton(BuildContext context) {
    return Container(
      width: fullWidth(context),
      margin: EdgeInsets.symmetric(vertical: 35),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: CcpColor.primary,
        onPressed: _emailLogin,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TitleText(getTranslated(context, 'singin_page-title'), color: Colors.white),
      ),
    );
  }

  void _emailLogin() {
    var state = Provider.of<AuthState>(context, listen: false);
    if (state.isbusy) {
      return;
    }
    loader.showLoader(context);
    var isValid = validateCredentials(
        _scaffoldKey, _emailController.text, _passwordController.text);
    if (isValid) {
      state
          .signIn(_emailController.text, _passwordController.text,
              scaffoldKey: _scaffoldKey)
          .then((status) {
            print(status);
        // if (state.user != null) {
        //   loader.hideLoader();
        //   Navigator.pop(context);
        //   widget.loginCallback();
        // } else {
        //   cprint('Unable to login', errorIn: '_emailLoginButton');
        //   loader.hideLoader();
        // }
      }).whenComplete(() {
        if (state.authStatus == AuthStatus.LOGGED_IN) {
          loader.hideLoader();
          Navigator.pop(context);
          widget.loginCallback();
        } else {
          cprint('Unable to login', errorIn: '_emailLoginButton');
          loader.hideLoader();
        }
      });
    } else {
      loader.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: customText(getTranslated(context, 'singin_page-title'),
            context: context, style: TextStyle(fontSize: 20)),
        centerTitle: true,
        //primary,
      ),
      body: _body(context),
    );
  }
}
