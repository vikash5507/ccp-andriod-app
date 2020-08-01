import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  //Locale _locale;
  bool _isBusy;
  bool get isbusy => _isBusy;
  //Locale get locale => _locale;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }

  set setpageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  // set setLocale(String languageCode) {
  //   _locale = _constructlocale(languageCode);
  //   notifyListeners();
  // }

  // Locale _constructlocale(String languageCode) {
  //   switch (languageCode) {
  //     case ENGLISH:
  //       return Locale(ENGLISH, 'US');
  //     case HINDI:
  //       return Locale(HINDI, "IN");
  //     default:
  //       return Locale(ENGLISH, 'US');
  //   }
  // }
}
