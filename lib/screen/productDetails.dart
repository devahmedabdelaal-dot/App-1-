import 'package:app1/controller/ProductDetailsController.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/link.dart';
import 'package:app1/widget/itemsDetails/counter_itemDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(
      ProductDetailsControllerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 35, 51),
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          onPressed: () {
            controller.cartcontroller.refreshPage();
            Get.toNamed(Approute.cart);
          },
          child: Text('Add To Card', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(builder: (controller)=>handlingDataView(statusrequest: controller.statusrequest, widget: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,

                  decoration: BoxDecoration(color: Colors.red),
                ),
                Hero(
                  tag: '${controller.ItemsModel.categoriesId}',
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl:
                          applink.imageStatic +
                          '/' +
                          controller.ItemsModel.itemsImage!,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.ItemsModel.itemsName}',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 25),
                  CounterItemDetails(
                    // count: '${controller.itemCountt}',
                
                    price: '${controller.ItemsModel.itemsPrice}',
                    add: () {
                     
                      controller.add();
                    },
                    remove: () {
                  
                      controller.remove();
                    }, number: '${controller.itemCountt}',
                  ),
                  SizedBox(height: 15),
                  Text(
                    '${controller.ItemsModel.itemsDesc}${controller.ItemsModel.itemsDesc}${controller.ItemsModel.itemsDesc}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Colors ",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      ...List.generate(
                        controller.ColorOfItem.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color:controller.ColorOfItem[index]['active']=='1' ? const Color.fromARGB(255, 2, 36, 63):Colors.white,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                         
                            },
                            child: Text(
                              '${controller.ColorOfItem[index]['name']}',
                              style: TextStyle(color:controller.ColorOfItem[index]['active']=='1' ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),))
    );
  }
}
