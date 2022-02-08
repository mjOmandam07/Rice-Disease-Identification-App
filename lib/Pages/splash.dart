import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rice_disease_detection/services/sampleTimer.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  void startTimer() async {
      final Timer time = new Timer();
      await time.getTime();
      Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(66, 228, 9, 0.31), Color.fromRGBO(18, 226, 163, 1)]
                )
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Stack(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(

                            ),
                          ),
                          Expanded(
                              flex:3,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                                height: 410,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/glob.png'),
                                    fit: BoxFit.fill
                                  )
                                ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 550,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/farmer.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rice Disease Detection App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SpinKitRing(
                  color: Colors.white,
                  size: 60.0,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
