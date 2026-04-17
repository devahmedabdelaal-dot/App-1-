import 'package:flutter/material.dart';

class Textformlogin extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final IconData iconData;
  final TextEditingController textcontroller;
  final String? Function(String?) valid ;
  final bool isNumber ;
  final bool? obscureText ;
  final void Function()? onTapicon ;


  const Textformlogin({super.key, required this.hintText, required this.labeltext, required this.iconData,  required this.textcontroller, required this.valid, required this.isNumber, this.obscureText, this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 40),
      child: TextFormField(
        obscureText: obscureText == null  || obscureText == false ? false : true,
        keyboardType:isNumber? TextInputType.number : TextInputType.text ,
        validator: valid,
        controller: textcontroller,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  hintText:hintText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Container(
                      margin: EdgeInsets.symmetric(horizontal: 9),
                       child: Text(labeltext)),
                   suffixIcon: InkWell(child: Icon(iconData),
                   onTap:onTapicon ,
                   ),
                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
    );
  }
}