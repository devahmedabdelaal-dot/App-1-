import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/datasource/remote/signUp_data.dart';
import 'package:app1/function/handlingData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class signupncontroller extends GetxController {
  signup();
  GoTosignin();
}

class signupControllerImp extends signupncontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController user;
  late TextEditingController password;
  bool isShowPassword = true;

 Statusrequest? statusrequest;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  ShowPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;

      var response = await signupData.postdata(
        user.text,
        password.text,
        email.text,
        phone.text,
      );
      statusrequest = handlingData(response);
      if (statusrequest == Statusrequest.success) {
        // data.addAll (response['data']) ;
        Get.offNamed(Approute.veryfiycodesignup);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email Or Phone Already Exists",
        );
        statusrequest = Statusrequest.failure;
      }
      update();
    } else {
      print('NOT VALID');
    }
  }

  @override
  GoTosignin() {
    Get.offNamed(Approute.login);

    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    phone = TextEditingController();
    user = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    user.dispose();
    super.dispose();
  }
}
