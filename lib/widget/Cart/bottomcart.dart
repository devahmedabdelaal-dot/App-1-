import 'package:flutter/material.dart';

class Bottoncard extends StatelessWidget {
  final void Function()? onPressed ;
  final String text ;
  const Bottoncard({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 13),
      onPressed: onPressed,
      color: Colors.lightBlue,
      textColor: Colors.white,
      child: Text(text),
      ),
    );
  }
}