import 'package:flutter/material.dart';
import 'package:worldTimeApp/pages/choose_location.dart';
import 'package:worldTimeApp/pages/home.dart';
import 'package:worldTimeApp/pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context) => Loading(),
    '/home': (context) => Home(),
    '/location' :(contect) =>ChooseLocation()
  }
));

