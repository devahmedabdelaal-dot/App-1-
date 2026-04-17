

import 'dart:convert';

import 'package:app1/core/class/StatusRequest.dart';
import 'package:app1/function/CheckInternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;

class Crud {

  Future<Either<Statusrequest,Map>> postData(String linkUrl , Map data)async{

    try{
       if (await ChackInternet()){
      var response =  await http.post(Uri.parse(linkUrl), body: data);
      if(response.statusCode == 200 || response.statusCode == 201){
       
       Map responsebody = jsonDecode(response.body);
       return right(responsebody);
      }else{
        return left(Statusrequest.serverfailure);
      }
      
      

    }else{
      
      return Left(Statusrequest.offlinefailure);
    }
    }catch(_){
       return left(Statusrequest.serverfailure);
    }
    
  }
}