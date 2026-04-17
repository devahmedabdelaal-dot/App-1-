import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomApparHome extends StatelessWidget {
  final String text ;
 final void Function()? onPressedsearch;
 final void Function()? onPressedIcon;
 final void Function()? onPressedIconfavorite;
 final void Function(String)? onChanged ;
 final TextEditingController mycontroller ;
  const CustomApparHome
({super.key, this.onPressedsearch, required this.text, this.onPressedIcon, required this.onPressedIconfavorite, this.onChanged, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: onChanged,
                          controller: mycontroller,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(onPressed: onPressedsearch, icon: Icon(Icons.search),),
                            hintText: text,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey[200],
                        ),
                        child: IconButton(
                          onPressed: onPressedIcon,
                          icon: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey[200],
                        ),
                        child: IconButton(
                          onPressed: onPressedIconfavorite,
                          icon: Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}