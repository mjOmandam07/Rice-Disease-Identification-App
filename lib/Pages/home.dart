import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
              children: [
                SizedBox(height: 80),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 80),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              'Scan Rice Leaf',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                              ),
                            ),
                        ),
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: ElevatedButton(
                              onPressed: (){
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shadowColor: Colors.grey[900],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                              child: Image.asset('assets/scan.png')
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 30, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Rice Diseases',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ElevatedButton(
                                      onPressed: (){
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey[900],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      ),
                                      child: Image.asset('assets/diseases.png')
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 8.0, 8.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'About the App',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ElevatedButton(
                                      onPressed: (){
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey[900],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      ),
                                      child: Image.asset('assets/about.png')
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(bottom: 10, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat'
                                ), child: AnimatedTextKit(
                                animatedTexts: [
                                  FadeAnimatedText(
                                    'Help',
                                      duration: Duration(milliseconds: 5000)
                                  )
                                ],
                                  pause: const Duration(milliseconds: 5000),
                                  repeatForever:true
                              ),
                              )
                            )
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: ElevatedButton(
                                onPressed: (){
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.grey[900],
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100)
                                    )
                                ),
                                child: Image.asset('assets/help.png')
                            ),
                          ),
                        ],
                      ),
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


