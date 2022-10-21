import 'package:flutter/material.dart';

import '../models/world_time_model.dart';
import '../view/second/second.dart';


abstract class SecondViewModel extends State<Second>{
  String? time;
  SecondViewModel({required this.time, this.selectedtime});

  WorldTime? selectedtime ;


}