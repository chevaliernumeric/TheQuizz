import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/quizz_controller.dart';

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
    // TODO: implement initState
    super.initState();
    _randomeButton = [_buildTrue(), _buildFalse()];
  }

  void resetQuizz() {
    Alert(
      context: context,
      title: "Fin du Quizz",
      content: const Text("Le quizz est terminé, voulez-vous le relancer ?"),
      buttons: <DialogButton>[
        DialogButton(
          child: const Text('Non'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        DialogButton(
          child: const Text('Oui'),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              _controller.shuffleQuestion();
              _score.clear();
              _counter = 0;
            });
          },
        ),
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
            _buildQuestion(),
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

  Widget _close() {
    return const Icon(
      Icons.close,
      color: Colors.red,
      size: 30,
    );
  }

  Widget _check() {
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 30,
    );
  }

  Widget _buildQuestion() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          _controller.getQuestion(_counter),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTrue() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          if (_controller.getAnswer(_counter) == true) {
            _score.add(_check());
          } else {
            _score.add(_close());
          }
          increment();
        },
        child: const Text(
          "Vrai",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildFalse() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          if (_controller.getAnswer(_counter) == true) {
            _score.add(_close());
          } else {
            _score.add(_check());
          }
          increment();
        },
        child: const Text(
          "Faux",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
