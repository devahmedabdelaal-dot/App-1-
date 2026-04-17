import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterItemDetails extends StatelessWidget {
  final void Function()? remove;
  final void Function()? add;
  final String number  ;
 
  final String price  ;

  const CounterItemDetails({super.key, this.remove, this.add, required this.price, required this.number, });

  @override
  Widget build(BuildContext context) {
    return  Row(children: [

                Row(children: [
          
                  IconButton(onPressed:remove, icon: Icon(Icons.remove)),
               
                  Container(height: 30,width: 50,alignment: Alignment.center, decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 1, 38, 69))), child: Text(number,style: TextStyle(height: 1.1, fontWeight: FontWeight.bold,fontSize: 20),),),
                  IconButton(onPressed:add, icon: Icon(Icons.add)),
                ],),
                Spacer(),
                Text('${price} \$', style: TextStyle(height: 1.1, fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepOrange))
              ],);
  }
}