import 'package:app1/controller/ordersPendingController.dart';
import 'package:app1/model/ordersPendingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Orderspendingcontroller());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue, title: Text('pending')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<Orderspendingcontroller>(
          builder: (controller) => ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(overscroll: false),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  CardOrdersPending(listModel: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrdersPending extends GetView<Orderspendingcontroller> {
  final OrdersPendingModel listModel;
  const CardOrdersPending({super.key, required this.listModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Number
            Row(
              children: [
                Icon(Icons.receipt_long, color: Colors.deepOrange),
                SizedBox(width: 8),
                Text(
                  'Order #${listModel.ordersId}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 10),
            Divider(),

            // Order Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Type: ${controller.PrintDeliveryMethod(listModel.ordersType.toString())}'), Text('Payment: ${controller.PrintPaymentMethod(listModel.ordersPaymentMethod.toString())}')],
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Price: ${listModel.ordersPrice} \$'), Text('Delivery: ${listModel.ordersPriceDelivery} \$')],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('STATUS : ${controller.PrintOrdersStatus(listModel.ordersStatus.toString())}')],
            ),

            SizedBox(height: 10),
            Divider(),

            // Total + Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${listModel.ordersTotalprice} \$',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.gotoOrdersDetails();
                  },
                  child: Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
