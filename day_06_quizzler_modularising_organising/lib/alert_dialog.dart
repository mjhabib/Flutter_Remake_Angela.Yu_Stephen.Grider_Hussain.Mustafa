// Source - https://stackoverflow.com/a/53844053
// Posted by Suragch, modified by community. See post 'Timeline' for change history
// Retrieved 2026-06-11, License - CC BY-SA 4.0
import 'package:flutter/material.dart';

class DialogHelper {
  int numOfCorrectAnswers;
  int numOfQuestions;

  DialogHelper(this.numOfCorrectAnswers, this.numOfQuestions);

  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Congratulations, questions finished."),
      content: Text(
        "You managed to answer $numOfCorrectAnswers correct questions out of $numOfQuestions.",
      ),
      actions: [okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
