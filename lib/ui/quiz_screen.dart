import 'package:flutter/material.dart';
import 'package:quizzykids/model/db_connect.dart';
import 'package:quizzykids/model/question_model.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';
import 'package:quizzykids/widget/button_custom.dart';
import 'package:quizzykids/widget/options_card.dart';
import 'package:quizzykids/widget/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.kategori});
  final String kategori;


  @override
  State<QuizScreen> createState() => _QuizScreenState(
    kategoriQuiz: kategori
  );
}

class _QuizScreenState extends State<QuizScreen>{
  _QuizScreenState({required this.kategoriQuiz});
  String kategoriQuiz;
  var db = DbConnect();
  late Future _question;
  bool isPressed = false;
  bool isAlreadySelected = false;
  int index = 0;
  int benar = 0;
  int salah = 0;
  double skor = 0;

  //Future<List<Question>> getData(String kategori) async {
    //return db.fetchQuestion2(kategori);
  //}

  @override
  void initState(){
    _question = db.fetchQuestion2(kategoriQuiz);
    super.initState();
  }

  void nextQuestion(int questionLength){
    if (index == questionLength - 1 ) {
      skor=(benar/salah)*100;
      Navigator.popAndPushNamed(context, rSkor, arguments: '$skor');
    }else if(index < questionLength - 1){
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kamu belum memilih jawaban.'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 12),
        )
      );
    }
  }

  void trueFalse(bool value){
    if(isAlreadySelected){
      return;
    }else{
      setState(() {
        isAlreadySelected = true;
      });
      if(value == true){
        benar++;
      }else if(value == false){
        salah++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;
    if(_question==[]){
      return const Center(child: Text('No Data'),);
    }else{
      return FutureBuilder(
      future: _question as Future<List<Question>>,
      builder: (context, snapshot){
        var stackTrace = snapshot.stackTrace;
        var state = snapshot.connectionState;
        var error = snapshot.error;
        var snapData = snapshot.data;
        
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_quiz.png'),
                  fit: BoxFit.fitWidth
                ),
              ),
              child: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Question>;
            if(extractedData.isNotEmpty){
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
                            onPressed:() {
                              Navigator.popAndPushNamed(context, rHome,);
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
                                  kategoriQuiz,
                                  style: kHeading7,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
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
                                      image: AssetImage(extractedData[index].imageUri),
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                QuestionCard(
                                  question: extractedData[index].title,
                                  indexAction: index,
                                  totalQuestion: extractedData.length
                                )
                              ],
                            ),
                            const SizedBox(height: 12,),
                            for(int i=0; i < extractedData[index].options.length; i++)
                              GestureDetector(
                                onTap: () => trueFalse(extractedData[index].options.values.toList()[i]),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 12),
                                  width: widthDevice * 0.5,
                                  height: widthDevice * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(widthDevice * 0.08),
                                    border: Border.all(color: kBlack),
                                    color: isPressed ? kOrange : kYellow,
                                  ),
                                  child: OptionsCard(
                                    option: extractedData[index].options.keys.toList()[i],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      floatingActionButton: GestureDetector(
                        onTap: () => nextQuestion(extractedData.length),
                        child: const ButtonCustom(text: 'Lanjut')
                      ),
                    ),
                  ),
                  
                ],
              );
            }else{
              Center(
                child: Text("${snapshot.error}"),
              );
            }
          }else if(snapshot.data == []){
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_quiz.png'),
                  fit: BoxFit.fitWidth
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else{
          return const Center(
            child: Text('No Data'),
          );
        }
        return Center(
          child: Text('$snapshot\n\n$state.\n\n$stackTrace\n\n$error\n\n$snapData\n\n$_question', style: kHeading6,),
        );
      }
    );
    }
  }
}