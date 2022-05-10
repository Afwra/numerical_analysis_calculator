import 'package:flutter/material.dart';
import 'package:matrix_input/matrix_input.dart';
import 'package:numerical_analysis_calculator/modules/matrix_screen/gauss_elimination.dart';
import 'package:numerical_analysis_calculator/shared/components/components.dart';

class MatrixHomeScreen extends StatelessWidget {
  MatrixHomeScreen({Key? key}) : super(key: key);

  final r0c0 = TextEditingController(text: '0');
  final r0c1 = TextEditingController(text: '0');
  final r0c2 = TextEditingController(text: '0');
  final r0c3 = TextEditingController(text: '0');
  final r1c0 = TextEditingController(text: '0');
  final r1c1 = TextEditingController(text: '0');
  final r1c2 = TextEditingController(text: '0');
  final r1c3 = TextEditingController(text: '0');
  final r2c0 = TextEditingController(text: '0');
  final r2c1 = TextEditingController(text: '0');
  final r2c2 = TextEditingController(text: '0');
  final r2c3 = TextEditingController(text: '0');

  bool gauss = false;
  bool lu = false;
  bool cramer = false;

  List<bool> selected = [false,false,false];
  List<List<double>> matrixInfo = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Enter Matrix Data: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MatrixInput(
                      matrixBorderColor: Colors.red,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r0c0, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.green,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r0c1, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r0c2, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.blue,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r0c3, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MatrixInput(
                      matrixBorderColor: Colors.red,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r1c0, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.green,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r1c1, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r1c2, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.blue,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r1c3, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MatrixInput(
                      matrixBorderColor: Colors.red,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r2c0, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.green,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r2c1, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    MatrixInput(
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r2c2, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    MatrixInput(
                      matrixBorderColor: Colors.blue,
                      textAlign: TextAlign.center,
                      enabled: true,
                      readOnly: false,
                      width: 60,
                      matrixController:
                      r2c3, //Connect the controller to a matrixController
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40,),
            const Text(
              'Choose Method: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Gauss Elimination',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                    ),
                    onTap: (){
                      fillMatrix();
                      navigateTo(context, GaussElimination(matrixInfo: matrixInfo,));
                    },
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'LU Decomposition',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                    ),
                    onTap: (){
                      fillMatrix();
                      print(matrixInfo);
                    },
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Cramer's Rule",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                    ),
                    onTap: (){
                      fillMatrix();
                      print(matrixInfo);
                    },
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: ListView.separated(
            //       itemBuilder: (context, index) => matrixList(index,context,r0c0,r0c1,r0c2,r0c3,r1c0,r1c1,r1c2,r1c3,r2c0,r2c1,r2c2,r2c3),
            //       separatorBuilder: (context,index) =>const SizedBox(height: 5,),
            //       itemCount: matrixScreens.length
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void fillMatrix(){
    matrixInfo = matrixInfo =
    [
      [double.parse(r0c0.text),double.parse(r0c1.text),double.parse(r0c2.text),double.parse(r0c3.text)],
      [double.parse(r1c0.text),double.parse(r1c1.text),double.parse(r1c2.text),double.parse(r1c3.text)],
      [double.parse(r2c0.text),double.parse(r2c1.text),double.parse(r2c2.text),double.parse(r2c3.text)],
    ];
  }

  void calculateGE(){
    var m21 = matrixInfo[1][0] / matrixInfo[0][0];
    var m31 = matrixInfo[2][0] / matrixInfo[0][0];
    //rule E2-(m21)E1 = E2
    for (int j = 0; j < 4; j++)
    {
      var e2 = matrixInfo[1][j];
      var e1 = ((m21)*matrixInfo[0][j]);
      matrixInfo[1][j] = e2 - e1;
    }
    for (int j = 0; j < 4; j++)
    {
      var e3 = matrixInfo[2][j];
      var e1 = ((m31)*matrixInfo[0][j]);
      matrixInfo[2][j] = e3 - e1;
    }
    var m32 = matrixInfo[2][1] / matrixInfo[1][1];
//rule E3-(m32)E2 = E3
    for (int j = 0; j < 4; j++)
    {
      var e3 = matrixInfo[2][j];
      var e1 = ((m32)*matrixInfo[1][j]);
      matrixInfo[2][j] = e3 - e1;
    }

    var x3 = matrixInfo[2][3] / matrixInfo[2][2];
    var x2 = (matrixInfo[1][3] - (matrixInfo[1][2] * x3)) / matrixInfo[1][1];
    var x1 = (matrixInfo[0][3] - ((matrixInfo[0][1] * x2) + (matrixInfo[0][2] * x3))) / matrixInfo[0][0];

    print('X1 = $x1   , X2 = $x2  , X3 = $x3');


  }
}
