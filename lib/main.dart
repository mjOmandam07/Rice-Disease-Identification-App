import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Pages/splash.dart';
import 'package:rice_disease_detection/Pages/home.dart';
import 'package:rice_disease_detection/Pages/scanner.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const splash(),
      '/home': (context) => const home(),
      '/scan': (context) => const scanner(),
    },
  ));
}



