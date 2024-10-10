import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class localControler with ChangeNotifier{
  Locale? _locale;
  Locale? get locale=>_locale;

  void changeLanguage(Locale type)async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    _locale=type;
    if(type==Locale('en')){
      await sp.setString('languageCode', 'en');

    }else{
      await sp.setString('languageCode', 'es');

    }
    notifyListeners();
  }

}