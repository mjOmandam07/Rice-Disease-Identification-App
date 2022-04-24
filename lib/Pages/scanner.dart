import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  _scannerState createState() => _scannerState();
}


class _scannerState extends State<scanner> {

  File ? imageFile;


  @override
  void initState() {
    setState(() {
      imageFile = null;
    });
  }


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
                    //Top Part
                    SizedBox(height: 5.h),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 3.w),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              'Select Scan',
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
                              'Option',
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
                    // Photo holder part
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top:0),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            if (imageFile != null)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                                width: 100.w,
                                height: 46.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        3, 135, 96, 0.7686274509803922),
                                    image: DecorationImage(
                                        image:  FileImage(imageFile!)
                                    ),
                                    border: Border.all(width: 1.w, color: Colors.black12),
                                    borderRadius: BorderRadius.circular(12.0)
                                ),
                              )
                            else
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                                width: 100.w,
                                height: 46.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        3, 135, 96, 0.7686274509803922),
                                    border: Border.all(width: 1.w, color: Colors.black12),
                                    borderRadius: BorderRadius.circular(12.0)
                                ),
                              ),


                            //Buttons Part
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 9.h,
                                        width: 20.w,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              getImage(source: ImageSource.camera);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.grey[900],
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )
                                            ),
                                            child: Transform.scale(
                                                scale: 1.2,
                                                child: Image.asset('assets/camera.png')
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 1.h, top: 1.5.h),
                                        child: Text(
                                          'Take Picture',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 9.h,
                                        width: 20.w,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              getImage(source: ImageSource.gallery);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.grey[900],
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )
                                            ),
                                            child: Transform.scale(
                                                scale: 1.2,
                                                child: Image.asset('assets/add-photo.png')
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 1.h, top: 1.5.h),
                                        child: Text(
                                          'Select Image',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 2.h,
                            ),
                            if (imageFile != null)
                              Column(
                                children: [
                                  SizedBox(
                                  height: 10.h,
                                  width: 50.w,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        print('Scanner img: ${imageFile}');
                                        Navigator.pushNamed(
                                            context,
                                            '/selectModel',
                                            arguments: {
                                              'image': imageFile,
                                            });
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
                                        'Next',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(3, 135, 96, 1.0),
                                            fontSize: 16.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                            ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: SizedBox(
                                      height: 6.h,
                                      width: 35.w,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            setState(() {
                                              imageFile = null;
                                            });
                                            print(imageFile);
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
                                            'Clear Image',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(3, 135, 96, 1.0),
                                                fontSize: 12.sp,
                                                fontFamily: 'Montserrat',

                                            ),
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )
                            else
                              SizedBox(
                              height: 12.h,
                              width: 70.w
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
    });

  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source:source);

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
