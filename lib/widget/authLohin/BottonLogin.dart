import 'package:flutter/material.dart';

class Bottonlogin extends StatelessWidget {
  final void Function()? onPressed ;
  final String text ;
  const Bottonlogin({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
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