import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';

class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  _scannerState createState() => _scannerState();
}

class _scannerState extends State<scanner> {
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
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 13),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            'Select Scan',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 50, top: 22, left: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            'Option',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 60,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 8.0, 20, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
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
                                      child: Image.asset('assets/camera.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                                  child: Text(
                                    'Take Photo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8.0, 8.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
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
                                      child: Image.asset('assets/add-photo.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                                  child: Text(
                                    'Select Photo from \nGallery',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
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
