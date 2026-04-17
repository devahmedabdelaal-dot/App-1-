import 'package:flutter/material.dart';

class Textbodylogin extends StatelessWidget {
  final String body ;
  const Textbodylogin({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
           body      ,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
