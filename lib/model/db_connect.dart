import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizzykids/model/question_model.dart';

class DbConnect {

  
  final urlMusic = Uri.parse('https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/music.json');
  final urlSport = Uri.parse('https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/sport.json');
  final urlHistory = Uri.parse('https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/history.json');
  final urlAnimal = Uri.parse('https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/animal.json');

  Future<List<Question>> fetchQuestion2(String kategori) async {
    List<Question> question=[];
    if(kategori=="Musik"){
      http.get(urlMusic).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["question"],
              options: Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
            question.add(newQuestion);
            //print(question[0]);
          });
          print(question);
          print('\n$data');
          return question;
        });
    }else if(kategori=="Binatang"){
      http.get(urlAnimal).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["question"],
              options: Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
            question.add(newQuestion);
          });
          return question;
        });
    }else if(kategori=="Sejarah"){
      http.get(urlHistory).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["question"],
              options: Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
            question.add(newQuestion);
          });
          return question;
        });
    }else if(kategori=="Olahraga"){
      http.get(urlSport).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["question"],
              options: Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
            question.add(newQuestion);
          });
          return question;
        });
    }
    return question;
  }

  Future<List<Question>> fetchQuestion(String kategori) async {
    List<Question> displayQuestion = [];
    switch(kategori){
      case "Musik" :
        http.get(urlMusic).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["question"],
              options: Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
            displayQuestion.add(newQuestion);
          });
          return displayQuestion;
        });
      break;
      case "Olahraga" :
        http.get(urlSport).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>; //as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["title"],
              options: Map.castFrom(value["options"])
            );
            displayQuestion.add(newQuestion);
          });
          return displayQuestion;
        });
      break;
      case "Sejarah" :
        http.get(urlHistory).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>; //as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["title"],
              options: Map.castFrom(value["options"])
            );
            displayQuestion.add(newQuestion);
          });
          return displayQuestion;
        });
      break;
      case "Binatang" :
        http.get(urlAnimal).then((response){
          var data = json.decode(response.body) as Map<String, dynamic>; //as Map<String, dynamic>;
          
          data.forEach((key, value){
            var newQuestion = Question(
              id: key,
              imageUri: value['image'],
              title: value["title"],
              options: Map.castFrom(value["options"])
            );
            displayQuestion.add(newQuestion);
          });
          return displayQuestion;
        });
      break;
    }
    return displayQuestion;
  }
}