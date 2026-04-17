import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCurdHome extends StatelessWidget {
  final String titel ;
  final String body ;

  const CustomCurdHome({super.key, required this.titel, required this.body});

  @override
  Widget build(BuildContext context) {
    return 
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        child: ListTile(
                          title: Text(
                            titel,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            body,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlue,
                        ),
                      ),
                      Positioned(
                        top: -20,
                        right: -80,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}