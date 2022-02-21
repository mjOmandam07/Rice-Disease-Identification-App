import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:image_picker/image_picker.dart';

class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  _scannerState createState() => _scannerState();
}

class _scannerState extends State<scanner> {

  File ? imageFile;

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
                  SizedBox(height: 50),
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
                        margin: EdgeInsets.only(bottom: 0, top: 22, left: 5),
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
                      margin: EdgeInsets.only(top:0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          if (imageFile != null)
                            Container(
                              margin: EdgeInsets.all(12.0),
                              width: 640,
                              height: 400,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    3, 135, 96, 0.7686274509803922),
                                image: DecorationImage(
                                 image:  FileImage(imageFile!)
                                ),
                                border: Border.all(width: 5, color: Colors.black12),
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                            )
                          else
                            Container(
                              margin: EdgeInsets.all(12.0),
                              width: 640,
                              height: 400,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      3, 135, 96, 0.7686274509803922),
                                  border: Border.all(width: 5, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12.0)
                              ),
                            ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(0),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       SizedBox(
                              //         height: 130,
                              //         width: 130,
                              //         child: ElevatedButton(
                              //             onPressed: (){
                              //               getImage(source: ImageSource.camera);
                              //             },
                              //             style: ElevatedButton.styleFrom(
                              //                 primary: Colors.white,
                              //                 shadowColor: Colors.grey[900],
                              //                 elevation: 10,
                              //                 shape: RoundedRectangleBorder(
                              //                     borderRadius: BorderRadius.circular(20)
                              //                 )
                              //             ),
                              //             child: Image.asset('assets/camera.png')
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                              //         child: Text(
                              //           'Take Photo',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //             fontFamily: 'Montserrat',
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 80,
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
                                      padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                                      child: Text(
                                        'Take Picture',
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
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 80,
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
                                      padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                                      child: Text(
                                        'Select Image',
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
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 100,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: (){
                                  getImage(source: ImageSource.gallery);
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
                                  'Scan Image',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(3, 135, 96, 1.0),
                                    fontSize: 25,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold
                                  ),
                                )
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

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source:source);

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
