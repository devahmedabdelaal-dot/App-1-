import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class TestData {

  Crud crud ;
  TestData(this.crud);

  getData()async{
    var response = await crud.postData(applink.test, {});
    return response.fold((l) => l, (r)=>r);

  }
}
            