import 'package:flutter/material.dart';


List<BoxShadow>  shadow = <BoxShadow>[BoxShadow(blurRadius: 10,offset: Offset(5, 5),color: AppTheme.apptheme.accentColor,spreadRadius:1)];
String get description { return '';}
TextStyle get onPrimaryTitleText { return  TextStyle(color: Colors.white,fontWeight: FontWeight.w600);}
TextStyle get onPrimarySubTitleText { return  TextStyle(color: CcpColor.primary,);}
BoxDecoration softDecoration =  BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 8,offset: Offset(5, 5),color: Color(0xffe2e5ed),spreadRadius:5),
              BoxShadow(blurRadius: 8,offset: Offset(-5,-5),color: Color(0xffffffff),spreadRadius:5)
              ],
              color: Color(0xfff1f3f6)
          );
TextStyle get titleStyle { return  TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold,);}
TextStyle get subtitleStyle { return  TextStyle(color: AppColor.darkGrey,fontSize: 14,fontWeight: FontWeight.bold);}
TextStyle get userNameStyle { return  TextStyle(color: AppColor.darkGrey,fontSize: 14,fontWeight: FontWeight.bold);}
TextStyle get textStyle14 { return  TextStyle(color: AppColor.darkGrey,fontSize: 14,fontWeight: FontWeight.bold);}

TextStyle get appTopBarTextStyle { return TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w600,
  color: CcpColor.primary,
);}

TextStyle get bodyHeadingTextStyle { return TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w600,
  color: CcpColor.black,
);}

TextStyle get bodySmallHeadingTextStyle { return TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: CcpColor.black,
);}

TextStyle get bodyBigTextStyle { return TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w300,
  color: CcpColor.black,
);}

class TwitterColor {
  static final Color bondiBlue = Color.fromRGBO(0, 132, 180, 1.0);
  static final Color cerulean = Color.fromRGBO(0, 172, 237, 1.0);
  static final Color spindle = Color.fromRGBO(192, 222, 237, 1.0);
  static final Color white = Color.fromRGBO(255, 255, 255, 1.0);
  static final Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static final Color woodsmoke = Color.fromRGBO(20, 23, 2, 1.0);
  static final Color woodsmoke_50 = Color.fromRGBO(20, 23, 2, 0.5);
  static final Color mystic = Color.fromRGBO(230, 236, 240, 1.0);
  static final Color dodgetBlue = Color.fromRGBO(29, 162, 240, 1.0);
  static final Color dodgetBlue_50 = Color.fromRGBO(29, 162, 240, 0.5);
  static final Color paleSky = Color.fromRGBO(101, 119, 133, 1.0);
  static final Color ceriseRed = Color.fromRGBO(224, 36, 94, 1.0);
  static final Color paleSky50 = Color.fromRGBO(101, 118, 133, 0.5);
}

class CcpColor {
  static final Color primary = Color(0xff4863B7);
  static final Color secondary = Color(0xff14171A);
  static final Color darkGrey = Color(0xff1657786);
  static final Color lightGrey = Color(0xffAAB8C2);
  static final Color extraLightGrey = Color(0xffE1E8ED);
  static final Color extraExtraLightGrey = Color(0xfF5F8FA);
  static final Color white = Color(0xFFffffff);
  static final Color black = Color(0xff000000);
}

class AppColor{
  static final Color primary = Color(0xff1DA1F2);
  static final Color secondary = Color(0xff14171A);
  static final Color darkGrey = Color(0xff1657786);
  static final Color lightGrey = Color(0xffAAB8C2);
  static final Color extraLightGrey = Color(0xffE1E8ED);
  static final Color extraExtraLightGrey = Color(0xfF5F8FA);
  static final Color white = Color(0xFFffffff);
}
class AppTheme{
  static final ThemeData apptheme = ThemeData(
    primarySwatch: Colors.blue,
    // fontFamily: 'HelveticaNeue',
    backgroundColor: CcpColor.white,
    accentColor: CcpColor.primary,
    brightness: Brightness.light,
    primaryColor: CcpColor.primary,
    cardColor: Colors.white,
    unselectedWidgetColor: Colors.grey,
    bottomAppBarColor: Colors.white,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: CcpColor.white
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: CcpColor.white,
      iconTheme: IconThemeData(color: CcpColor.primary,),
      elevation: 0,
      textTheme:  TextTheme(
        title: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontStyle: FontStyle.normal),
        )),
        tabBarTheme: TabBarTheme(
          labelStyle: titleStyle.copyWith(color: CcpColor.primary),
          unselectedLabelColor: AppColor.darkGrey,
          unselectedLabelStyle: titleStyle.copyWith(color: CcpColor.darkGrey),
          labelColor: CcpColor.primary,
          labelPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:   CcpColor.primary,
        ),
        colorScheme: ColorScheme(
          background: Colors.white,
          onPrimary: Colors.white,
          onBackground: Colors.black,
          onError: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          primary: Colors.blue,
          primaryVariant: Colors.blue,
          secondary: CcpColor.secondary,
          secondaryVariant: CcpColor.darkGrey,
          surface: Colors.white,
          brightness: Brightness.light
        )
    );
}