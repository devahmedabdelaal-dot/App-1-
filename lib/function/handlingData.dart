import 'package:app1/core/class/StatusRequest.dart';

handlingData(respons){
if(respons is Statusrequest){
return respons;
}else {
  return Statusrequest.success;
}
}