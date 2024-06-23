import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizzykids/model/question_model.dart';

class DbConnect {
  final urlMusic = Uri.parse(
      'https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/music.json');
  final urlSport = Uri.parse(
      'https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/sport.json');
  final urlHistory = Uri.parse(
      'https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/history.json');
  final urlAnimal = Uri.parse(
      'https://quizzykids-f91b7-default-rtdb.asia-southeast1.firebasedatabase.app/animal.json');

  Future<List<Question>> fetchMusicQuestion() async {
    List<Question> question = [];
    return http.get(urlMusic).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        var newQuestion = Question(
            id: key,
            imageUri: value['image'],
            title: value["question"],
            options:
                Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
        question.add(newQuestion);
      });
      return question;
    });
  }

  Future<List<Question>> fetchAnimalQuestion() async {
    List<Question> question = [];
    return http.get(urlAnimal).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        var newQuestion = Question(
            id: key,
            imageUri: value['image'],
            title: value["question"],
            options:
                Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
        question.add(newQuestion);
      });
      return question;
    });
  }

  Future<List<Question>> fetchSportQuestion() async {
    List<Question> question = [];
    return http.get(urlSport).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        var newQuestion = Question(
            id: key,
            imageUri: value['image'],
            title: value["question"],
            options:
                Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
        question.add(newQuestion);
      });
      return question;
    });
  }

  Future<List<Question>> fetchHistoryQuestion() async {
    List<Question> question = [];
    return http.get(urlHistory).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        var newQuestion = Question(
            id: key,
            imageUri: value['image'],
            title: value["question"],
            options:
                Map.castFrom(value["options"]) //Map.castFrom(value["options"])
            );
        question.add(newQuestion);
      });
      return question;
    });
  }
}
