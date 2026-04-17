import 'package:app1/function/CheckInternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res ;
  Internet()async{
    res = await ChackInternet();
    print("===================================");
    
    print(res);
    print("===================================");
  }

  @override
  void initState() {
    Internet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("test")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
           
            

          ],
        ),
      ),
    );
  } 
}