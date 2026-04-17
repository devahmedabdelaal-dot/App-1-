import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Favoritedata {

  Crud crud ;
  Favoritedata(this.crud);

  favoriteAdd(String usersid ,String itemsid)async{
    var response = await crud.postData(applink.favoriteAdd, {"usersid" : usersid , "itemsid" : itemsid});
    return response.fold((l) => l, (r)=>r);

  }
  favoriteRemove(String usersid ,String itemsid)async{
    var response = await crud.postData(applink.favoriteRemove, {"usersid" :usersid , "itemsid" :itemsid });
    return response.fold((l) => l, (r)=>r);

  }
  


}
            