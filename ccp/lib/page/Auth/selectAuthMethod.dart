import 'package:ccp/helper/localization/language.dart';
import 'package:ccp/helper/localization/language_constants.dart';
import 'package:ccp/main.dart';
import 'package:ccp/page/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/page/Auth/signup.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';
import 'signin.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<Language> _supportedLang = Language.languageList();
  int _langIndexSelected = 0;
  Locale _lang;

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._lang = locale;
      });
    });
    super.didChangeDependencies();
    
  }
  

  _onLangSelected(int index) {
    setState(() => _langIndexSelected = index);
    _changeLanguage(_supportedLang[index]);
  }

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: CcpColor.primary,
        onPressed: () {
          var state = Provider.of<AuthState>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(loginCallback: state.getCurrentUser),
            ),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TitleText(getTranslated(context, 'welcome_page-create_account'), color: Colors.white),
        //child: TitleText('Create account', color: Colors.white),
      ),
    );
  }

  Widget _selectLanguage() {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemCount: _supportedLang.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            color: _langIndexSelected != null && _langIndexSelected == index ? CcpColor.white : CcpColor.extraExtraLightGrey,
            child: ListTile(
              leading: Text(_supportedLang[index].flag, style: TextStyle(fontSize: 20),),
              title: Text(_supportedLang[index].name, style: TextStyle(fontSize: 20),),
              subtitle: _supportedLang[index].name == "English" ? Text("Default") : null,
              trailing: _lang != null && _lang.languageCode == _supportedLang[index].languageCode ? Icon(Icons.check, color: CcpColor.primary, size: 32,) : null,
              //trailing: _langIndexSelected == index ? Icon(Icons.check, color: CcpColor.primary, size: 32,) : null,
              onTap: () => _onLangSelected(index),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
          );
        },
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 40,
              child: Image.asset('assets/images/ci-logo-big.png'),
            ),
            Spacer(),
            TitleText(
              //'See what\'s happening in the Locality right now.',
              getTranslated(context, 'welcome_page-title'),
              fontSize: 25,
              color: CcpColor.primary,
            ),
            Spacer(),
            TitleText(
              //'Select language of your choice',
              getTranslated(context, 'welcome_page-select_lang_msg'),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            //Spacer(),
            // TitleText(
            //   'अपनी पसंद की भाषा चुनें',
            //   fontSize: 14,
            //   fontWeight: FontWeight.w600,
            // ),
            //_submitButton(),
            //SizedBox(height: 10),
            _selectLanguage(),
            Spacer(),
            _submitButton(),
            Spacer(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                TitleText(
                  getTranslated(context, 'welcome_page-bottom'),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    var state = Provider.of<AuthState>(context, listen: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignIn(loginCallback: state.getCurrentUser),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: TitleText(
                      getTranslated(context, 'welcome_page-bottom_login'),
                      fontSize: 14,
                      color: CcpColor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context, listen: false);
    return Scaffold(
      body: state.authStatus == AuthStatus.NOT_LOGGED_IN ||
              state.authStatus == AuthStatus.NOT_DETERMINED
          ? _body()
          : HomePage(),
          //: Container(child: Text("Hello")),
      //ToDO : HomePage(),
    );
  }
}
