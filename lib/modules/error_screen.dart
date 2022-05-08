import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Error the equation can't be solved",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,

          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15,),
        Text(
          "Check Inputs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
