import 'package:app1/controller/homeController.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/function/TranslateDataBase.dart';
import 'package:app1/link.dart';
import 'package:app1/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategorisHome extends GetView<HomeControllerImp> {
  const ListCategorisHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 120,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          
      
          itemBuilder: (context, index) {
            // print(
            //   "${applink.imageStatic}${controller.categories[index]['Categories_image']}",
            // );
            // print(
            //   '=====================link=============================',
            // );
      
            return categoris(
              i :index,
              categoriesmodel: Categoriesmodel.fromJson(
                controller.categories[index],
              ),
            );
          },
        ),
      );
   
  }
}

class categoris extends GetView<HomeControllerImp> {
  final int? i ;
  final Categoriesmodel categoriesmodel;
  const categoris( {super.key, required this.categoriesmodel,required this.i,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       controller.goItems(controller.categories, i!,categoriesmodel.categoriesId!.toString());
     
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 77,
            child: SvgPicture.network(
              "${applink.imageStatic}/${categoriesmodel.categoriesImage}",
            ),
          ),
          Text(
            "${TranslateDataBase(categoriesmodel.categoriesNameAr,categoriesmodel.categoriesName)}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
