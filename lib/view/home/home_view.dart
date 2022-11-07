library home_screen;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:worldtimeapi/constants/dimensions.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../database/theme_mode_provider.dart';
import '../../view_model/home_view_model.dart';
import '../second/second.dart';

part 'components/home_view_header.dart';
part 'components/home_view_body.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {

         return Consumer<ThemeModeProvider>(
             builder: (context, provider,child) {
             return Scaffold(
               appBar: AppBar(
                  toolbarHeight: 0,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).cardColor),
                ), // I just opened the app bar to configure the system overlay. here is a dimensionless app bar. The appbar I use is configured in the home view header
                body: SingleChildScrollView(
                  child: Stack(
                      children: [
                        const HomeViewHeader(),
                      worldTimes == null
                            ? const Center(child:CircularProgressIndicator(color: myDarkBlue,) ,)
                            : HomeViewBody(worldTimes: worldTimes,),
                      ]
                  ),
                ),
              );
           }
         );
        }

}
