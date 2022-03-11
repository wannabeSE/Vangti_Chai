import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  final color;
  final textClr;
  final btText;
  final btTap;
  MyButton({this.color,this.textClr,this.btText,this.btTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:btTap ,
      child: ClipRRect(
        borderRadius:BorderRadius.circular(50), 
        child: Container(
          color: color,
          child: Center(child: Text(btText,style: TextStyle(color:textClr,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Lobster'
          ),
          ),
          ),
        ),
      ),
    );
  }
}