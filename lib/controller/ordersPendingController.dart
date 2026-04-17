import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/ordersPendingData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/ordersPendingModel.dart';
import 'package:app1/services/services.dart';
import 'package:get/get.dart';

class Orderspendingcontroller extends GetxController{


Orderspendingdata orderspendingdata =Orderspendingdata(Get.find());

List <OrdersPendingModel> data=[];
late Statusrequest statusrequest;  
MyServices myServices = Get.find();




String PrintPaymentMethod(String val ){
  if(val == '0'){
    return 'Cash';
  }else{
    return 'Payment Cards' ;
  }
}

String PrintOrdersStatus(String val ){
  if(val == '0'){
    return 'Await Approval';
  }else if(val == '1'){
    return 'Prepare ' ;
  
  }else if(val == '2'){
    return 'On the Way ' ;
  }else{
     return 'Archive' ;
  }
}

String PrintDeliveryMethod(String val ){
  if(val == '0'){
    return 'Delivery';
  }else{
    return 'Ricive' ;
  }
}

gotoOrdersDetails(){
  Get.toNamed(Approute.ordersDetails,arguments: {
    "datamodel" : data 
  });
}


getData()async{
  statusrequest = Statusrequest.loading;

  var response = await orderspendingdata.getData(myServices.sharedPreferences.getString('id')!);
  print('=================orderspending===============$response');
  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    List listdata = response['data'] ;
    data.addAll (listdata.map((e) => OrdersPendingModel.fromJson(e) )) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  update();
}
@override
  void onInit() {
   getData();
   
    super.onInit();
  }

}