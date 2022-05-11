import 'package:flutter/material.dart';
import 'package:matrix_input/matrix_input.dart';
import 'package:numerical_analysis_calculator/modules/matrix_screen/cramer.dart';
import 'package:numerical_analysis_calculator/modules/matrix_screen/gauss_elimination.dart';
import 'package:numerical_analysis_calculator/modules/matrix_screen/lu_decomposition.dart';
import 'package:numerical_analysis_calculator/shared/components/components.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:hexcolor/hexcolor.dart';

class MatrixHomeScreen extends StatefulWidget {
  const MatrixHomeScreen({Key? key}) : super(key: key);

  @override
  State<MatrixHomeScreen> createState() => _MatrixHomeScreenState();
}

class _MatrixHomeScreenState extends State<MatrixHomeScreen> {
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

  bool showMatrix = false;

  List<List<double>> matrixInfo = [];

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
      builder: (context){
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
                          navigateTo(context, LuDecomposition(matrixInfo: matrixInfo,));
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
                          navigateTo(context, Cramer(matrixInfo: matrixInfo));
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
      },
      fallback: (context){
        return Center(
          child: FloatingActionButton.extended(
            label: const Text('Show Matrix'), // <-- Text
            backgroundColor: HexColor("FF7E67"),
            icon: const Icon( // <-- Icon
              Icons.format_shapes_rounded,
              size: 24.0,
            ),
            onPressed: () {
              setState(() {
                showMatrix = true;
              });
            },
          ),
        );
      },
      condition: showMatrix,
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
}
