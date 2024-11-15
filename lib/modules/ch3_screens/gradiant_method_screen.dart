import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/shared/components/components.dart';
import 'package:numerical_analysis_calculator/modules/ch3_screens/gradiant_method_result_screen.dart';

class GradientMethodScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var equationController = MathFieldEditingController();
  var xController = TextEditingController();
  var yController = TextEditingController();

  GradientMethodScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Gradiant Method'),
          backgroundColor: HexColor("3F72AF")),
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
                    variables: const ['x', 'y'],
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
                    "X: ",
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
                    controller: xController,
                    decoration: const InputDecoration(
                      labelText: 'Enter X',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter X";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Y:",
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
                    controller: yController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Y',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Y Upper";
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
                  GradiantMethodResultScreen(
                    equationController: equationController,
                    x: double.parse(xController.text),
                    y: double.parse(yController.text),
                  ));
            }
          }
        },
        backgroundColor: HexColor("3F72AF"),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
