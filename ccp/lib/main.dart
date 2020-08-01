import 'package:ccp/state/chatState.dart';
import 'package:ccp/state/feedState.dart';
import 'package:ccp/state/notificationState.dart';
import 'package:ccp/state/searchState.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'helper/localization/demo_localization.dart';
import 'helper/localization/language_constants.dart';
import 'helper/routes.dart';
import 'state/appState.dart';
import 'package:provider/provider.dart';
import 'state/authState.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              valueColor: AlwaysStoppedAnimation<Color>(CcpColor.primary)),
        ),
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
          ChangeNotifierProvider<FeedState>(create: (_) => FeedState()),
          ChangeNotifierProvider<ChatState>(create: (_) => ChatState()),
          ChangeNotifierProvider<SearchState>(create: (_) => SearchState()),
          ChangeNotifierProvider<NotificationState>(create: (_) => NotificationState()),
        ],
        child: MaterialApp(
          title: 'CCP',
          theme: AppTheme.apptheme.copyWith(
            textTheme: GoogleFonts.muliTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: [Locale("en", "US"), Locale("hi", "IN")],
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
          routes: Routes.route(),
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
          initialRoute: "SplashPage",
        ),
      );
    }
  }
}
