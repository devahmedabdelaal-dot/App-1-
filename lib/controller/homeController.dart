import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/HomeData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:app1/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  
  goItems(List categories ,int selectedCat,String CategorisId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  late Statusrequest statusrequest ;
  List categories =[];
  List items =[];
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

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }


  @override
  getData() async {
    statusrequest = Statusrequest.loading;

    var response = await homedata.getData();
    statusrequest = handlingData(response);
    print(response);
print(statusrequest);

    if (statusrequest == Statusrequest.success) {
     categories.addAll(response['Categories']);
     items.addAll(response['items']);
     
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
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
  //////////////تعديل
  //////hhhhhhhhhhhh
  
  @override
  goItems( categories , selectedCat, CategorisId) {
    Get.toNamed(Approute.items,arguments:{
    "Categories"  : categories ,
    "SelectedCat" : selectedCat,
    "CategorisId" : CategorisId
    } );
}

 GotoPageProductDetails(itemsModel) {
   Get.toNamed(Approute.itemsDetails,arguments: {
    'itemsmodel' : itemsModel 
   });
  }



void notifications()async{
  // print('=================on==============');
  FirebaseMessaging messaging = FirebaseMessaging.instance;

// طلب صلاحيات (مهم جدًا)
await messaging.requestPermission();

// الحصول على التوكن
// String? token = await messaging.getToken();
// print("TOKEN==========================: $token");
}


  @override
  void onInit() {
    notifications();
    search =TextEditingController();
    initialData();
      getData();
    super.onInit();
  }

}
