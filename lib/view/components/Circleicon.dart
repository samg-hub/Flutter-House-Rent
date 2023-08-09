import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget{
  CircleIcon({super.key, required this.icon});
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45,width: 0.5,),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: icon,
    );
  }

}