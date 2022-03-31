import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detection/Clipper/clipper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:rice_disease_detection/services/rice_diseases.dart';

class disease extends StatefulWidget {
  const disease({Key? key}) : super(key: key);

  @override
  _diseaseState createState() => _diseaseState();
}

class _diseaseState extends State<disease> {
  Future loadAsset() async {
    riceDiseases instance = riceDiseases();
    var diseases = await instance.getAll();
    return diseases;
  }

  void selectDisease(disease_name) async {
    riceDiseases instance = riceDiseases(name: disease_name);
    await instance.getDisease();
    Navigator.pushNamed(context, '/selected', arguments: {
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'images': instance.images,
      'cause': instance.cause,
      'causeDescription': instance.causeDescription,
      'solution': instance.solution,
      'solutionDescription': instance.solutionDescription
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(18, 226, 163, 1),
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
                    margin: EdgeInsets.only(bottom: 2.h),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                        child: Text('Rice Diseases',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700)))),
                Container(
                    child: FutureBuilder<dynamic>(
                  builder: (context, snapshot) {
                    if (ConnectionState.active != null && !snapshot.hasData) {
                      return SpinKitRing(
                        color: Color.fromRGBO(9, 106, 79, 1.0),
                        size: 20.w,
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 2.w),
                              height: 12.h,
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: ListTile(
                                    onTap: () {
                                      selectDisease(
                                          snapshot.data[index]['name']);
                                    },
                                    leading: Container(
                                      child: Image.asset(
                                          'assets/${snapshot.data[index]['image']}'),
                                    ),
                                    title: Text(
                                      snapshot.data[index]['name'],
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                      );
                    }
                  },
                  future: loadAsset(),
                ))
              ],
            )),
          ],
        ),
      );
    });
  }
}
