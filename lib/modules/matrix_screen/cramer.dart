import 'dart:convert';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Cramer extends StatelessWidget {
  List<dynamic> matrixInfo;
  List<dynamic> copyMatrixInfo = [];
  double detA = 0;
  List<double> detAList = [0, 0, 0];
  double r0 = 0, r1 = 0, r2 = 0;

  List<dynamic> result1 = [];
  List<dynamic> result2 = [];
  List<dynamic> result3 = [];

  Cramer({Key? key, required this.matrixInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateCramer();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cramer Results'),
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
                              TextSpan(text: '${matrixInfo[0].toString()}\n'),
                              TextSpan(text: '${matrixInfo[1].toString()}\n'),
                              TextSpan(text: '${matrixInfo[2].toString()}\n'),
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'D = $detA',
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
                              TextSpan(text: '${result1[0].toString()}\n'),
                              TextSpan(text: '${result1[1].toString()}\n'),
                              TextSpan(text: '${result1[2].toString()}\n'),
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'D1 = ${detAList[0].toString()}',
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
                              TextSpan(text: '${result2[0].toString()}\n'),
                              TextSpan(text: '${result2[1].toString()}\n'),
                              TextSpan(text: '${result2[2].toString()}\n'),
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'D2 = ${detAList[1].toString()}',
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
                title: 'Step 4',
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
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'D3 = ${detAList[2].toString()}',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'X1 = ${detAList[0]} / $detA = ${detAList[0] / detA},\n',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'X2 = ${detAList[1]} / $detA = ${detAList[1] / detA},\n',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'X3 = ${detAList[2]} / $detA = ${detAList[2] / detA},\n',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  void calculateCramer() {
    copyMatrixInfo = json.decode(json.encode(matrixInfo));
    r0 = matrixInfo[0][0] *
        ((matrixInfo[1][1] * matrixInfo[2][2]) -
            (matrixInfo[1][2] * matrixInfo[2][1]));
    r1 = matrixInfo[0][1] *
        ((matrixInfo[1][0] * matrixInfo[2][2]) -
            (matrixInfo[1][2] * matrixInfo[2][0]));
    r2 = matrixInfo[0][2] *
        ((matrixInfo[1][0] * matrixInfo[2][1]) -
            (matrixInfo[1][1] * matrixInfo[2][0]));
    detA = r0 + (-r1) + r2;
    for (int i = 0; i < 3; i++) {
      matrixInfo[0][i] = matrixInfo[0][3];
      matrixInfo[1][i] = matrixInfo[1][3];
      matrixInfo[2][i] = matrixInfo[2][3];
      r0 = matrixInfo[0][0] *
          ((matrixInfo[1][1] * matrixInfo[2][2]) -
              (matrixInfo[1][2] * matrixInfo[2][1]));
      r1 = matrixInfo[0][1] *
          ((matrixInfo[1][0] * matrixInfo[2][2]) -
              (matrixInfo[1][2] * matrixInfo[2][0]));
      r2 = matrixInfo[0][2] *
          ((matrixInfo[1][0] * matrixInfo[2][1]) -
              (matrixInfo[1][1] * matrixInfo[2][0]));
      detAList[i] = r0 + (-r1) + r2;
      if (i == 0) {
        result1 = json.decode(json.encode(matrixInfo));
      } else if (i == 1) {
        result2 = json.decode(json.encode(matrixInfo));
      } else {
        result3 = json.decode(json.encode(matrixInfo));
      }
      matrixInfo = json.decode(json.encode(copyMatrixInfo));
      print("A[${i + 1}] = ${detAList[i]}\n");
    }
    // for (int i = 0; i < 3; i++)
    // {
    //   print("x${i+1} = ${detAList[i]} / ${detA} = ${detAList[i]/detA}\n");
    // }
  }
  // double precise(double n){
  //   return double.parse(n.toStringAsFixed(2));
  // }
  // void fixOutput(){
  //   for(int i =0; i< 3;i++){
  //     for(int j =0; j< 4;j++){
  //
  //       result1[i][j] = precise(result1[i][j]);
  //       result2[i][j] = precise(result2[i][j]);
  //       result3[i][j] = precise(result3[i][j]);
  //
  //     }
  //   }
  //   detA = precise(detA);
  //   m31 = precise(m31);
  //   m32 = precise(m32);
  //
  //   x1 = precise(x1);
  //   x2 = precise(x2);
  //   x3 = precise(x3);
  // }
}
