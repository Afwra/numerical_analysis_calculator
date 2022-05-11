import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';


class GoldenSectionSearchScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var equationController = MathFieldEditingController();
  var xlController = TextEditingController();
  var xuController = TextEditingController();
  var iterController = TextEditingController();
  bool min = true;


  GoldenSectionSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Golden Section Search'),backgroundColor: HexColor("3F72AF")),
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
                    "XL: ",
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "XU:",
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Iter:",
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
                    controller: iterController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Iter',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Iter";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: const ['Min', 'Max'],
                    onToggle: (index) {
                      index == 0? min = true : min = false;
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
            // navigateTo(
            //     context,
            //     ResultsScreen(
            //         xl: double.parse(xlController.text),
            //         xu: double.parse(xuController.text),
            //         eps: double.parse(errorController.text),
            //         equationController: equationController));
          }
        },
        backgroundColor: HexColor("3F72AF"),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
