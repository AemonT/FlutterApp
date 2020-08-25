import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/landing_page.dart';

///random test comment
void main(){
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(new MaterialApp(
    home: new HomeScreen(),
  ));
}