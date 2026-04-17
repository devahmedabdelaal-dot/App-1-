import 'package:app1/controller/homeController.dart';
import 'package:app1/link.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class itemsHome extends GetView<HomeControllerImp> {
  const itemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return items(itemsmodel: itemsModel.fromJson(controller.items[i]),);
                    },
                  ),
                );
  }
}


class items extends StatelessWidget {
 final itemsModel itemsmodel ;
  const items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image.network(
                              '${applink.imageStatic}${itemsmodel.itemsImage}',
                              height: 100,
                              width: 150,
                              // fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black.withOpacity(0.1),
                            ),
                            height: 120,
                            width: 180,

                           
                            // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Text(
                              "${itemsmodel.categoriesName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
  }
}