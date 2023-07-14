import 'package:flutter/material.dart';
import 'package:quiz_appp/answer_button.dart';
import 'package:quiz_appp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectedAnswer, {super.key});
  final void Function(String) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIdx = 0;

  void nextQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIdx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIdx];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Color.fromARGB(255, 240, 220, 255),
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.shuffledList.map(
            (answer) {
              return AnswerButton(
                  onTap: () {
                    nextQuestion(answer);
                  },
                  answer: answer);
            },
          )
        ],
      ),
    );
  }
}
