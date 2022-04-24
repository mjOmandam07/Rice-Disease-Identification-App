import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  int slide_index = 0;

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
                                          Navigator.pushNamed(context, '/diseases');
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
                                          Navigator.pushNamed(context, '/about');
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
                                    showDialog(
                                      context:context,
                                      builder: (BuildContext context) {
                                        return  Dialog(
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            width: 100.w,
                                            height: 60.h ,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1.h),
                                                  child: Container(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      'How to use the app?',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.sp,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight: FontWeight.w700
                                                      ),
                                                    ),
                                                    ),
                                                ),
                                                Expanded(
                                                    flex: 7,
                                                    child:
                                                          CarouselSlider(
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
                                                                  margin: EdgeInsets.only(bottom: 1.h),
                                                                  height: 40.h,
                                                                  width: 78.w,
                                                                  decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(
                                                                          18,
                                                                          226,
                                                                          163,
                                                                          1.0),
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
                                                                      children: [
                                                                        SizedBox(height: 2.h),
                                                                        Align(
                                                                          alignment: Alignment.topLeft,
                                                                          child: Text(
                                                                            'Step 1:',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 22.sp,
                                                                                fontFamily: 'Montserrat',
                                                                                fontWeight: FontWeight.w700
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Center(
                                                                          child: Padding(
                                                                            padding: EdgeInsets.only(top: 4.h),
                                                                            child: Container(
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(1.w),
                                                                                child: Container(
                                                                                  height: 15.h,
                                                                                  width: 35.w,
                                                                                  decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                      image: AssetImage('assets/scan.png'),
                                                                                      fit: BoxFit.fill
                                                                                    )
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.h,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Text(
                                                                            'Select the Scanner button in the home menu.',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15.sp,
                                                                                fontFamily: 'Montserrat',
                                                                            ),
                                                                          ),
                                                                        ),

                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.all(1.w),
                                                                child: Container(
                                                                margin: EdgeInsets.only(bottom: 1.h),
                                                                height: 40.h,
                                                                width: 78.w,
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(
                                                                        18,
                                                                        226,
                                                                        163,
                                                                        1.0),
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
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 2.h,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.topLeft,
                                                                        child: Text(
                                                                          'Step 2:',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 22.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 4.h),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Column(
                                                                        children: [
                                                                          Container(
                                                                          decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                                                          ),
                                                                          child: Padding(
                                                                              padding: EdgeInsets.all(1.w),
                                                                              child: Container(
                                                                                height: 6.h,
                                                                                width: 15.w,
                                                                                decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                        image: AssetImage('assets/camera.png'),
                                                                                        fit: BoxFit.fill
                                                                                    )
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ),
                                                                          SizedBox(height: 1.h),
                                                                          Text('Take Picture \n using Camera',
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontFamily: 'Montserrat',
                                                                            ),
                                                                            textAlign: TextAlign.center,
                                                                          )
                                                                        ],
                                                                      ),
                                                                          SizedBox(width: 2.w),
                                                                          Column(
                                                                            children: [
                                                                              Container(
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(1.w),
                                                                                    child: Container(
                                                                                      height: 6.h,
                                                                                      width: 15.w,
                                                                                      decoration: BoxDecoration(
                                                                                          image: DecorationImage(
                                                                                              image: AssetImage('assets/add-photo.png'),
                                                                                              fit: BoxFit.fill
                                                                                          )
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                              SizedBox(height: 1.h),
                                                                              Text('Select Image \n from Gallery',
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontFamily: 'Montserrat',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ]
                                                                      ),
                                                                      SizedBox(
                                                                        height: 4.h,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          'Choose your option for scanning. You can use your camera for taking picture of the rice leaf or select stock images from your Gallery.',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 12.sp,
                                                                            fontFamily: 'Montserrat',
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ),
                                                            ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.all(1.w),
                                                                child: Container(
                                                                margin: EdgeInsets.only(bottom: 1.h),
                                                                height: 40.h,
                                                                width: 78.w,
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(
                                                                        18,
                                                                        226,
                                                                        163,
                                                                        1.0),
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
                                                                    children: [
                                                                      SizedBox(height: 2.h),
                                                                      Align(
                                                                        alignment: Alignment.topLeft,
                                                                        child: Text(
                                                                          'Step 3:',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 22.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 4.h),
                                                                      Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                Container(
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(1.w),
                                                                                      child: Container(
                                                                                        height: 6.h,
                                                                                        width: 25.w,
                                                                                        child:Center(
                                                                                          child: Text(
                                                                                            'Clear Image',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(
                                                                                              color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                                              fontFamily: 'Montserrat',

                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ),
                                                                                    )
                                                                                ),
                                                                                SizedBox(height: 1.h),
                                                                                Text('Clear Image \n Button',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'Montserrat',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            SizedBox(width: 2.w),
                                                                            Column(
                                                                              children: [
                                                                                Container(
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(1.w),
                                                                                      child: Container(
                                                                                          height: 6.h,
                                                                                          width: 25.w,
                                                                                          child:Center(
                                                                                            child: Text(
                                                                                              'Next',
                                                                                              textAlign: TextAlign.center,
                                                                                              style: TextStyle(
                                                                                                color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                                                fontFamily: 'Montserrat',
                                                                                                  fontWeight: FontWeight.bold
                                                                                              ),
                                                                                            ),
                                                                                          )
                                                                                      ),
                                                                                    )
                                                                                ),
                                                                                SizedBox(height: 1.h),
                                                                                Text('Scan Image \n Button',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'Montserrat',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ]
                                                                      ),
                                                                      SizedBox(
                                                                        height: 4.h,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          'If not sure of the selected image, or the selected image is a mistake, you can always clear the image field and select again. If the selected image is the desired image for scanning, tap on the Next button.',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 11.sp,
                                                                            fontFamily: 'Montserrat',
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ),
                                                            ),
                                                              ),
                                                              Padding(
                                                              padding: EdgeInsets.all(1.w),
                                                              child: Container(
                                                                margin: EdgeInsets.only(bottom: 1.h),
                                                                height: 40.h,
                                                                width: 78.w,
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(
                                                                        18,
                                                                        226,
                                                                        163,
                                                                        1.0),
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
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 2.h,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.topLeft,
                                                                        child: Text(
                                                                          'Step 4:',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 22.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 2.h),
                                                                      Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                Container(
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(1.w),
                                                                                      child: Container(
                                                                                        height: 6.h,
                                                                                        width: 15.w,
                                                                                        decoration: BoxDecoration(
                                                                                            image: DecorationImage(
                                                                                                image: AssetImage('assets/phil.png'),
                                                                                                fit: BoxFit.fill
                                                                                            )
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                ),
                                                                                SizedBox(height: 1.h),
                                                                                Text('Philippine Model',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'Montserrat',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            SizedBox(width: 1.w),
                                                                            Column(
                                                                              children: [
                                                                                Container(
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(1.w),
                                                                                      child: Container(
                                                                                        height: 6.h,
                                                                                        width: 15.w,
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            'K',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(
                                                                                                color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                                                fontSize: 20.sp,
                                                                                                fontFamily: 'Montserrat',
                                                                                                fontWeight: FontWeight.w700
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                ),
                                                                                SizedBox(height: 1.h),
                                                                                Text('Kaggle Model',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'Montserrat',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ]
                                                                      ),
                                                                      SizedBox(width: 1.w),
                                                                      Column(
                                                                        children: [
                                                                          Container(
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(1.w),
                                                                                child: Container(
                                                                                  height: 6.h,
                                                                                  width: 15.w,
                                                                                  decoration: BoxDecoration(
                                                                                      image: DecorationImage(
                                                                                          image: AssetImage('assets/scan.png'),
                                                                                          fit: BoxFit.fill
                                                                                      )
                                                                                  ),
                                                                                ),
                                                                              )
                                                                          ),
                                                                          SizedBox(height: 1.h),
                                                                          Text('Use both Model and Compare',
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontFamily: 'Montserrat',
                                                                            ),
                                                                            textAlign: TextAlign.center,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 2.h,),

                                                                      Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          'Choose model to use. These model are trained using collected images of rice leaf under the effects of rice diseases from Philippine and online sources.'
                                                                              'Or run both model and compare result.',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 11.sp,
                                                                            fontFamily: 'Montserrat',
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                              Padding(
                                                                padding: EdgeInsets.all(1.w),
                                                                child: Container(
                                                                margin: EdgeInsets.only(bottom: 1.h),
                                                                height: 40.h,
                                                                width: 78.w,
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(
                                                                        18,
                                                                        226,
                                                                        163,
                                                                        1.0),
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
                                                                    children: [
                                                                      SizedBox(height: 2.h),
                                                                      Align(
                                                                        alignment: Alignment.topLeft,
                                                                        child: Text(
                                                                          'Step 5:',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 22.sp,
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w700
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Center(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.only(top: 4.h),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                                                            ),
                                                                            child: Padding(
                                                                              padding: EdgeInsets.all(1.w),
                                                                              child: Container(
                                                                                height: 15.h,
                                                                                width: 40.w,
                                                                                decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                        image: AssetImage('assets/results.jpg'),
                                                                                        fit: BoxFit.fill
                                                                                    )
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 4.h,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          'After classifying, it shows the top three diseases that has the highest confidence. Then you are given an option to scan again or return to homepage by tapping on the Done button.',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 12.sp,
                                                                            fontFamily: 'Montserrat',
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ),
                                                            ),
                                                              ),
                                                          ],
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
      );
    });
  }
}
