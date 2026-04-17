import 'package:app1/controller/ItemsController.dart';
import 'package:app1/controller/homeController.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/function/TranslateDataBase.dart';
import 'package:app1/link.dart';
import 'package:app1/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategorisItem extends GetView<ItemscontrollerImp> {
  const ListCategorisItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 30,left: 30),
        height: 30,
        child: ListView.builder(
          itemCount: controller.Categories.length,
          scrollDirection: Axis.horizontal,
          
      
          itemBuilder: (context, index) {
          
      
            return Items(
              i :index,
              categoriesmodel: Categoriesmodel.fromJson(
                controller.Categories[index],
              ),
            );
          },
        ),
      );
   
  }
}

class Items extends GetView<ItemscontrollerImp> {
  final int? i ;
  final Categoriesmodel categoriesmodel;
  const Items( {super.key, required this.categoriesmodel,required this.i,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  controller.goItems(controller.categories, i!);
      controller.ChangeCat(i!,categoriesmodel.categoriesId!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemscontrollerImp>(builder: (controller)=>Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration:controller.SelectedCat== i ? BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3,color: Colors.deepOrange)
              )
            ) : null,
            child: Text(
              "${TranslateDataBase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),),
          
        ],
      ),
    );
  }
}
