import 'package:flutter/material.dart';
import 'package:quizzykids/model/db_connect.dart';
import 'package:quizzykids/model/question_model.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';
import 'package:quizzykids/widget/button_custom.dart';
import 'package:quizzykids/widget/options_card.dart';
import 'package:quizzykids/widget/question_card.dart';

class MusicQuizScreen extends StatefulWidget {
  const MusicQuizScreen({
    super.key,
  });

  @override
  State<MusicQuizScreen> createState() => _MusicQuizScreenState();
}

class _MusicQuizScreenState extends State<MusicQuizScreen> {
  _MusicQuizScreenState();

  @override
  // ignore: must_call_super
  void initState() {
    _questionFuture = db.fetchMusicQuestion();
    _questionFuture.then((data) {
      itemCount = data.length;
      for (int i = 0; i <= itemCount - 1; i++) {
        _question.add(data[i]);
      }
    });
  }

  var db = DbConnect();
  bool isPressed = false;
  bool isAlreadySelected = false;
  int index = 0;
  int benar = 0;
  int salah = 0;
  double skor = 0;
  int itemCount = 0;
  late List<Question> _question = [];
  late Future<List<Question>> _questionFuture;
  Map<String, dynamic> mapSkor = {'kategori': 'Musik'};

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      skor = (benar / salah) * 100;
      final finalSkor = <String, dynamic>{
        'skor': skor,
        'benar': benar,
        'salah': salah
      };
      mapSkor.addEntries(finalSkor.entries);
      Navigator.popAndPushNamed(context, rSkor, arguments: mapSkor);
    } else if (index < questionLength - 1) {
      if (isPressed != true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Kamu belum memilih jawaban.'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 12),
        ));
      } else if (isPressed == true) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      }
    }
  }

  void trueFalse(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      setState(() {
        isAlreadySelected = true;
        isPressed = true;
      });
      if (value == true) {
        benar++;
      } else if (value == false) {
        salah++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;
    return FutureBuilder(
        future: _questionFuture,
        builder: (context, snapshot) {
          while (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_quiz.png'),
                    fit: BoxFit.fitWidth),
              ),
              child: const CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_quiz.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                padding: EdgeInsets.all(widthDevice * 0.05),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    toolbarHeight: heightDevice * 0.08,
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    leading: Container(
                      width: widthDevice * 0.15,
                      height: widthDevice * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDeepPurple,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.popAndPushNamed(
                            context,
                            rHome,
                          );
                        },
                        color: kWhite,
                      ),
                    ),
                    title: Text(
                      'Quizzy Kids',
                      style: kHeading2,
                    ),
                  ),
                  body: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
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
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Salah : $salah',
                              style: kSubtitle2,
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                'Benar : $benar',
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
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(_question[index].imageUri),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            QuestionCard(
                                question: _question[index].title,
                                indexAction: index,
                                totalQuestion: _question.length)
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        for (int i = 0;
                            i < _question[index].options.length;
                            i++)
                          GestureDetector(
                            onTap: () => trueFalse(
                                _question[index].options.values.toList()[i]),
                            child: OptionsCard(
                              widthDevice: widthDevice,
                              heightDevice: heightDevice,
                              color: kYellow,
                              option: _question[index].options.keys.toList()[i],
                            ),
                          )
                      ],
                    ),
                  ),
                  floatingActionButton: GestureDetector(
                      onTap: () => nextQuestion(_question.length),
                      child: const ButtonCustom(text: 'Lanjut')),
                ),
              ),
            ],
          );
        });
  }
}
