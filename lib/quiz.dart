import 'package:flutter/material.dart';
import 'package:quiz_appp/data/questions.dart';
import 'package:quiz_appp/question_screen.dart';
import 'package:quiz_appp/results_screen.dart';
import 'package:quiz_appp/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var currentScreen = 'start-screen';
  void changeScreen(){
    setState(() {
      currentScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        currentScreen = 'result-screen';
      });
    }
  }

  void restartQuiz(){
    selectedAnswers = [];
    setState(() {
      currentScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;
    if(currentScreen == 'start-screen'){
      activeScreen = StartScreen(changeScreen);
    } else if(currentScreen == 'question-screen'){
      activeScreen = QuestionScreen(chooseAnswer);
    } else {
      activeScreen = ResultScreen(selectedAnswers, restartQuiz);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 43, 20, 69),
              Color.fromARGB(255, 96, 68, 129),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: activeScreen,
      )),
    );
  }
}
