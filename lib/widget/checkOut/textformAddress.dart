import 'package:flutter/material.dart';

class TextFormAddress extends StatelessWidget {
  final TextEditingController controllerAddress;
  final GlobalKey<FormState> formKey;
  const TextFormAddress({
    super.key,
    required this.controllerAddress,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controllerAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Address is required";
          } else if (value.length < 10) {
            return "Minimum 10 characters required";
          }
          return null;
        },

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          prefixIconColor: Colors.lightBlue,
          label: Text('Address'),
          hint: Text('Enter your Address'),
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
      ),
    );
  }
}
