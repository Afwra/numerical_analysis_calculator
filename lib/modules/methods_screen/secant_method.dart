import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:numerical_analysis_calculator/modules/results_screen/secant_results_screen.dart';

class SecantScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _equationController = MathFieldEditingController();
  final _xiMinus1Controller = TextEditingController();
  final _xiController = TextEditingController();
  final _errorController = TextEditingController();

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
        title: const Text('Secant Method'),
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
                  _buildXiMinusOneField(),
                  _buildXiField(),
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
          if (_formKey.currentState!.validate()) {
            if (!_equationController.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecantResultsScreen(
                    eps: double.parse(_errorController.text),
                    xi: double.parse(_xiController.text),
                    xiMinus1: double.parse(_xiMinus1Controller.text),
                    equationController: _equationController,
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
        const SizedBox(
          height: 20,
        ),
        MathField(
          controller: _equationController,
          keyboardType: MathKeyboardType.expression,
          variables: const ['x', 'y', 'z'],
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

  Widget _buildXiMinusOneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Xi-1: ",
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
          controller: _xiMinus1Controller,
          decoration: const InputDecoration(
            labelText: 'Enter XiMinus1',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter XiMinus1";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildXiField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "XI: ",
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
          controller: _xiController,
          decoration: const InputDecoration(
            labelText: 'Enter Xi',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Xi";
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
          "Error Rate: ",
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
        ),
      ],
    );
  }
}
