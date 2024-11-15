import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:numerical_analysis_calculator/modules/results_screen/newton_results.dart';

import '../../shared/components/components.dart';

class NewtonScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _equationController = MathFieldEditingController();
  final _x0Controller = TextEditingController();
  final _errorController = TextEditingController();

  NewtonScreen({Key? key}) : super(key: key);

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
        title: const Text('Newton Method'),
        backgroundColor: HexColor("3F72AF"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildEquationField(),
                  const SizedBox(height: 20),
                  _buildX0Field(),
                  const SizedBox(height: 20),
                  _buildErrorField()
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (!_equationController.isEmpty) {
              navigateTo(
                context,
                NewtonResults(
                  x0: double.parse(_x0Controller.text),
                  eps: double.parse(_errorController.text),
                  equationController: _equationController,
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
        const SizedBox(height: 20),
        MathField(
          controller: _equationController,
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
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _x0Controller,
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
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _errorController,
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
    );
  }
}
