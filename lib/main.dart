
import 'package:app1/bindings/initialbinding.dart';
import 'package:app1/localization/changelang.dart';
import 'package:app1/localization/translation.dart';
import 'package:app1/routes.dart';
import 'package:app1/screen/HomeScreen.dart';
import 'package:app1/screen/favorite.dart';
import 'package:app1/screen/language.dart';
import 'package:app1/screen/onboarding.dart';
import 'package:app1/screen/testView.dart';
import 'package:app1/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app1/services/services.dart';
void main()async {

WidgetsFlutterBinding.ensureInitialized();
await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: Mytranslation(),
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
       
        
        fontFamily:'PlayfairDisplay' ,
        textTheme: TextTheme(
          
          
          displayLarge:const  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ), 
          bodyLarge:TextStyle(
                          height: 2,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ), 
        ),

        
        primarySwatch: Colors.blue,
      ),
      initialBinding:Initialbindings() ,
      // home: const favorite(),
      // home: const Language() ,
      getPages: routes,//
      // routes:routes ,
      
    );
  }
}