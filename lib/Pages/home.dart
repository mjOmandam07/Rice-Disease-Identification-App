import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(18, 226, 163, 1),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    height: 700,
                  ),
                ),
                Expanded(
                  child: Container(

                  ),
                )
                
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red
                  ),
                ),
                Expanded(
                  child: Container(
                      // color: Colors.green
                  ),
                ),
                Expanded(
                  child: Container(
                      // color: Colors.blue
                  ),
                ),
              ],
            )
          ),

        ],
      ),
    );
  }
}


