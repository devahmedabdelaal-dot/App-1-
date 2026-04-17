import 'package:app1/controller/testController.dart';
import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class testView extends StatelessWidget {
  const testView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: GetBuilder<Testcontroller>(
        builder: (controller) {

          return handlingDataView(statusrequest: controller.statusrequest, 
              widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context,index){
                return Text("${controller.data}");
              },
            ),);




        
        },
      ),
    );
  }
}