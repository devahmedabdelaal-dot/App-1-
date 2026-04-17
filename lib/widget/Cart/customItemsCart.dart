
import 'package:app1/link.dart';
import 'package:flutter/material.dart';

class ItemsCartCart extends StatelessWidget {
  final String titel ;
  final String price ;
  final String image ;
  final int count ;
  final void Function()? onadd ;
  final void Function()? ondelete ;

  const ItemsCartCart({super.key, required this.titel, required this.price, required this.count, required this.image, this.onadd, this.ondelete});

  @override
  Widget build(BuildContext context) {
    return  Card(
                  child: Container(
                    child: Row(
                      children: [
                          SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: Image.network(applink.imageStatic+image,fit: BoxFit.cover,)),
                          SizedBox(width: 15,),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('$titel '),
                            subtitle: Text('$price \$',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                            
                            
                          ),
                        Expanded(
                          flex: 1,
                          child: Column(children: [
                          IconButton(onPressed: onadd, icon: Icon(Icons.add)),
                          Container(
                            
                            child: Text('$count'),),
                          IconButton(onPressed: ondelete, icon: Icon(Icons.remove)),
                        ],)),
                      ],
                    ),
                  ),
                );
  }
}