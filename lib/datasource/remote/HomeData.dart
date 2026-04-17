import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class Homedata {

  Crud crud ;
  Homedata(this.crud);

  getData()async{
    var response = await crud.postData(applink.home, {

           });
          
    return response.fold((l) => l, (r)=>r);

  }

  search(String search)async{
    var response = await crud.postData(applink.search, {
      "search" : search

           });
          
    return response.fold((l) => l, (r)=>r);

  }
}
        
