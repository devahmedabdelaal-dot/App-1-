import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Orderspendingdata {

  Crud crud ;
  Orderspendingdata(this.crud);

  getData(String usersid)async{
    var response = await crud.postData(applink.orderspending, {
      "usersid" : usersid
    });
    return response.fold((l) => l, (r)=>r);

  }
}
            