import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectedAnswers});
  final void Function(String answer) selectedAnswers;
  
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
        widget.selectedAnswers(answer);
        currentIndex++;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 229, 188, 241),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...currentQuestion.shuffledList.map((answer) {
            return AnswerButton(
              onTap: () {
                answerQuestion(answer);
              },
              text: answer,
            );
          }),
        ],
      ),
    );
  }
}
