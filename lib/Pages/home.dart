import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder:(context, orientation, deviceType) {
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
                      height: 82.h,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    // Top Part
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                    //Scan Button Part
                    Expanded(
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Text(
                                  'Scan Rice Leaf',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 45.w,
                                child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/scan');
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
                    // About and Rice Diseases library Part
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 2.h),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      'Rice Diseases',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                    width: 30.w,
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
                              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      'About the App',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                    width: 30.w,
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
                    // Help Button Part
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(bottom: 1.h, right: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: SizedBox(
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
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
                            height: 7.h,
                            width: 15.w,
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
                  ],
                )
            ),

          ],
        ),
      );
    });

  }
}


