import 'package:app1/controller/homeController.dart';
import 'package:app1/core/class/handlingDataView.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/link.dart';
import 'package:app1/model/ItemsModel.dart';

import 'package:app1/widget/home/ListCategoriseHome.dart';
import 'package:app1/widget/home/customApparHome.dart';
import 'package:app1/widget/home/customCurdHome.dart';
import 'package:app1/widget/home/itemsHome.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
               handlingDataView(
        statusrequest: controller.statusrequest,
        widget:
              controller.issearch? listSearch(listSearchModel:controller.listSearch):
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 CustomCurdHome(titel: 'SUMMER SALE', body: 'DISCOUNT UP TO 20%'),
              ListCategorisHome(),
              SizedBox(height: 20),

              Text(
                'PRODUCT FOR YOU',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              itemsHome(),

              Text(
                'OFFER',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              itemsHome(),
              ],) ),
             
             
            ],
          ),
        ),
      // ),
    );
  }
}


class listSearch extends GetView<HomeControllerImp> {
 final List<itemsModel> listSearchModel ;
  const listSearch({super.key, required this.listSearchModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listSearchModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return InkWell(
          onTap: () {
            controller.GotoPageProductDetails(listSearchModel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Card(
          child:Container(
           
            child: Row(children: [
              Expanded(child: SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(imageUrl: "${applink.imageStatic}${listSearchModel[index].itemsImage}",fit: BoxFit.contain,),
              )),
              Expanded(flex: 2,child:  ListTile(
            title: Text('${listSearchModel[index].itemsName}'),
            subtitle: Text('${listSearchModel[index].categoriesName}'),
          ),)
            ],),
          )
          ),),
        );
      },
      
    );
  }
}