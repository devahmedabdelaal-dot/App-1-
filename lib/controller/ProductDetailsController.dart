import 'package:app1/controller/cartController.dart';
import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/model/ItemsModel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {

  Cartcontroller cartcontroller =Get.put(Cartcontroller());
  late itemsModel ItemsModel;
  late Statusrequest statusrequest ;
   int itemCountt =0 ;

  List ColorOfItem = [
    {"name": "red", "id": 1, "active": '0'},
  
    {"name": "blue", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'},
  ];

  InitialData()async {
    statusrequest =Statusrequest.loading;
    ItemsModel = Get.arguments['itemsmodel'];
    itemCountt = await cartcontroller.cartgetCountItem(ItemsModel.itemsId!.toString());
    print('============item countt==============$itemCountt');
    statusrequest =Statusrequest.success ;
    update();
  }

  add(){
    cartcontroller.cartadd(ItemsModel.itemsId!.toString());
    itemCountt ++ ;
    update();

  }

  remove(){
   if(itemCountt > 0){
       cartcontroller.cartdelete(ItemsModel.itemsId!.toString());
     itemCountt -- ;
   }
   update();
  }

  @override
  void onInit() {
    InitialData();
    super.onInit();
  }
}
