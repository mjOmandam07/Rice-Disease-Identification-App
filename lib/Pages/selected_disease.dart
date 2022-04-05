import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class selected_disease extends StatefulWidget {
  const selected_disease({Key? key}) : super(key: key);

  @override
  _selected_diseaseState createState() => _selected_diseaseState();
}

Map data = {};

class _selected_diseaseState extends State<selected_disease> {
  int slide_index = 0;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Sizer(builder: (context, orientation, deviceType) {
      return WillPopScope(
        onWillPop: () async {
          data = {};
          Navigator.of(context).pop;
          return true;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(18, 226, 163, 1),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.h),
                    child: Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.all(0),
                        height: 15.h,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white, width: 0.sp)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.white.withOpacity(1),
                                  Colors.white.withOpacity(.9),
                                  Colors.white.withOpacity(.5),
                                  Colors.white.withOpacity(.0)
                                ])),
                      ),
                    ),
                  ),
                  pinned: true,
                  expandedHeight: 60.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CarouselSlider(
                        options: CarouselOptions(
                            height: double.maxFinite,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 10),
                            onPageChanged: (index, reason) {
                              setState(() {
                                slide_index = index;
                              });
                            }),
                        items: [
                          for (var item = 0;
                              item < data['images'].length;
                              item++)
                            Container(
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/${data['images'][item]}'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.white, width: 0.sp))),
                        padding: EdgeInsets.symmetric(
                            vertical: 0.h, horizontal: 2.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                data['name'],
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 163, 118, 1.0),
                                    fontSize: 30.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 1.w, bottom: 2.h),
                              child: Text('${data['description']}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                data['cause'],
                                style: TextStyle(
                                  color: Color.fromRGBO(15, 163, 118, 1.0),
                                  fontSize: 15.sp,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 1.w, bottom: 2.h),
                              child: Text('${data['causeDescription']}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                data['solution'],
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 163, 118, 1.0),
                                    fontSize: 15.sp,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 1.w, bottom: 2.h),
                              child: Text('${data['solutionDescription']}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                  )),
                            ),
                          ],
                        )))
              ],
            )),
      );
    });
  }
}


// child: CarouselSlider(
//   options: CarouselOptions(
//       height: double.infinity,
//       viewportFraction: 1,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 10),
//       onPageChanged: (index, reason) {
//         setState(() {
//           slide_index = index;
//         }
//         );
//       }
//   ),
//     items: [
//       for(var item = 0; item <
//           data['images'].length; item++)
//         Container(
//           child: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.bottomRight,
//                     colors: [
//                       Colors.white.withOpacity(.9),
//                       Colors.grey.withOpacity(.0)
//                     ]
//                 )
//             ),
//           ),
//           margin: EdgeInsets.all(0),
//           decoration: BoxDecoration(
//               color: Colors.grey,
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/${data['images'][item]}'),
//                 fit: BoxFit.fill,
//               )
//           ),
//         ),
//
//     ]
// ),