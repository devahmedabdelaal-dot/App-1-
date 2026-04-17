import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/HomeData.dart';
import 'package:app1/datasource/remote/favoriteData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
Map isFavorite = {} ;

MyServices myServices = Get.find();
Favoritedata favoritedata =Favoritedata(Get.find());
late Statusrequest statusrequest ;

List items =[];
List favoriteData =[];



 Homedata homedata=Homedata(Get.find());
  TextEditingController? search ;
  bool issearch = false ;

List <itemsModel> listSearch =[];


checksearch(val){
    if(val == ''){
      issearch = false;
    }
    update();
  }

onsearch(){
  issearch = true ;
 
   searchData() ;
  update();
}



 GotoPageProductDetails(itemsModel) {
   Get.toNamed(Approute.itemsDetails,arguments: {
    'itemsmodel' : itemsModel 
   });
  }

setFavorite (id ,val){
isFavorite[id] = val ;
update() ;
} 





addfavorite(String itemsid) async{
    items.clear();
    statusrequest = Statusrequest.loading;

  var response = await favoritedata.favoriteAdd( myServices.sharedPreferences.getString('id')!,itemsid);
   print("add RESPONSE = $response");
  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
     Get.snackbar('اشعار',' تم اضافه الي المفضله');
    // items.addAll (response['data']) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  // update();
  }


  removefavorite(String itemsid) async{
    items.clear();
    statusrequest = Statusrequest.loading;

  var response = await favoritedata.favoriteRemove(myServices.sharedPreferences.getString('id')!,itemsid);
   print("REMOVE RESPONSE = $response");
  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    Get.snackbar('اشعار',' تم الحذف من المفضله');
    // items.addAll (response['data']) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  // update();

}

 searchData() async {
    statusrequest = Statusrequest.loading;

    var response = await homedata.search(search!.text);
    statusrequest = handlingData(response);
   

    if (statusrequest == Statusrequest.success) {
      listSearch.clear();
      
    List responsData =response['data'];
    listSearch.addAll(responsData.map((e) => itemsModel.fromJson(e)));
     
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }
//   myfavoriteData() async{
//     favoriteData.clear();
//     statusrequest = Statusrequest.loading;

//   var response = await favoritedata.favoriteData(myServices.sharedPreferences.getString('id')!);
//   print('========================$response');
//   statusrequest = handlingData(response);
//   if (statusrequest == Statusrequest.success){
    
//     favoriteData.addAll (response['data']) ;
//     print('========================$favoriteData');
     

//   }else{
//     statusrequest = Statusrequest.failure;
//   }
//   update();

// }
@override
  void onInit() {
    search=TextEditingController();
    print('========================oninis');
    super.onInit();
  }

}