import 'package:app1/controller/ItemsController.dart';
import 'package:app1/controller/favoritsController.dart';
import 'package:app1/core/imageasset.dart';
import 'package:app1/link.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardItem extends GetView<ItemscontrollerImp> {
  final itemsModel itemModel;
  // final bool active ;
  const CustomCardItem( {super.key, required this.itemModel ,});

  @override
  Widget build(BuildContext context) {
   
        return InkWell(
          onTap: () {
            controller.GotoPageProductDetails(itemModel);
          },
          child: Card(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Hero(
                         tag: '${itemModel.categoriesId}',
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
                        "DESCOUNT ${itemModel.itemsDiscount!} \%  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                     
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${itemModel.itemsPriceDiscount}\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                          ),
                         GetBuilder<FavoriteController>(builder: (controller)=> IconButton(
                            onPressed: () {
                              if(controller.isFavorite[itemModel.itemsId]==1){
                                controller.setFavorite(itemModel.itemsId, 0);
                                controller.removefavorite(itemModel.itemsId!.toString());
                                print('===============remove==============${controller.isFavorite[itemModel.itemsId]}');
                               
                
                              }else{
                                 controller.setFavorite(itemModel.itemsId, 1);
                                 controller.addfavorite(itemModel.itemsId!.toString());
                                   print('============add=================${controller.isFavorite[itemModel.itemsId]}');
                
                              }
                            },
                            color: Colors.red,
                            iconSize: 20,
                            icon: Icon(controller.isFavorite[itemModel.itemsId] == 1? Icons.favorite : Icons.favorite_border),
                          ),)
                        ],
                      ),
                    ],
                  ),
                ),
               if( itemModel.itemsDiscount! > 0 )
                Positioned(
                  top: -20,
                  left: -20,
                  
                  child:Image.asset(Imageasset.sale,width: 100,height: 100,), )
                
              ],
            ),
          ),
        );
  }
}
