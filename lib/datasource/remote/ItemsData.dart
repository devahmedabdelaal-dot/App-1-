import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Itemsdata {

  Crud crud ;
  Itemsdata(this.crud);

  getData(String id ,String usersId)async{
    var response = await crud.postData(applink.items, {"id" : id.toString() , "usersId" : usersId});
    return response.fold((l) => l, (r)=>r);

  }
}
            