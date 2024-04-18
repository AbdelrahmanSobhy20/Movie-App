import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/core/theme/dark_theme.dart';
import 'package:movie_app_indvidual/core/theme/light_theme.dart';

class HomeProvider extends ChangeNotifier{
  Icon mode = const Icon(Icons.nightlight , size: 40,);
  ThemeData themData = darkTheme;
  void toggleTheme(){
    if(themData == darkTheme){
      themData = lightTheme;
      mode = const Icon(Icons.sunny , size: 40,);
    }else{
      themData = darkTheme;
      mode = const Icon(Icons.nightlight , size: 40,);
    }
    notifyListeners();
  }

}