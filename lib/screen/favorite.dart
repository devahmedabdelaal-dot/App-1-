import 'package:app1/controller/favoritsController.dart';
import 'package:app1/controller/myfavoriteController.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/model/myFavoriteModel.dart';
import 'package:app1/screen/Home.dart';
import 'package:app1/widget/home/CustomCardItem.dart';
import 'package:app1/widget/home/customApparHome.dart';
import 'package:app1/widget/myFavorite/customCardMyFavorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class favorite extends StatelessWidget {
  const favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Myfavoritecontroller());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller) => Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CustomApparHome(
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
                    controller.issearch
                        ? listSearch(listSearchModel: controller.listSearch)
                       
                        : GetBuilder<Myfavoritecontroller>(
                          init: Myfavoritecontroller(),
                            builder: (controller) => Column(
                              children: [
                                SizedBox(height: 20),
                                handlingDataView(
                                  statusrequest: controller.statusrequest,
                                  widget: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // عدد الأعمدة
                                          crossAxisSpacing: 10, // مسافة عرضية
                                          mainAxisSpacing: 10, // مسافة طولية
                                          childAspectRatio:
                                              0.8, // نسبة الطول للعرض
                                        ),
                                    itemCount: controller.data.length,
                                    shrinkWrap: true,
                                    physics:
                                        NeverScrollableScrollPhysics(), // عدد العناصر
                                    itemBuilder: (context, index) {
                                      return CustomCardMyFavorite(
                                        itemModel: controller.data[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
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
