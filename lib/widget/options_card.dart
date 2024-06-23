import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard(
      {super.key,
      required this.option,
      required this.widthDevice,
      required this.heightDevice,
      required this.color});

  final String option;
  final double widthDevice;
  final double heightDevice;
  final Color color;
  //final Function trueFalseChecker;

  @override
  Widget build(BuildContext context) {
    //var widthDevice = MediaQuery.sizeOf(context).width;

    return Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: widthDevice * 0.5,
          height: widthDevice * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthDevice * 0.08),
            border: Border.all(color: kBlack),
            color: color,
          ),
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
        ));
  }
}
