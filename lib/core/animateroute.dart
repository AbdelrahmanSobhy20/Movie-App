import 'package:flutter/material.dart';

class SlideRightTransition extends PageRouteBuilder{
final page;
  SlideRightTransition({this.page})
    :super(
  pageBuilder:(context , animation , animationtwo)=> page,
transitionsBuilder: (context , animation , animationtwo , child){
    var begin = Offset(1,0);
    var end = Offset(0,0);
    var tween = Tween(begin: begin,end: end);
    var OffsetAnimation = animation.drive(tween);
    return SlideTransition(position: OffsetAnimation , child: child,);
},);

}