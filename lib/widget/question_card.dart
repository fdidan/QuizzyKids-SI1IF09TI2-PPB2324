import 'package:flutter/material.dart';
import 'package:quizzykids/styles/text_styles.dart';

class QuestionCard extends StatelessWidget{
  const QuestionCard({super.key, required this.question, required this.indexAction, required this.totalQuestion});
  
  final String? question;
  final int indexAction;
  final int totalQuestion;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        question!,
        style: kHeading7,
        textAlign: TextAlign.center,
      ),
    );
  }
}