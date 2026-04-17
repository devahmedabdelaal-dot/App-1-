import 'package:app1/address/add.dart';
import 'package:app1/address/view.dart';
import 'package:app1/core/routes.dart';
import 'package:app1/middleware/myMiddleWare.dart';

import 'package:app1/screen/HomeScreen.dart';
import 'package:app1/screen/cart.dart';
import 'package:app1/screen/chekout.dart';
import 'package:app1/screen/favorite.dart';
import 'package:app1/screen/forgetPassword/forgetPass.dart';
import 'package:app1/screen/forgetPassword/veryfiycodeSinup.dart';
import 'package:app1/screen/items.dart';
import 'package:app1/screen/language.dart';
import 'package:app1/screen/login.dart';
import 'package:app1/screen/onboarding.dart';

import 'package:app1/screen/forgetPassword/reseatPassword.dart';
import 'package:app1/screen/orders/archive.dart';
import 'package:app1/screen/orders/details.dart';
import 'package:app1/screen/orders/pending.dart';
import 'package:app1/screen/productDetails.dart';
import 'package:app1/screen/signup.dart';
import 'package:app1/screen/forgetPassword/successResetPas.dart';
import 'package:app1/screen/successSinup.dart';
import 'package:app1/screen/forgetPassword/veryfiyccode.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';




List<GetPage<dynamic>>? routes =[
  
  GetPage(name: "/", page: ()=> Language(),middlewares:[Mymiddleware()] ),
  GetPage(name: Approute.login, page: ()=> login()),
  GetPage(name: Approute.Signup, page: ()=> Signin()),
  GetPage(name: Approute.onboarding, page: ()=> onboarding()),
  GetPage(name: Approute.forgetpass, page: ()=> Forgetpass()),
  GetPage(name: Approute.Reseatpassword, page: ()=> Reseatpassword()),
  GetPage(name: Approute.Verifiyccode , page: ()=> Veryfiyccode()),
  GetPage(name: Approute.veryfiycodesignup, page: ()=> VeryfiyccodeSignup()),
  GetPage(name: Approute.Successsinup, page: ()=> Successsinup()),
  GetPage(name: Approute.Successresetpas, page: ()=> Successresetpas()),
  GetPage(name: Approute.home, page: ()=> HomeScreen()),
  GetPage(name: Approute.items, page: ()=> ItemsProduct()),
  GetPage(name: Approute.itemsDetails, page: ()=> ProductDetails()),
  GetPage(name: Approute.favorite, page: ()=> favorite()),
  GetPage(name: Approute.cart, page: ()=> Cart()),
  GetPage(name: Approute.AddressView, page: ()=> AddressView()),
  GetPage(name: Approute.AddressAdd, page: ()=> AddressAdd()),
  GetPage(name: Approute.Checkout, page: ()=> Checkout()),
  GetPage(name: Approute.Archive, page: ()=> Archive()),
  GetPage(name: Approute.Pending, page: ()=> OrdersPending()),
  GetPage(name: Approute.ordersDetails, page: ()=> OrdersDetails()),
];





