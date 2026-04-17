import 'package:flutter/material.dart';

class Bottonlanguage extends StatelessWidget {
  final Function()? onPressed ;
  final String textbutton ;
  const Bottonlanguage({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.lightBlue,
                onPressed: onPressed,
                child: Text(
                  textbutton,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
  }
}