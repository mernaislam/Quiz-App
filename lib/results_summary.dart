import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                (data) {
                  Color currentColor;
                  data['user-answer'] == data['correct-answer']
                      ? currentColor = const Color.fromARGB(255, 180, 221, 254)
                      : currentColor = const Color.fromARGB(255, 222, 180, 254);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          backgroundColor: currentColor,
                          radius: 15,
                          child: Text(
                            data['index'].toString(),
                            style: const TextStyle(color: Colors.black,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'].toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 240, 220, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              data['user-answer'].toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 222, 180, 254),
                              ),
                            ),
                            Text(
                              data['correct-answer'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 180, 221, 254)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ).toList(),
            ),
      ),
    );
  }
}

