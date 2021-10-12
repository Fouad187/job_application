import 'dart:math';

import 'package:flutter/cupertino.dart';

Color kColor=Color(0xFF6BCEFF);

String getRandomId()
{
  var rng = new Random();
  String randomName="";
  for (var i = 0; i < 20; i++) {
    randomName += rng.nextInt(100).toString();
  }
  return randomName;
}