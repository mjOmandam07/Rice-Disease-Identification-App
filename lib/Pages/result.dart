import 'package:sizer/sizer.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rice_disease_detection/services/classifier.dart';
import 'dart:io';


class analysis extends StatefulWidget {
  const analysis({Key? key}) : super(key: key);

  @override
  _analysisState createState() => _analysisState();
}
  Map data = {};

class _analysisState extends State<analysis> {
  final Classifier classifier = Classifier();

  File? image;

  var result_1;
  var result_2;
  var result_3;
  var outputs;


  Future timer() async {
    await Future.delayed(Duration(seconds: 0), () {
      image = data['image'];
      classifier.classifyImage(image);

    });
    return image;
    // try {
    //   classify();
    // } catch(e) {
    //   print(e);
    // }
    // return image;
  }

  Future classify() async {
    await Future.delayed(Duration(seconds: 2), () async{
      try {
        image = data['image'];
        outputs = await classifier.classifyImage(image);
        print(outputs);
        result_1 = outputs[0];
        result_2 = outputs[1];
        result_3 = outputs[2];
      } catch(e) {
        print(e);
      }
    });
    return image;
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
            data = {};
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
                  SizedBox(height: 5.h),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 3.w),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            'Disease',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 0, top: 3.h, left: 1.w),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            'Analysis',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.sp,
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
                        child: Container(
                                  margin: EdgeInsets.only(top:0),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Container(
                                          child: FutureBuilder <dynamic> (builder: (context, snapshot) {
                                            if (ConnectionState.active != null  && !snapshot.hasData){
                                              return Padding(
                                                padding: EdgeInsets.only (top: 5.h),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      SpinKitRing(
                                                        color: Color.fromRGBO(9, 106, 79, 1.0),
                                                        size: 20.w,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 2.h),
                                                        child: Center(
                                                          child: Text(
                                                            'Analyzing Disease',
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 15.sp,
                                                                fontFamily: 'Montserrat',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                            else{
                                              return Column(
                                                children: [
                                                  Container(
                                                          margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                                                          width: 100.w,
                                                          height: 46.h,
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Color.fromRGBO(
                                                                  3, 135, 96, 0.7686274509803922),
                                                              image: DecorationImage(
                                                                  image:  FileImage(image!)
                                                              ),
                                                              border: Border.all(width: 1.w, color: Colors.black12),
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          ),
                                                        ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 2.h),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          '${result_1['disease']}: ${result_1['confidence']}%',
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(
                                                                  50, 50, 50,
                                                                  1.0),
                                                              fontSize: 18.sp,
                                                              fontFamily: 'Montserrat',
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 2.h),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          '${result_2['disease']}: ${result_2['confidence']}%',
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(
                                                                  50, 50, 50,
                                                                  1.0),
                                                              fontSize: 18.sp,
                                                              fontFamily: 'Montserrat',
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 2.h),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          '${result_3['disease']}: ${result_3['confidence']}%',
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(
                                                                  50, 50, 50,
                                                                  1.0),
                                                              fontSize: 18.sp,
                                                              fontFamily: 'Montserrat',
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 3.h),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: 8.h,
                                                          width: 40.w,
                                                          child: ElevatedButton(
                                                              onPressed: (){
                                                                data.clear();
                                                                Navigator.of(context).pop();
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  primary: Colors.white,
                                                                  shadowColor: Colors.grey[900],
                                                                  elevation: 10,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  )
                                                              ),
                                                              child: Text(
                                                                'Scan Again',
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                    fontSize: 14.sp,
                                                                    fontFamily: 'Montserrat',
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              )
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8.h,
                                                          width: 40.w,
                                                          child: ElevatedButton(
                                                              onPressed: (){

                                                                data.clear();
                                                                Navigator.of(context).popUntil((route) => route.settings.name == "/home");
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  primary: Colors.white,
                                                                  shadowColor: Colors.grey[900],
                                                                  elevation: 10,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  )
                                                              ),
                                                              child: Text(
                                                                'Done',
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    color: Color.fromRGBO(3, 135, 96, 1.0),
                                                                    fontSize: 14.sp,
                                                                    fontFamily: 'Montserrat',
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              )
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )

                                                ],
                                              );
                                            }
                                        },
                                        future: classify(),
                                        )
                                      ),


                                    ],
                                  ),
                      )
                  )
                  )
                ],
              ),
            ),

          ],
        ),
      ));
    });
  }
}


