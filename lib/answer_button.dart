import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onTap, required this.answer});
  final void Function() onTap;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 24, 4, 52),
            foregroundColor: const Color.fromARGB(255, 240, 220, 255),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(answer, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
