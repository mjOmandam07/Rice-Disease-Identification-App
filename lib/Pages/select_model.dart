import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class select_model extends StatefulWidget {
  const select_model({Key? key}) : super(key: key);

  @override
  _select_modelState createState() => _select_modelState();
}
  Map data = {};
class _select_modelState extends State<select_model> {
  int slide_index = 0;

  File? imageFile;

  @override
  void initState() {
    setState(() {
      data.clear();
      imageFile = null;
    });
  }


  void selectModel(model) async {
    imageFile = data['image'];
    print('Select Model img: ${imageFile}');
    Navigator.pushNamed(
        context,
        '/analyze',
        arguments: {
          'image': imageFile,
          'model': model,
        });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute
        .of(context)!
        .settings
        .arguments as Map;

    return Sizer(builder:(context, orientation, deviceType) {
      return WillPopScope(
          onWillPop: () async {
            data.clear();
            Navigator
                .of(context)
                .pop;
            return true;
          },
      child: Scaffold(
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
                      margin: EdgeInsets.only(bottom: 12.h),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                        child: Text(
                          'Select Model',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                    // About and Rice Diseases library Part
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
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
                                    'Philippine Model',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                  width: 30.w,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        selectModel('Philippine');
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey[900],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      ),
                                      child: Image.asset('assets/phil.png')
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
                                    'Kaggle Model',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                  width: 30.w,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        selectModel('Kaggle');
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey[900],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      ),
                                      child: Center(
                                        child: Text(
                                          'K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(3, 135, 96, 1.0),
                                            fontSize: 40.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: Text(
                                    'Use and Compare Both Model',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                  width: 30.w,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        selectModel('both');
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
                                  showDialog(
                                      context:context,
                                      builder: (BuildContext context) {
                                        return  Dialog(
                                            backgroundColor: Color.fromRGBO(18, 226, 163, 1.0),
                                            child: Container(
                                              width: 100.w,
                                              height: 50.h ,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 7,
                                                      child:
                                                      Container(
                                                        child: CarouselSlider(
                                                          options: CarouselOptions(
                                                              height: double.maxFinite,
                                                              viewportFraction: 1,
                                                              onPageChanged: (index, reason) {
                                                                setState(() {
                                                                  slide_index = index;
                                                                }
                                                                );
                                                              }
                                                          ), items: [
                                                          Padding(
                                                            padding: EdgeInsets.all(1.w),
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(vertical:2.h, horizontal: 3.w),
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors.grey,
                                                                        offset: const Offset(
                                                                            1.0,
                                                                            5.0
                                                                        ),
                                                                        blurRadius: 10.0,
                                                                        spreadRadius:2.0
                                                                    ),
                                                                  ]
                                                              ),
                                                              child: Padding(
                                                                padding:  EdgeInsets.all(1.w),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(top: 1.h),
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    offset: const Offset(
                                                                                        1.0,
                                                                                        5.0
                                                                                    ),
                                                                                    blurRadius: 5.0,
                                                                                    spreadRadius: 2.0
                                                                                ),
                                                                              ]
                                                                          ),
                                                                          child: Padding(
                                                                            padding: EdgeInsets.all(1.w),
                                                                            child: Container(
                                                                              height: 15.h,
                                                                              width: 35.w,
                                                                              decoration: BoxDecoration(
                                                                                  image: DecorationImage(
                                                                                      image: AssetImage('assets/phil.png'),
                                                                                      fit: BoxFit.fill
                                                                                  ),

                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 2.h,
                                                                    ),
                                                                    Center(
                                                                      child: RichText(text: TextSpan(
                                                                          text: 'Philippine Model',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700),

                                                                          children: [
                                                                            TextSpan(
                                                                                text: ' is trained using collected images of rice leaf under the effects of rice diseases from previous studies and research institutes in the agricultural sector in the Philippines.',
                                                                                style: TextStyle(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontWeight: FontWeight.normal
                                                                                )
                                                                            )
                                                                          ]
                                                                      ), textAlign: TextAlign.center),
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.all(1.w),
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(vertical:2.h, horizontal: 3.w),
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors.grey,
                                                                        offset: const Offset(
                                                                            1.0,
                                                                            5.0
                                                                        ),
                                                                        blurRadius: 10.0,
                                                                        spreadRadius:2.0
                                                                    ),
                                                                  ]
                                                              ),
                                                              child: Padding(
                                                                padding:  EdgeInsets.all(1.w),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(top: 1.h),
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    offset: const Offset(
                                                                                        1.0,
                                                                                        5.0
                                                                                    ),
                                                                                    blurRadius: 5.0,
                                                                                    spreadRadius: 2.0
                                                                                ),
                                                                              ]
                                                                          ),
                                                                          child: Padding(
                                                                            padding: EdgeInsets.all(1.w),
                                                                            child: Container(
                                                                              height: 15.h,
                                                                              width: 35.w,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    'K',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                        color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                                        fontSize: 40.sp,
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontWeight: FontWeight.w700
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 2.h,
                                                                    ),
                                                                    Center(
                                                                      child: RichText(text: TextSpan(
                                                                          text: 'Kaggle Model',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700),

                                                                          children: [
                                                                            TextSpan(
                                                                                text: ' is trained using collected images of rice leaf under the effects of rice diseases from Kaggle.com which is a repository for datasets.',
                                                                                style: TextStyle(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontWeight: FontWeight.normal
                                                                                )
                                                                            )
                                                                          ]
                                                                      ), textAlign: TextAlign.center),
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        ),
                                                      )
                                                  )
                                                ],
                                              ),

                                            )
                                        );
                                      }
                                  );
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
      ));
    });
  }
}
