import 'package:flutter/material.dart';
import 'package:quiz_appp/data/questions.dart';
import 'package:quiz_appp/results_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.restartQuiz, {super.key});
  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add(
        {
          'index': i + 1,
          'question': questions[i].question,
          'user-answer': selectedAnswers[i],
          'correct-answer': questions[i].answers[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var totalNumQuestions = questions.length;
    var correctQuestions = summaryData
        .where((data) => data['user-answer'] == data['correct-answer'])
        .length;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You answered $correctQuestions out of $totalNumQuestions questions correctly!",
            style: const TextStyle(
                color: Color.fromARGB(255, 240, 220, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          ResultSummary(summaryData),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.refresh),
            label: const Text(
              "Restart Quiz!",
            ),
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 240, 220, 255),
            ),
          )
        ],
      ),
    );
  }
}
