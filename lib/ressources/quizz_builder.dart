import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzBuilder {
  static Widget close() {
    return const Icon(
      Icons.close,
      color: Colors.red,
      size: 30,
    );
  }

  static Widget check() {
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 30,
    );
  }

  static Widget buildQuestion(String questionText) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          questionText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget buildButtons(
      String name, void Function() onTap, MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onTap,
        child: Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  static DialogButton buttonDial(
      {required String name, required void Function() onTap}) {
    return DialogButton(
      onPressed: onTap,
      child: Text(name),
    );
  }
}
