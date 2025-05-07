import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers, required this.onRestart});
  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryItem = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryItem.add({
        'question_number': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summaryItem;
  }

  @override
  Widget build(BuildContext context) {
    int numTotalAnswers = questions.length;
    int numCorrectAnsers = getSummaryData().where(
      (element) {
        return element['user_answer'] == element['correct_answer'];
      },
    ).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'you have answered $numCorrectAnsers of $numTotalAnswers questions correctly!',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 235, 194, 242),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        QuestionsSummary(summaryData: getSummaryData()),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.refresh),
          label: const Text('Restart Quiz'),
        )
      ],
    );
  }
}
