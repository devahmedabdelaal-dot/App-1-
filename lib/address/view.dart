import 'package:app1/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
        title: Text('address'),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: (){
          Get.toNamed(Approute.AddressAdd);
        },child: Icon(Icons.add),),
      body: ListView(),
    );
  }
}