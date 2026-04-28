import 'package:app1/controller/cartController.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/imageasset.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/link.dart';
import 'package:app1/widget/Cart/bottomCardCoupon.dart';
import 'package:app1/widget/Cart/bottomcart.dart';
import 'package:app1/widget/Cart/customItemsCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller cartcontroller = Get.put(Cartcontroller());
    return Scaffold(
      bottomNavigationBar: GetBuilder<Cartcontroller>(
        builder: (controller) => GestureDetector( //لازاله focus from textformfield
          behavior: HitTestBehavior.opaque,
           onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child:controller.NameCoupon == null ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: bottomCartCoupon(controllerCoupon:controller.controllerCoupon ,)
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 13),
                          color: Colors.lightBlue,
                          textColor: Colors.white,
                          onPressed: () {
                            controller.checkCoupon();
                          },
                          child: Text('applay'),
                        ),
                      ),
                    ],
                  ) :Container(child: Text('coupon code : ${controller.NameCoupon}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightBlue),),)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('price', style: TextStyle(fontSize: 20)),
                    Text(
                      '${controller.priceOrder}\$',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Coupon Discount', style: TextStyle(fontSize: 20)),
                    Text(
                      '${controller.DiscountCoupon}%',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(' shpping', style: TextStyle(fontSize: 20)),
                    Text('100\$', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'total',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${controller.getTotalprice()}\$',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Bottoncard(text: 'Order', onPressed: () {
                  controller.gotoCheckOut();
                  // Get.toNamed(Approute.Checkout);
                }),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<Cartcontroller>(
        builder: (controller) => handlingDataView(
          statusrequest: controller.statusrequest,
          widget: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),

                    Text(
                      'Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              Container(
                alignment: Alignment.center,
                height: 30,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'you have => ${cartcontroller.totalitemCount} <= items in list',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      cartcontroller.data.length,
                      (index) => ItemsCartCart(
                        titel: '${cartcontroller.data[index].itemsName}',
                        price: '${cartcontroller.data[index].itemspricee}',
                        count: cartcontroller.data[index].countitems ?? 0,
                        image: '${cartcontroller.data[index].itemsImage}',
                        onadd: () async {
                          await cartcontroller.cartadd(
                            cartcontroller.data[index].itemsId!.toString(),
                          );
                          cartcontroller.refreshPage();
                        },
                        ondelete: () async {
                          await cartcontroller.cartdelete(
                            cartcontroller.data[index].itemsId!.toString(),
                          );
                          cartcontroller.refreshPage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
