
import 'package:app1/controller/myfavoriteController.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/link.dart';

import 'package:app1/model/myFavoriteModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomCardMyFavorite extends GetView <Myfavoritecontroller> {
  final myFavoriteModel itemModel;
  // final bool active ;
  const CustomCardMyFavorite( {super.key, required this.itemModel ,});

  @override
  Widget build(BuildContext context) {
   
        return InkWell(
          onTap: () {
            // controller.GotoPageProductDetails(itemModel);
          },
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Hero(
                     tag: '${itemModel.itemsId}',//================categorise id
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: applink.imageStatic + "/" + itemModel.itemsImage!,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    itemModel.itemsName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    "DESCOUNT   ${itemModel.itemsDiscount!} \$",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightBlue),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${itemModel.itemsPrice}\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
                      ),
                     IconButton(onPressed: (){
                        controller.DeletFromfavorite("${itemModel.favoriteId!}");
                       

                      }, icon: Icon(Icons.delete_outline))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
