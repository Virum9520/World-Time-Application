import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/choose_location.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';


void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}



