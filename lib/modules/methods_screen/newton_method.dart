import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:numerical_analysis_calculator/modules/results_screen/newton_results.dart';

import '../../shared/components/components.dart';

class NewtonScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var equationController = MathFieldEditingController();
  var x0Controller = TextEditingController();
  var errorController = TextEditingController();

  NewtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newton Method'),
        backgroundColor: HexColor("3F72AF"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Equation: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MathField(
                    controller: equationController,
                    keyboardType: MathKeyboardType.expression,
                    variables: const ['x'],
                    decoration: const InputDecoration(
                      labelText: 'Enter Equation',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    onSubmitted: (String value) {},
                    autofocus: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "X0: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: x0Controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter X0',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter X0";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Error Rate:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: errorController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Error',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Error";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if(!equationController.isEmpty){
              navigateTo(context, NewtonResults(x0: double.parse(x0Controller.text), eps: double.parse(errorController.text), equationController: equationController));
            }
          }
        },
        backgroundColor: HexColor("3F72AF"),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
