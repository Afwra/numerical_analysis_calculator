import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';

import '../../shared/components/components.dart';
import '../results_screen/false_position_results.dart';

class FalsePositionScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final equationController = MathFieldEditingController();
  final xlController = TextEditingController();
  final xuController = TextEditingController();
  final errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text('False Position Method'),
        backgroundColor: HexColor("3F72AF"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Equation: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "XL: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: xlController,
                    decoration: const InputDecoration(
                      labelText: 'Enter XL',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter X Lower";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "XU: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: xuController,
                    decoration: const InputDecoration(
                      labelText: 'Enter XU',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter X Upper";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Error Rate: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  ),
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
            if (!equationController.isEmpty) {
              navigateTo(
                context,
                FalsePositionResultsScreen(
                  xl: double.parse(xlController.text),
                  xu: double.parse(xuController.text),
                  eps: double.parse(errorController.text),
                  equationController: equationController,
                ),
              );
            }
          }
        },
        backgroundColor: HexColor("3F72AF"),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
