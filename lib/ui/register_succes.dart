import 'package:flutter/material.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class RegisterSuccessScreen extends StatefulWidget{
  const RegisterSuccessScreen({super.key});
  
  @override
  State<RegisterSuccessScreen> createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen>{
  @override 
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_image.png'),
                    fit: BoxFit.fitWidth
                  ),
                ),
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          body: Center(
              child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.28,),
                Icon(
                  Icons.check_circle_rounded,
                  color: kLightGreen,
                  size: MediaQuery.sizeOf(context).width * 0.5,
                ),
                Text(
                  'Akun berhasil terdaftar',
                  style: kButton1,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).width * 0.1,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, rEmailLogin);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kDeepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      'Back to Login',
                      style: kButton1,
                    ),
                  )
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}