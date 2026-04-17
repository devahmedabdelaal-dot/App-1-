import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/datasource/remote/test_data.dart';
import 'package:app1/function/handlingData.dart';
import 'package:get/get.dart';

class Testcontroller extends GetxController {

TestData testData =TestData(Get.find());

List data=[];
late Statusrequest statusrequest;  

getData()async{
  statusrequest = Statusrequest.loading;

  var response = await testData.getData();
  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    data.addAll (response['data']) ;
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