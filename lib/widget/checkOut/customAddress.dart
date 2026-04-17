import 'package:flutter/material.dart';

class CustomAddress extends StatelessWidget {
  final String titel ;
  final String subtitel ;
  final bool active ;

  const CustomAddress({super.key, required this.titel, required this.subtitel, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                color:active ? Colors.blueAccent :  const Color.fromARGB(255, 164, 211, 233),
                child: ListTile(
                title: Text(titel),
                subtitle: Text(subtitel),
              ),),
            );
  }
}