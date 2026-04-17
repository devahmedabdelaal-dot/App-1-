import 'package:app1/controller/ordersDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Ordersdetailscontroller controller =Get.put(Ordersdetailscontroller());
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Container(
        child: ListView(children: [
          Text('${controller.dataModel}')
        ],),
      ),
    );
  }
}