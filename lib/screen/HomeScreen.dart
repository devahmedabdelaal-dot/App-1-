import 'package:app1/controller/HomeScreenController.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/widget/home/CustomBottonAppar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(
      init: HomescreencontrollerImp(),
      builder: (controller)=>Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Approute.cart);
      },child: Icon(Icons.shopping_cart),shape: CircleBorder(),backgroundColor: const Color.fromARGB(255, 145, 211, 241),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            Row(children: [
              CastomButtonAppar(text: 'HOME', iconData: Icons.home, ColorsSelected: Colors.lightBlue, active: controller.currentPage ==0 ?true:false,onPressed: () {
                controller.ChangePage(0);
              },),
               CastomButtonAppar(text: 'settings', iconData: Icons.settings, ColorsSelected: Colors.lightBlue, active: controller.currentPage ==1 ?true:false,onPressed: () {
                controller.ChangePage(1);
              },),
            ],),
           Spacer(),
            Row(children: [
               CastomButtonAppar(text: 'profile', iconData: Icons.person, ColorsSelected: Colors.lightBlue, active: controller.currentPage ==2 ?true:false,onPressed: () {
                controller.ChangePage(2);
              },),
               CastomButtonAppar(text: 'fivorits', iconData: Icons.heart_broken, ColorsSelected: Colors.lightBlue, active: controller.currentPage ==3 ?true:false,onPressed: () {
                controller.ChangePage(3);
              },),
            ],),
           
          ],
        ),
      ),
      body: controller.listPage.elementAt(controller.currentPage)
    ));
}
}