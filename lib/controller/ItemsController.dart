

import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/HomeData.dart';
import 'package:app1/datasource/remote/ItemsData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class itemsController extends GetxController{
InitialData();
ChangeCat(int val , String CatVal);
GetData(String CategorisId );
GotoPageProductDetails(itemsModel ItemsModel);

}

class ItemscontrollerImp extends itemsController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  MyServices myServices =Get.find();
  

  List Categories = [];
  int? SelectedCat ;
  String? CategorisId ;
  int? SelecteditemIcon ;
  
  late Statusrequest statusrequest ;
  List items =[];
// ==========search===========
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
  void onInit() {
    search =TextEditingController();
    InitialData();
    GetData(CategorisId!);
    super.onInit();
  }
  
  @override
  InitialData() {
  Categories = Get.arguments['Categories'];
  SelectedCat = Get.arguments['SelectedCat'];
  CategorisId = Get.arguments['CategorisId'];
  }
 
  
  @override
  ChangeCat(int val , CatVal) {
   SelectedCat = val ;
   CategorisId = CatVal ;
    GetData(CategorisId!);
   update();
  }
  
  @override
  GetData(CategorisId) async{
    items.clear();
    statusrequest = Statusrequest.loading;

  var response = await itemsdata.getData(CategorisId ,myServices.sharedPreferences.getString('id')!);
  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    items.addAll (response['data']) ;
    
    // print('===============================$items');
  }else{
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
  
  @override
  GotoPageProductDetails(itemsModel) {
   Get.toNamed(Approute.itemsDetails,arguments: {
    'itemsmodel' : itemsModel 
   });
  }
  
 
}