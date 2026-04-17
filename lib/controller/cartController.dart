import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/cartData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/cartModel.dart';
import 'package:app1/model/couponModel.dart';
import 'package:app1/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Cartcontroller extends GetxController{

 late TextEditingController controllerCoupon ;
  late Statusrequest statusrequest ;
  Cartdata cartdata = Cartdata(Get.find());
  MyServices myServices = Get.find();
 List<CartModel>data =[] ;
 double priceOrder = 0.0 ;
 int totalitemCount =0 ;
 CouponModel? couponModel ;
 int DiscountCoupon =0 ;
 String? NameCoupon ;
 String? Couponid ;



  cartadd(String itemsid) async{
    // items.clear();
    statusrequest = Statusrequest.loading;

  var response = await cartdata.cartAdd( myServices.sharedPreferences.getString('id')!,itemsid);

  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
     Get.snackbar('اشعار',' تم اضافه الي السله ');
    // items.addAll (response['data']) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  // update();
  }

  cartdelete(String itemsid) async{
    // items.clear();
    statusrequest = Statusrequest.loading;

  var response = await cartdata.cartRemove( myServices.sharedPreferences.getString('id')!,itemsid);

  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
     Get.snackbar('اشعار',' تم الحذف من السله ');
    // items.addAll (response['data']) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  // update();
  }
  cartgetCountItem(String itemsid) async{
    // items.clear();
    statusrequest = Statusrequest.loading;

  var response = await cartdata.cartgetCountItem( myServices.sharedPreferences.getString('id')!,itemsid);

  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
     int itemCount = 0 ;
    itemCount = response['data'];
    print('==========================$itemCount');
     return itemCount ;
    //  Get.snackbar('اشعار',' تم الحذف من السله ');
    // items.addAll (response['data']) ;
  }else{
    statusrequest = Statusrequest.failure;
  }
  // update();
  }


resetvarCart(){
  
  totalitemCount = 0 ;
  priceOrder = 0.0 ;
}

refreshPage(){
   resetvarCart();
  cartView();
}

  cartView() async{
  //  print('===========in====function=========');

    statusrequest = Statusrequest.loading;
    update();

  var response = await cartdata.cartview( myServices.sharedPreferences.getString('id')!);
// print('===========response====function=========$response');

  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    
     if (response['data'] == null || (response['data'] as List).isEmpty) {
      // 👈 مفيش داتا
      statusrequest = Statusrequest.empty; // أو تعمل حالة جديدة اسمها empty
      update();
    } else{


    //
   List dataresponse =response['data'];
   Map dataresponseCountPrice =response['countPrice'];
   data.clear();
  data.addAll(dataresponse.map((e) => CartModel.fromJson (e))) ;
  // totalitemCount = int.parse(dataresponseCountPrice['totalcount']);
  // priceOrder = double.parse(dataresponseCountPrice['totalprice']);

  totalitemCount = dataresponseCountPrice['totalcount'] is String
    ? int.parse(dataresponseCountPrice['totalcount'])
    : dataresponseCountPrice['totalcount'];

priceOrder = dataresponseCountPrice['totalprice'] is String
    ? double.parse(dataresponseCountPrice['totalprice'])
    : dataresponseCountPrice['totalprice'].toDouble();
  

    }


    
  }else{
    statusrequest = Statusrequest.failure;
    // print('===========failure====function=========');

  }
  update();
  }


// cartView() async {
//   statusrequest = Statusrequest.loading;
//   update();

//   var response = await cartdata.cartview(
//     myServices.sharedPreferences.getString('id')!
//   );

//   statusrequest = handlingData(response);

//   if (statusrequest == Statusrequest.success) {

//     List dataresponse = response['data'] ?? [];

//     if (dataresponse.isEmpty) {
//       statusrequest = Statusrequest.empty;
//       data.clear(); // 👈 مهم
//     } else {

//       Map dataresponseCountPrice = response['countPrice'];

//       data.clear();
//       data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));

//       totalitemCount = dataresponseCountPrice['totalcount'] is String
//           ? int.parse(dataresponseCountPrice['totalcount'])
//           : dataresponseCountPrice['totalcount'];

//       priceOrder = dataresponseCountPrice['totalprice'] is String
//           ? double.parse(dataresponseCountPrice['totalprice'])
//           : dataresponseCountPrice['totalprice'].toDouble();
//     }

//   } else {
//     statusrequest = Statusrequest.failure;
//   }

//   update(); // ✅ مرة واحدة بس هنا
// }

  checkCoupon() async{
  
    statusrequest = Statusrequest.loading;

  var response = await cartdata.checkCoupon(controllerCoupon.text);
  print(response);

  statusrequest = handlingData(response);
  if (statusrequest == Statusrequest.success){
    if(response['status'] == "success"){
      Map<String, dynamic> couponData = response['data'];
    couponModel = CouponModel.fromJson(couponData);
    DiscountCoupon =couponModel!.couponDiscount! ;
    NameCoupon = couponModel!.couponName ;
    Couponid = couponModel!.couponId.toString() ;
    update();
    print('=========discountcoupon===========$DiscountCoupon');

    }else{
       DiscountCoupon = 0 ;
       NameCoupon = null ;
       Couponid = null ;
    print('========fali=========$DiscountCoupon');
    update();
    }
    
   
  }else{
    // statusrequest = Statusrequest.failure;
   
  }
  update();
  }

  getTotalprice(){
    return (priceOrder - priceOrder * DiscountCoupon / 100);
  }



 gotoCheckOut(){
  if(data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
  Get.toNamed(Approute.Checkout,arguments:{
    "couponid" : Couponid ?? '0' ,
    "priceorder" : priceOrder.toString() ,
    "coupondiscount" : DiscountCoupon.toString() ,
  });
 }


  @override
  void onInit() {
   cartView();
   controllerCoupon = TextEditingController();

  
    super.onInit();
  }

}