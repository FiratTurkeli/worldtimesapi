library home_screen;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../database/theme_mode_provider.dart';
import '../../database/theme_provider.dart';
import '../../view_model/home_view_model.dart';
import '../second/second.dart';

part 'components/home_vew_header.dart';
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
                ),
                body: Column(
                    children: [
                      const HomeViewHeader(),
                      worldTimes == null
                          ? const Center(child:CircularProgressIndicator(color: myDarkBlue,) ,)
                          : Flexible(
                        child: ListView.builder(
                            controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: worldTimes?.length,
                            itemBuilder: (context, index) {
                              return HomeViewBody(timeZone: worldTimes?[index],);

                            }
                        ),
                      )
                    ]
                ),
              );
           }
         );
        }

}
