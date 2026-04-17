import 'package:app1/controller/checkOutController.dart';
import 'package:app1/core/imageasset.dart';
import 'package:app1/widget/Cart/bottomcart.dart';
import 'package:app1/widget/checkOut/customAddress.dart';
import 'package:app1/widget/checkOut/customDelivery.dart';
import 'package:app1/widget/checkOut/custompayment.dart';
import 'package:app1/widget/checkOut/textformAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends GetView <Checkoutcontroller> {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkoutcontroller());
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30, right: 40),
        child: Bottoncard(text: "Check Out", onPressed: () {
          if (controller.DelivaryType == "delivery"){
             if(controller.formKey.currentState!.validate()){
            controller.checkout();
          
          }
          }else {
            controller.checkout();
          }
         
          
        }),
      ),
      appBar: AppBar(title: Text('Check out '), centerTitle: true),
      body: GetBuilder<Checkoutcontroller>(
        builder: (controller) => Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(
                'Choose Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              InkWell(
                onTap: () {
                  controller.choosePaymentType('cash');
                },
                child: CustomPayment(
                  titel: 'Cach',
                  isactive: controller.paymentType == 'cash' ? true : false,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.choosePaymentType('cards');
                },
                child: CustomPayment(
                  titel: 'Payment Cards',
                  isactive: controller.paymentType == 'cards' ? true : false,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Choose Delivery Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType('delivery');
                      },
                      child: CustomDelivery(
                        titel: 'Delivery',
                        imageName: Imageasset.delivery,
                        active: controller.DelivaryType == 'delivery'
                            ? true
                            : false,
                      ),
                    ),

                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType('drive');
                      },
                      child: CustomDelivery(
                        titel: 'Drive Thru',
                        imageName: Imageasset.drivethru,
                        active: controller.DelivaryType == 'drive'
                            ? true
                            : false,
                      ),
                    ),
                  ],
                ),
              ),

           if(controller.DelivaryType == 'delivery')

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                 SizedBox(height: 10),
                  Text(
                    'Enter Your location',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                   
                  ),  SizedBox(height: 10),
                TextFormAddress(controllerAddress: controller.AddressController, formKey: controller.formKey,),
              ],
            ),
          //   Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         SizedBox(height: 10),
          //         Text(
          //           'Choose Your location',
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //         ),
          //         SizedBox(height: 10),
          //         InkWell(
          //           onTap: () {
          //             controller.chooseAddressType('home');
          //           },
          //           child: CustomAddress(
          //             titel: 'Home',
          //             subtitel: '############',
          //             active: controller.AddressType == 'home' ? true : false,
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             controller.chooseAddressType('coumpany');
          //           },
          //           child: CustomAddress(
          //             titel: 'Coumpany',
          //             subtitel: '##########',
          //             active:controller.AddressType == 'coumpany' ? true : false,
          //           ),
          //         ),
          //       ],
          //     ),
        
            ],
          ),
        ),
      ),
    );
  }
}
