import 'package:flutter/material.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
        title: Text('Add new address'),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: (){},child: Icon(Icons.add),),
      body: ListView(),
    );
  }
}