import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Container(
              child: Column(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      margin: EdgeInsets.all(0),
                      color: Color.fromRGBO(18, 226, 163, 1),
                      height: 90.h,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Column(children: [
              SizedBox(height: 10.h),
              // Top Part
              Container(
                  alignment: Alignment.topLeft,

                  ///margin: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1.w, 0, 0, 0),
                        child: Text(
                          'About the App',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  )),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(bottom: 3.h),
                padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                child: Image.asset('assets/farmer.png'),
              ),

              Container(
                  alignment: Alignment.center,

                  ///margin: EdgeInsets.only(bottom: 10.h),
                  padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                  child: Text(
                    'Rice Disease Detection App is a mobile application that detects rice leaf diseases using MobileNet transfer learning model and give appropriate solutions to cure the said disease. Information about different rice leaf diseases can be access in the "Rice Disease" option of the app. The app is user friendly and a great help towards the farmers.',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  )),
            ]))
          ]));
    });
  }
}
