import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';

import '../results_screen/fixed_point_results.dart';

class FixedPointScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final equationController = MathFieldEditingController();
  final x0Controller = TextEditingController();
  final errorController = TextEditingController();

  FixedPointScreen({Key? key}) : super(key: key);

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
        title: const Text('Simple Fixed Point Method'),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildEquationField(),
                  const SizedBox(height: 20),
                  _buildX0Field(),
                  const SizedBox(height: 20),
                  _buildErrorField(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FixedPointResults(
                    eps: double.parse(errorController.text),
                    x0: double.parse(x0Controller.text),
                    equationController: equationController,
                  ),
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

  Widget _buildEquationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter Equation: ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
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
      ],
    );
  }

  Widget _buildX0Field() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "X0: ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
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
      ],
    );
  }

  Widget _buildErrorField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Error Rate:",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
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
    );
  }
}
