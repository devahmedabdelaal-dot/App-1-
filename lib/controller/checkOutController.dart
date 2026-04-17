import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/checkoutData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkoutcontroller extends GetxController {
  late TextEditingController AddressController;

 late Statusrequest statusrequest ;
 Checkoutdata checkoutdata = Checkoutdata(Get.find());
  MyServices myServices = Get.find();

  String? paymentType;
  String? DelivaryType;
  String? AddressType;

   String? couponid ;
   String? priceorder ;
   String? discountcoupon ;

//text form
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  choosePaymentType(String val) {
    paymentType = val;
    update();
  }

  chooseDeliveryType(String val) {
    DelivaryType = val;
    update();
  }

  chooseAddressType(String val) {
    AddressType = val;
    update();
  }

  checkout() async {

if (paymentType == null ) return Get.snackbar('تنبيه ', "الرجاء اختيار طريقه الدفع");
if (DelivaryType == null ) return Get.snackbar('تنبيه ', "الرجاء اختيار طريقه التوصيل");

    statusrequest = Statusrequest.loading;
    update();
     Map data ={
      "usersid" : myServices.sharedPreferences.getString('id')     ,
      "ordersaddress" :   AddressController.text  ,
      "coupondiscount" : discountcoupon   ,
      "ordersprice" :   priceorder.toString()  ,
      "ordersdeliveryprice" :   '20'  ,
      "orderscoupon" : couponid ,
      // "orderspayment" : paymentType.toString() ,
      "orderstype": DelivaryType == "delivery" ? "0" : "1",
      "orderspayment": paymentType == "cash" ? "1" : "0",  

     
      
     };
     
      print('==================data=checkout========$data');

    var response = await checkoutdata.checkout(data);
    print("=========================checkout==========$response");

    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
       Get.offAllNamed(Approute.home);
         Get.snackbar('تنبيه', "تم طلب المنتجات بنجاح ");

      
        update();
      
      } else {
        
          statusrequest = Statusrequest.none ;
         Get.snackbar('تنبيه', " الرجاء اعاده المحاوله ");
       
      }
    } else {
      print('==============faliure=======');
     
    }
    update();
  }


//   @override
// void onReady() {
//   var args = Get.arguments ?? {};

//   priceorder = args['priceorder'] ?? "0";
//   couponid   = args['couponid'] ?? "0";

//   print("ARGS = $args");

//   super.onReady();
// }

  @override
  void onInit() {
    priceorder = Get.arguments?['priceorder'];
    couponid = Get.arguments?['couponid'];
    discountcoupon = Get.arguments?['coupondiscount'];

   
    AddressController = TextEditingController();
    super.onInit();
  }
}
