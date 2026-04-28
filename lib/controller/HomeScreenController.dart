import 'package:app1/screen/Home.dart';
import 'package:app1/screen/favorite.dart';
import 'package:app1/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController{

ChangePage(int i);

}

class HomescreencontrollerImp extends Homescreencontroller{
  int currentPage =0 ;


  List<Widget>listPage =[
    
    Home(),
    Setting(),
   
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('profile'))
      ],
    ),
    favorite(),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Center(child: Text('fivorits'))
    //   ],
    // )
  ];
 
 @override
  ChangePage(int i) {
    currentPage = i ;
    update();
   
  }
}