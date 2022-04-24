import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_disease_detection/Pages/select_model.dart';
import 'package:rice_disease_detection/Pages/splash.dart';
import 'package:rice_disease_detection/Pages/home.dart';
import 'package:rice_disease_detection/Pages/about.dart';
import 'package:rice_disease_detection/Pages/diseases.dart';
import 'package:rice_disease_detection/Pages/selected_disease.dart';
import 'package:rice_disease_detection/Pages/scanner.dart';
import 'package:rice_disease_detection/Pages/result.dart';
import 'package:rice_disease_detection/Pages/select_model.dart';


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
        '/diseases': (context) => const disease(),
        '/selected': (context) => const selected_disease(),
        '/scan': (context) => const scanner(),
        '/selectModel': (context) => const select_model(),
        '/analyze': (context) => const analysis()
      },
    )),
  );
}
