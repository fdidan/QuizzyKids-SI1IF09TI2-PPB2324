import 'package:flutter/material.dart';
import 'package:quizzykids/ui/email_login.dart';
import 'package:quizzykids/ui/forgot_password.dart';
import 'package:quizzykids/ui/home_screen.dart';
import 'package:quizzykids/ui/login.dart';
import 'package:quizzykids/ui/quiz/animal_quiz_screen.dart';
import 'package:quizzykids/ui/quiz/history_quiz_screen.dart';
import 'package:quizzykids/ui/quiz/music_quiz_screen.dart';
import 'package:quizzykids/ui/quiz/sport_quiz_screen.dart';
import 'package:quizzykids/ui/register.dart';
import 'package:quizzykids/ui/register_succes.dart';
import 'package:quizzykids/ui/skor_screen.dart';

MaterialPageRoute _pageRoute({
  required Widget body,
  required RouteSettings settings,
}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;

  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: const LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: const RegisterScreen(), settings: settings);
      break;
    case rEmailLogin:
      _route = _pageRoute(body: const EmailLogin(), settings: settings);
      break;
    case rForgotPassword:
      _route = _pageRoute(body: const ForgotPassword(), settings: settings);
      break;
    case rRegisterSuccess:
      _route =
          _pageRoute(body: const RegisterSuccessScreen(), settings: settings);
      break;
    case rHome:
      _route = _pageRoute(body: const HomeScreen(), settings: settings);
      break;
    case rMusicQuiz:
      _route = _pageRoute(
        body: const MusicQuizScreen(),
        settings: settings,
      );
      break;
    case rSportQuiz:
      _route = _pageRoute(
        body: const SportQuizScreen(),
        settings: settings,
      );
      break;
    case rHistoryQuiz:
      _route = _pageRoute(
        body: const HistoryQuizScreen(),
        settings: settings,
      );
      break;
    case rAnimalQuiz:
      _route = _pageRoute(
        body: const AnimalQuizScreen(),
        settings: settings,
      );
      break;
    case rSkor:
      _args as Map<String, dynamic>;
      _route = _pageRoute(
          body: SkorScreen(
            finalSkor: _args,
          ),
          settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';
const String rEmailLogin = '/emaillogin';
const String rForgotPassword = '/forgotpassword';
const String rRegisterSuccess = '/registersuccess';
const String rMusicQuiz = '/musicquizscreen';
const String rSportQuiz = '/sportquizscreen';
const String rHistoryQuiz = '/historyquizscreen';
const String rAnimalQuiz = '/animalquizscreen';
const String rSkor = '/skorscreen';
