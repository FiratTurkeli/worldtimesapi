import 'package:flutter/material.dart';

class Dimensions {


  double getScreenHeight(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }

  double getScreenWidth(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.width;
    return screenHeight;
  }

}