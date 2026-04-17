import 'package:app1/controller/ItemsController.dart';
import 'package:app1/controller/favoritsController.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:app1/screen/Home.dart';
import 'package:app1/widget/home/CustomCardItem.dart';
import 'package:app1/widget/home/ListCategorisItem.dart';
import 'package:app1/widget/home/customApparHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemsProduct extends StatelessWidget {
  const ItemsProduct({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(ItemscontrollerImp());
   FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child:GetBuilder<ItemscontrollerImp>(builder: (controller)=> ListView(
                children: [
                  
                   Container(
                     child: CustomApparHome(
                                     mycontroller: controller.search!,
                                     onChanged: (val) {
                                       controller.checksearch(val);
                                     },
                                     text: 'SEARCH',
                                     onPressedsearch: () {
                                       controller.onsearch();
                                     },
                                     onPressedIcon: () {},
                                     onPressedIconfavorite: () {
                                     Get.toNamed(Approute.favorite);
                                     
                                       
                                      },
                                    ),
                   ),
                 controller.issearch?listSearch(listSearchModel:controller.listSearch):

                Column(
                  children: [
                     ListCategorisItem(),
                  GetBuilder<ItemscontrollerImp>(
                    builder: (controller) => handlingDataView(
                      statusrequest: controller.statusrequest,
                      widget: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // عدد الأعمدة
                          crossAxisSpacing: 10, // مسافة عرضية
                          mainAxisSpacing: 10, // مسافة طولية
                          childAspectRatio: 0.8, // نسبة الطول للعرض
                        ),
                        itemCount: controller.items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(), // عدد العناصر
                        itemBuilder: (context, index) {
                         controllerfav.isFavorite[controller.items[index]["Items_id"]]=controller.items[index]["favorite"];
           
           
                          return CustomCardItem(
                            itemModel: itemsModel.fromJson(
                              controller.items[index],
                            ), 
                          );
                        },
                      ),
                    ),
                  ),
                  ],
                )
                 
                ],
              ),)
            ),
          ],
        ),
      ),
      //  ),//
      //   ),//
    );
  }
}
