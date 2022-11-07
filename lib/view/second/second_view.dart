library second_screen;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:worldtimeapi/constants/text_styles.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../models/world_time_model.dart';
import '../../view_model/second_view_model.dart';

part 'components/second_view_header.dart';
part 'components/second_view_body.dart';

class SecondView extends SecondViewModel {
  SecondView({required super.time});
    late double screenWidth;
    late double screenHeight;
  late double appBarHeight;


  @override
    Widget build(BuildContext context) {
      screenHeight = Dimensions().getScreenHeight(context);
      screenWidth = Dimensions().getScreenWidth(context);
      appBarHeight = Dimensions().getScreenHeight(context)*(111/812); // The proportions of the dimensions given in the figma file

      return Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.hardEdge,
            children: [
              selectedtime == null ?
              Center(child:CircularProgressIndicator(color: Theme.of(context).textTheme.bodyText2!.color,) ,) :
              SecondViewBody(worldTime: selectedtime,),    //appBar
              SecondViewHeader(theme: Theme.of(context).textTheme.bodyText2?.color ),
            ],
          ),
        ),
      );
    }

  }
