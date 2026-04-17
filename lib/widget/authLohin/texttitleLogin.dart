import 'package:flutter/material.dart';

class Texttitlelogin extends StatelessWidget {
  final String title;
  const Texttitlelogin({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.displayLarge?.copyWith(color: Colors.lightBlue),
      textAlign: TextAlign.center,
    );
  }
}
