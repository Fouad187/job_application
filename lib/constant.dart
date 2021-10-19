import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


List<String> categories=
[
  'IT/Software Development',
  'Engineering',
  'Marketing',
  'Testing',
  'UI/Ux Design',
  'Sales',
  'Help Desk',
  'Call Center',
  'Lawyer/Law',
  'Writer and Books',
  'Teacher/Education',
  'Scientist',
];
List<DropdownMenuItem> getitem(List<String> list)
{
  List<DropdownMenuItem> dropdownmenuitem=[];
  for(int i=0 ; i<list.length; i++)
  {
    String type=list[i];
    var newitem=DropdownMenuItem(
      child: Text(type) ,
      value: type,
    );
    dropdownmenuitem.add(newitem);
  }
  return dropdownmenuitem;
}