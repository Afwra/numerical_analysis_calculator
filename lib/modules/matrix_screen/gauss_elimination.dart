import 'dart:convert';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GaussElimination extends StatelessWidget {
  var matrixInfo = [];
  var result1 = [];
  var result2 = [];
  var result3 = [];
  var m21;
  var m31;
  var m32;

  double x1 = 0;
  double x2 = 0;
  double x3 = 0;

  GaussElimination({Key? key, required this.matrixInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateGE();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Gauss Elimination Results'),
          backgroundColor: HexColor("3F72AF")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 1',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                children: <TextSpan>[
                              TextSpan(text: '${result1[0].toString()}\n'),
                              TextSpan(text: '${result1[1].toString()}\n'),
                              TextSpan(text: '${result1[2].toString()}\n'),
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'm21 = ${m21.toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'm31 = ${m31.toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 2',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                children: <TextSpan>[
                              TextSpan(text: '${result2[0].toString()}\n'),
                              TextSpan(text: '${result2[1].toString()}\n'),
                              TextSpan(text: '${result2[2].toString()}\n'),
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'm32 = ${m32.toString()}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 3',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                children: <TextSpan>[
                              TextSpan(text: '${result3[0].toString()}\n'),
                              TextSpan(text: '${result3[1].toString()}\n'),
                              TextSpan(text: '${result3[2].toString()}\n'),
                            ])),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'X1 = $x1',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'X2 = $x2',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'X3 = $x3',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  void calculateGE() {
    result1 = json.decode(json.encode(matrixInfo));
    // result1 = matrixInfo.toList();
    // result1 = deepCopy(matrixInfo);
    // result1 = List.unmodifiable(matrixInfo);
    m21 = matrixInfo[1][0] / matrixInfo[0][0];
    m31 = matrixInfo[2][0] / matrixInfo[0][0];
    //rule E2-(m21)E1 = E2
    for (int j = 0; j < 4; j++) {
      var e2 = matrixInfo[1][j];
      var e1 = ((m21) * matrixInfo[0][j]);
      matrixInfo[1][j] = e2 - e1;
    }
    for (int j = 0; j < 4; j++) {
      var e3 = matrixInfo[2][j];
      var e1 = ((m31) * matrixInfo[0][j]);
      matrixInfo[2][j] = e3 - e1;
    }
    result2 = json.decode(json.encode(matrixInfo));
    m32 = matrixInfo[2][1] / matrixInfo[1][1];
    //rule E3-(m32)E2 = E3
    for (int j = 0; j < 4; j++) {
      var e3 = matrixInfo[2][j];
      var e1 = ((m32) * matrixInfo[1][j]);
      matrixInfo[2][j] = e3 - e1;
    }
    result3 = json.decode(json.encode(matrixInfo));
    x3 = matrixInfo[2][3] / matrixInfo[2][2];
    x2 = (matrixInfo[1][3] - (matrixInfo[1][2] * x3)) / matrixInfo[1][1];
    x1 = (matrixInfo[0][3] -
            ((matrixInfo[0][1] * x2) + (matrixInfo[0][2] * x3))) /
        matrixInfo[0][0];
    fixOutput();
  }

  double precise(double n) {
    return double.parse(n.toStringAsFixed(2));
  }

  void fixOutput() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 4; j++) {
        result1[i][j] = precise(result1[i][j]);
        result2[i][j] = precise(result2[i][j]);
        result3[i][j] = precise(result3[i][j]);
      }
    }
    m21 = precise(m21);
    m31 = precise(m31);
    m32 = precise(m32);

    x1 = precise(x1);
    x2 = precise(x2);
    x3 = precise(x3);
  }
}
