import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzykids/bloc/login/login_cubit.dart';
import 'package:quizzykids/bloc/register/register_cubit.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/ui/home_screen.dart';
import 'package:quizzykids/ui/quiz_screen.dart';
import 'package:quizzykids/ui/register_succes.dart';
import 'package:quizzykids/ui/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NAV_KEY,
        onGenerateRoute: generateRoute,
        home: const QuizScreen(),
      ),
    );
  }
}