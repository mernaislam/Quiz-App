import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn flutter the fun way!",
            style: TextStyle(
                color: Color.fromARGB(255, 240, 220, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.namePrefix),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: changeScreen,
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Color.fromARGB(255, 240, 220, 255)),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 240, 220, 255),
            ),
          )
        ],
      ),
    );
  }
}
