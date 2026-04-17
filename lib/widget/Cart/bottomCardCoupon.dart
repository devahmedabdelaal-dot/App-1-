import 'package:flutter/material.dart';

class bottomCartCoupon extends StatelessWidget {
  final TextEditingController controllerCoupon;

  const bottomCartCoupon({super.key, required this.controllerCoupon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerCoupon,
      
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.local_offer),
        prefixIconColor: Colors.lightBlue,
        label: Text('coupon'),
        hint: Text('Enter your coupon'),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
