import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/resetpassword_Data.dart';
import 'package:app1/function/handlingData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Resetpasswordcontroller extends GetxController {
  resetpass();
  GoToSuccessResetpassword();
}

class ResetpasswordcontrollerImp extends Resetpasswordcontroller {
  ResetPasswordData resetpassword = ResetPasswordData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController rePassword;
  late Statusrequest statusrequest;

  resetpass() {
    throw UnimplementedError();
  }

  @override
  GoToSuccessResetpassword() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;

      var response = await resetpassword.postdata(password.text, rePassword.text);
      statusrequest = handlingData(response);
      if (statusrequest == Statusrequest.success) {
        // data.addAll (response['data']) ;
        Get.offNamed(Approute.Successresetpas);
      } else {
        print(response);
        print('===========================');
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email Or password not true",
        );
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
