import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Cartdata {

  Crud crud ;
  Cartdata(this.crud);

  cartAdd(String usersid ,String itemsid)async{
    var response = await crud.postData(applink.cartAdd, {"usersid" : usersid , "itemsid" : itemsid});
    return response.fold((l) => l, (r)=>r);

  }
  cartRemove(String usersid ,String itemsid)async{
    var response = await crud.postData(applink.cartDelete, {"usersid" :usersid , "itemsid" :itemsid });
    return response.fold((l) => l, (r)=>r);

  }
  cartgetCountItem(String usersid ,String itemsid)async{
    var response = await crud.postData(applink.cartGetitemCount, {"usersid" :usersid , "itemsid" :itemsid });
    return response.fold((l) => l, (r)=>r);

  }
  cartview(String usersid )async{
    var response = await crud.postData(applink.cartView, {"usersid" :usersid });
    return response.fold((l) => l, (r)=>r);

  }
  checkCoupon(String couponname )async{
    var response = await crud.postData(applink.checkCoupon, {"name" :couponname });
    return response.fold((l) => l, (r)=>r);

  }
  


}
            