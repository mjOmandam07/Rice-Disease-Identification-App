import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
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
          body: SingleChildScrollView(
            child: Stack(children: [
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
                SizedBox(height: 8.h),
                // Top Part
                Container(
                    alignment: Alignment.topLeft,
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
                  margin: EdgeInsets.only(bottom: 2.h),
                  padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  child: Image.asset('assets/farmer.png'),
                ),

                Container(
                    // color: Colors.red,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                    child: Column(
                      children: [
                        Text(
                          'Rice disease management is one of the paramount components in producing rice. And though the mapping technique of rice disease detection is relatively clear and easier to perform, it is possible to misinterpret some extremely similar diseases that have negative impacts on the growth of the rice. ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          height: 3.h
                        ),
                        RichText(text: TextSpan(
                          text: 'Rice Disease Identification App',
                          style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700),

                          children: [
                            TextSpan(
                              text: ' is a mobile application that aims to help farmers'
                                    ' on their Rice Crops production yields through minimizing the risk of '
                                    'misinterpretation of diseases that are extremely the same in appearance that may lead to misuse of medication.'
                                    '\n\nThe App features an image scanner that identifies different Rice Diseases using machine learning technologies,'
                                    'it also features a library of the Rice Diseases that shows information about the disease. \n\n'
                                    'The app aims to provide user friendly assistance to the farmers that could somehow impact their Rice Disease Management.',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal
                                  )
                            )
                          ]
                        )
                        ),

                        SizedBox(
                            height: 3.h
                        ),
                      ],
                    )
                ),
              ]
                  )
              )
            ]
            ),
          )
      );
    });
  }
}
