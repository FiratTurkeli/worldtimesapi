import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtimeapi/constants/dimensions.dart';
import 'package:worldtimeapi/view/home/home.dart';

import 'constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late double width ;
  late double height ;
  late double top;
  late double bottom;
  late double right;
  late double left;



  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    width = Dimensions().getScreenWidth(context)*0.89;
    height = Dimensions().getScreenHeight(context)*0.189;
    top = Dimensions().getScreenWidth(context)*0.48;
    bottom = Dimensions().getScreenWidth(context)*0.48;
    right = Dimensions().getScreenWidth(context)*0.058;
    left = Dimensions().getScreenWidth(context)*0.058;
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: myDarkBlue
        ),
      ),
      backgroundColor: myDarkBlue,
      body: Stack(
        children: [
          Positioned(
            top: top,
            bottom: bottom,
            right: right,
            left: left,
            child: Image.asset(
                "images/DOP.png",
                width: width,
                height: height
            ),
          ),
        ],
      ),
    );
  }
}
