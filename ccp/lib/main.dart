import 'package:ccp/core/routes/router.gr.dart';
import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/ui/auth/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/bloc/simple_bloc_observer.dart';
import 'core/utils/localization/demo_localization.dart';
import 'core/utils/localization/language_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(CcpApp());
}

class CcpApp extends StatefulWidget {
  const CcpApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _CcpAppState state = context.findAncestorStateOfType<_CcpAppState>();
    state.setLocale(newLocale);
  }

  @override
  _CcpAppState createState() => _CcpAppState();
}

class _CcpAppState extends State<CcpApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    print("called came here!! ");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryCcpColor)),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CCP',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white70,
        ),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("hi", "IN")
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        onGenerateRoute: Router()
        //home: AppWidget(),
      );
    }
  }
}
