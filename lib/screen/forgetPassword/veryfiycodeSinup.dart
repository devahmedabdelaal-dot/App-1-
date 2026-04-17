import 'package:app1/controller/veryfiycodeSignupController.dart';
import 'package:app1/widget/authLohin/textBodyLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VeryfiyccodeSignup extends StatelessWidget {
  const VeryfiyccodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    VerifiySignupcontrollerImp controller = Get.put(VerifiySignupcontrollerImp());
    // TextEditingController email;
    // TextEditingController password;
    return Scaffold(
      appBar: AppBar(
        title: Text(" Check Code ", style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [

            
             SizedBox(height: 20),
           
          
           
            
            Textbodylogin(
              body:
                  'Enter your code for verification.',
            ),
            SizedBox(height: 20),

          
          
             OtpTextField(
               
              fieldWidth: 50,
              borderRadius:BorderRadius.circular(20) ,
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
        controller.GoTosuccessSignup();
            
        }, // end onSubmit
    ),

            
            
             SizedBox(height: 20,),
            
            
          ],
        ),
      ),
    );
  }
}
