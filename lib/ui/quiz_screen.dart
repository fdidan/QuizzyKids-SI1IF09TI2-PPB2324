import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_quiz.png'),
              fit: BoxFit.fitWidth
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: widthDevice * 0.05, vertical: widthDevice * 0.05),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color.fromARGB(0, 7, 85, 255),
            appBar: AppBar(
              toolbarHeight: heightDevice * 0.08,
              centerTitle: true,
              backgroundColor: const Color.fromARGB(0, 255, 193, 7),
              leading: Container(
                width: widthDevice * 0.15,
                height: widthDevice * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kDeepPurple,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed:() {
                    Navigator.pop(context);
                  },
                  color: kWhite,
                ),
              ),
              title: Text('Quizzy Kids', style: kHeading2,),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Container(
                    width: widthDevice * 0.9,
                    height: heightDevice * 0.08,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kYellow,
                    ),
                    child: Center(
                      child: Text(
                        'Musik',
                        style: kHeading7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salah : ',
                        style: kSubtitle2,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'Benar : ',
                          style: kSubtitle2,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: widthDevice * 0.6,
                        height: widthDevice * 0.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/model_img_quiz.png'))
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Center(
                        child: Text(
                          'Ampar Ampar Pisang\nmerupakan lagu daerah?',
                          style: kSubtitle2,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: heightDevice * 0.3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
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
                              'Kembali',
                              style: kSubtitle1,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
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
                              'Lanjut',
                              style: kSubtitle1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  
}