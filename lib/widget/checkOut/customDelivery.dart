import 'package:flutter/material.dart';

class CustomDelivery extends StatelessWidget {
  final String titel ;
  final String imageName ;
  final bool active ;
  const CustomDelivery({super.key, required this.titel, required this.imageName, required this.active});

  @override
  Widget build(BuildContext context) {
    return   Container(
                  
                    color:active ? Colors.blueAccent :  const Color.fromARGB(255, 164, 211, 233),
                    child: Column(children: [
                     Image.asset(imageName,width: 100,) ,
                     
                      Text(titel,style: TextStyle(color: Colors.white),)
                    ],),
                  );
  }
}