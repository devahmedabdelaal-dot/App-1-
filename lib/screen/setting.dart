import 'package:app1/controller/settingController.dart';
import 'package:app1/core/imageasset.dart';
import 'package:app1/core/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    return Container(child: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
         
          Container(height: Get.width /2,color: Colors.blue,),
          Positioned(
            top: Get.width /3,
            child: Container(
             
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100)
              ),
              child:CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage(Imageasset.logo),
              ) ,
        
          )),
         
        
        ],),
        SizedBox(height: 100,),
        Card(child: Column(children: [
          ListTile(title: Text('Disable notifications '),trailing: Switch(value: true, onChanged: (val){}),),
          Divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Approute.AddressView);
            },
            child: ListTile(title: Text('Address'),trailing: Icon(Icons.location_on),)),
          Divider(),
          ListTile(title: Text('About us'),trailing: Icon(Icons.help_outline_rounded),),
          Divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Approute.Archive);
            },
            child: ListTile(title: Text('Archive '),trailing: Icon(Icons.archive),)),
          Divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Approute.Pending);
            },
            child: ListTile(title: Text('orders'),trailing: Icon(Icons.badge_outlined),)),
          Divider(),
           ListTile(title: Text('Contact us '),trailing: Icon(Icons.phone),),
           Divider(),
           ListTile(
            onTap: () {
              controller.logout();
            },title: Text('Logout'),
           trailing: Icon(Icons.exit_to_app),
           ),
          
          
        ],))
      ],
    ),);
  }
}