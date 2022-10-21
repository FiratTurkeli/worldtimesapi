import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/world_time_services.dart';
import '../view/home/home.dart';

abstract class HomeViewModel extends State<Home> {

  List? worldTimes ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTimes();
  }

  void  getAllTimes() async {
    worldTimes = await context.read<WorldTimeServices>().getAllTimes();
    setState(() {
      worldTimes;
    });
  }

}