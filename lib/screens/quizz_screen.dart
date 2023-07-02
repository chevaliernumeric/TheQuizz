import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/quizz_controller.dart';
import '../ressources/quizz_builder.dart';

final _controller = QuizzController();

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  State<QuizzScreen> createState() => _QuizzScreen();
}

class _QuizzScreen extends State<QuizzScreen> {
  final List<Widget> _score = [];
  List<Widget> _randomeButton = [];
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _randomeButton = [
      QuizzBuilder.buildButtons(
        "Vrai",
        () {
          setState(() {
            if (_controller.getAnswer(_counter) == true) {
              _score.add(QuizzBuilder.check());
            } else {
              _score.add(QuizzBuilder.close());
            }
          });
          increment();
        },
        Colors.green,
      ),
      QuizzBuilder.buildButtons("Faux", () {
        setState(() {
          if (_controller.getAnswer(_counter) == true) {
            _score.add(QuizzBuilder.close());
          } else {
            _score.add(QuizzBuilder.check());
          }
        });
        increment();
      }, Colors.red),
    ];
  }

  void resetQuizz() {
    Alert(
      context: context,
      title: "Fin du Quizz",
      content: const Text("Le quizz est terminé, voulez-vous le relancer ?"),
      buttons: <DialogButton>[
        QuizzBuilder.buttonDial(
            name: "Non",
            onTap: () {
              Navigator.pop(context);
            }),
        QuizzBuilder.buttonDial(
            name: "Oui",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _controller.shuffleQuestion();
                _score.clear();
                _counter = 0;
              });
            })
      ],
    ).show();
  }

  void increment() {
    if (_counter >= _controller.getLength() - 1) {
      resetQuizz();
    } else {
      setState(() {
        _counter++;
        _randomeButton.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildScore(),
            QuizzBuilder.buildQuestion(_controller.getQuestion(_counter)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _randomeButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _score,
    );
  }
}
