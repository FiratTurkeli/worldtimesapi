library second_screen;

import 'package:flutter/material.dart';
import 'package:worldtimeapi/constants/text_styles.dart';
import '../../constants/colors.dart';
import '../../models/world_time_model.dart';
import '../../view_model/second_view_model.dart';

part 'components/second_view_header.dart';
part 'components/second_view_body.dart';

class SecondView extends SecondViewModel {
  SecondView({required super.time});


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SecondViewHeader(theme: Theme.of(context).textTheme.bodyText2?.color ),
            SecondViewBody(worldTime: selectedtime,),
          ],
        ),
      );
    }
  }
