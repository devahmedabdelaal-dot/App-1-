import 'package:app1/core/class/StatusRequest.dart';

import 'package:app1/datasource/remote/myFavoriteData.dart';
import 'package:app1/function/handlingData.dart';
import 'package:app1/model/myFavoriteModel.dart';
import 'package:app1/services/services.dart';
import 'package:get/get.dart';

class Myfavoritecontroller extends GetxController {
  MyServices myServices = Get.find();
  MyFavoritedata myfavoritedata = MyFavoritedata(Get.find());
  late Statusrequest statusrequest;

  List<myFavoriteModel> data = [];

  myfavoriteData() async {
    data.clear();
    statusrequest = Statusrequest.loading;

    var response = await myfavoritedata.MyfavoriteData(
      myServices.sharedPreferences.getString('id')!,
    );
    // print('========================$response');
    statusrequest = handlingData(response);
    if (response["status"] == "success") {
      List responsedata = response['data'];
      data.addAll(responsedata.map((e) => myFavoriteModel.fromJson(e)));
      // data.addAll (response['data']) ;
     
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }

  DeletFromfavorite(String favoriteid) {

    var response = myfavoritedata.deleteFromFavorite(favoriteid);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);

    update();
  }

  @override
  void onInit() {
    myfavoriteData();

    super.onInit();
  }
}
