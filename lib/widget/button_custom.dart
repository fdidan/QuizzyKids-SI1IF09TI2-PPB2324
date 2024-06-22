import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class ButtonCustom extends StatelessWidget{
  const ButtonCustom({super.key, required this.text,});

  final String text;
  
  @override
  Widget build(BuildContext context) {

    var widthDevice = MediaQuery.sizeOf(context).width;
    
    return Container(
      width: widthDevice * 0.3,
      height: widthDevice * 0.1,
      decoration: const BoxDecoration(
        color: kRed,
        boxShadow: [
          BoxShadow(
            color: kBlack,
            offset: Offset(-2, 3),
            spreadRadius: 3
          )
        ], 
      ),
      child: Center(
        child: Text(
          text,
          style: kSubtitle1,
        ),
      ),
    );
  }
  
}