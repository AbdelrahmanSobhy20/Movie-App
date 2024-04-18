import 'package:flutter/material.dart';

class BookmarkProvider with ChangeNotifier {
  bool isSelected = false;
  IconData bookmark = Icons.bookmark_border_rounded;
   void selectedMovie(String id){
     if(isSelected == false){
       isSelected = true;
       bookmark = Icons.bookmark_outlined;
     }else{
       isSelected = false;
       bookmark = Icons.bookmark_border_rounded;
     }
     notifyListeners();
   }



}
