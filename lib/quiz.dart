import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> chosenAnswers = [];
  Widget? currentScreen;
  String activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      chosenAnswers = [];
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    currentScreen = StartScreen(onStart: switchScreen);
    if (activeScreen == 'question_screen') {
      currentScreen = QuestionScreen(
        selectedAnswers: chooseAnswer,
      );
    }
    if (activeScreen == 'results_screen') {
      currentScreen = ResultsScreen(
        selectedAnswers: chosenAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 4, 122),
                Color.fromARGB(255, 138, 12, 163),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
