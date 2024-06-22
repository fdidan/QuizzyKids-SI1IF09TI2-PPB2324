import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';
import 'package:quizzykids/ui/login.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    Timer(const Duration(seconds: 3), () => const LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: kDeepPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/simplecloud.png')
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/lamp.png',
                        height: MediaQuery.of(context).size.width * 0.15,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  'Selamat Datang',
                  style: kHeading3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.png'
                      )
                    )
                  ),
                ),
                Text(
                  'Quizzy Kids',
                  style: kHeading4,
                ),
                const SizedBox(height: 10,),
                Text(
                  'Tunjukkan Kepintaranmu',
                  style: kSubtitle1,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/mountain.png',
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}