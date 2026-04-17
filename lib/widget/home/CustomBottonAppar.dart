import 'package:flutter/material.dart';

class CastomButtonAppar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  final Color ColorsSelected;
  final bool active;

  CastomButtonAppar({
    super.key,
    this.onPressed,
    required this.text,
    required this.iconData,
    required this.ColorsSelected,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            iconData,
            color: active == true ? Colors.deepOrange : ColorsSelected,
          ),
          Text(text,style: TextStyle( color:  active == true ? Colors.deepOrange : ColorsSelected),),
        ],
      ),
    );
  }
}
