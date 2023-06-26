import 'package:flutter/material.dart';

import './screens/quizz_screen.dart';

void main() => runApp(const TheQuizz());

class TheQuizz extends StatelessWidget {
  const TheQuizz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "The Quizz",
      debugShowCheckedModeBanner: false,
      home: QuizzScreen(),
    );
  }
}
