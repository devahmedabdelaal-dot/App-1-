import 'package:flutter/material.dart';

class CustomPayment extends StatelessWidget {
  final String titel ;
  final bool isactive ;
  const CustomPayment({super.key, required this.titel, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isactive ? Colors.blueAccent :  const Color.fromARGB(255, 164, 211, 233),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Text(titel,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

            );
  }
}