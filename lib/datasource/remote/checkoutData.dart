import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Checkoutdata {

  Crud crud ;
  Checkoutdata(this.crud);

  checkout(Map data)async{
    var response = await crud.postData(applink.checkout,data);
    return response.fold((l) => l, (r)=>r);

  }
}
            