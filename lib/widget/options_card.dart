import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class OptionsCard extends StatelessWidget{
  const OptionsCard({super.key, required this.option});
  
  final String option;
  //final bool isSelected;
  //final Function trueFalseChecker;
  
  @override
  Widget build(BuildContext context) {

    //var widthDevice = MediaQuery.sizeOf(context).width;

    return Card(
      color: Colors.transparent,
      //semanticContainer: false,
      //borderOnForeground: false,
      //surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: ListTile(
        minVerticalPadding: 0,
        selectedColor: kWhite,
        title: Center(
          heightFactor: 4,
          child: Text(
            option,
            style: kSubtitle3,
          ),
        ),
      ),
    );
  }
  
}