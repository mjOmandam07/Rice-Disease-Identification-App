import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_disease_detection/Pages/result.dart';
import 'package:rice_disease_detection/Pages/splash.dart';
import 'package:rice_disease_detection/Pages/home.dart';
import 'package:rice_disease_detection/Pages/scanner.dart';
import 'package:rice_disease_detection/Pages/result.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(MaterialApp(
                                      initialRoute: '/',
                                      routes: {
                                                '/': (context) => const splash(),
                                            '/home': (context) => const home(),
                                            '/scan': (context) => const scanner(),
                                            '/analyze': (context) => const analysis()
                                              },
                                      )
                          ),
            );

}



