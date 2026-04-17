import 'package:app1/model/ordersPendingModel.dart';
import 'package:get/get.dart';

class Ordersdetailscontroller extends GetxController{
 
 late List <OrdersPendingModel> dataModel ;
  @override
  void onInit() {
    super.onInit();
   dataModel = Get.arguments['datamodel'];
   print('================$dataModel=======datamodel======orders======');
  }
}