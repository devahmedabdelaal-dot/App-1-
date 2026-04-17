import 'package:flutter/material.dart';

class Rowloginsinup extends StatelessWidget {
  final String text ;
  final String text2 ;
  final void Function() onTap ;
  const Rowloginsinup({super.key, required this.text, required this.onTap, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
               Text(text2),
             InkWell(
              onTap: onTap,
              child: Text(text,style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),)
             ],);
  }
}