import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class MyFavoritedata {

  Crud crud ;
  MyFavoritedata(this.crud);

  

  MyfavoriteData(String id )async{
    var response = await crud.postData(applink.favoriteData, {"id" :id  });
    return response.fold((l) => l, (r)=>r);

  }

  deleteFromFavorite(String id )async{
    var response = await crud.postData(applink.favoriteDelete, {"id" :id  });
    return response.fold((l) => l, (r)=>r);

  }


}
            