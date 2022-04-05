import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_disease_detection/Pages/splash.dart';
import 'package:rice_disease_detection/Pages/home.dart';
import 'package:rice_disease_detection/Pages/about.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const splash(),
        '/home': (context) => const home(),
        '/about': (context) => const about(),

        //'/scan': (context) => const scanner(),
      },
    )),
  );
}
