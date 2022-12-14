import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/world_time_model.dart';

class WorldTimeServices{
  var apiUrl= "http://worldtimeapi.org/api/timezone";

  Future getAllTimes() async {
    final response = await Dio().get(apiUrl);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final responseBody = response.data as List ;
      print(responseBody);
      return responseBody;
    }

    throw Exception();
  }

  //selectedTimeZone for second view
  Future selectedTimeZone(String selected) async {
    final response = await Dio().get('http://worldtimeapi.org/api/timezone/${selected}');

    if (response.statusCode == 200) {
      print(response.statusCode);
      final responseBody = response.data ;
      print(responseBody);
      return WorldTime.fromJson(responseBody);
    }

    throw Exception();
  }
}