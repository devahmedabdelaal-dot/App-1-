import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class ResetPasswordData {

  Crud crud ;
  ResetPasswordData(this.crud);

  postdata(String password,String email)async{
    var response = await crud.postData(applink.resetpassword, {
       "password":password ,
       "email": email,

           });
         
    return response.fold((l) => l, (r)=>r);

  }
}
            