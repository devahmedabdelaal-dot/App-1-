import 'package:app1/core/class/crud.dart';
import 'package:app1/link.dart';

class SignupData {

  Crud crud ;
  SignupData(this.crud);

  postdata(String username,String password,String email,String phone)async{
    var response = await crud.postData(applink.signup, {
       "username": username,
       "password":password ,
       "email": email,
       "phone": phone, 

           });
    return response.fold((l) => l, (r)=>r);

  }
}
            