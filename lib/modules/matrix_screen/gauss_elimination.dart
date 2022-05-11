import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matrix_input/matrix_input.dart';


class GaussElimination extends StatelessWidget {

  var r0c0 = TextEditingController(text: '0');
  var r0c1 = TextEditingController(text: '0');
  var r0c2 = TextEditingController(text: '0');
  var r0c3 = TextEditingController(text: '0');
  var r1c0 = TextEditingController(text: '0');
  var r1c1 = TextEditingController(text: '0');
  var r1c2 = TextEditingController(text: '0');
  var r1c3 = TextEditingController(text: '0');
  var r2c0 = TextEditingController(text: '0');
  var r2c1 = TextEditingController(text: '0');
  var r2c2 = TextEditingController(text: '0');
  var r2c3 = TextEditingController(text: '0');

  var matrixInfo =[];
  var result1 =[];
  var result2 =[];
  var result3 =[];
  // List<List<double>> result1 =[];
  // List<List<double>> result2 =[];
  // List<List<double>> result3 =[];



  double x1 = 0;
  double x2 = 0;
  double x3 = 0;

  GaussElimination({Key? key, required this.matrixInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateGE();
    return Scaffold(
      appBar: AppBar(title: const Text('Results'),),
    body: Column(
      children: [
        const Text('Step 1: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 10,),
        RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              children:<TextSpan>[
                TextSpan(text: '${result1[0].toString()}\n'),
                TextSpan(text: '${result1[1].toString()}\n'),
                TextSpan(text: '${result1[2].toString()}\n'),
              ]
            )
        ),
        const SizedBox(height: 20,),
        const Text('Step 2: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 10,),
        RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                children:<TextSpan>[
                  TextSpan(text: '${result2[0].toString()}\n'),
                  TextSpan(text: '${result2[1].toString()}\n'),
                  TextSpan(text: '${result2[2].toString()}\n'),
                ]
            )
        ),
        const SizedBox(height: 20,),
        const Text('Step 3: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 10,),
        RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                children:<TextSpan>[
                  TextSpan(text: '${result3[0].toString()}\n'),
                  TextSpan(text: '${result3[1].toString()}\n'),
                  TextSpan(text: '${result3[2].toString()}\n'),
                ]
            )
        ),
        const SizedBox(height: 20,),
      ],
    ),
    //   body: Column(
    //     children: [
    //     display(result1),
    //     const SizedBox(height: 10,),
    //     display(result2),
    //     const SizedBox(height: 10,),
    //     display(result3),
    // ],
    // ),
      // body: ListView.builder(itemBuilder: (context,index){
      //   return Column(
      //     children: [
      //       display(result1),
      //       const SizedBox(height: 10,),
      //       display(result2),
      //       const SizedBox(height: 10,),
      //       display(result3),
      //     ],
      //   );
      // },
      //   itemCount: 3,
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Text('${result1[0][0]}'),
      //           SizedBox(width: 5,),
      //           Text('${result1[0][1]}'),
      //           Text('${result1[0][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[0][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[1][0]}'),
      //           Text('${result1[1][1]}'),
      //           Text('${result1[1][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[1][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[2][0]}'),
      //           Text('${result1[2][1]}'),
      //           Text('${result1[2][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[2][3]}'),
      //         ],
      //       ),
      //       SizedBox(height: 20,),
      //       Text('Step 2'),
      //       Row(
      //         children: [
      //           Text('${result2[0][0]}'),
      //           Text('${result2[0][1]}'),
      //           Text('${result2[0][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result2[0][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[1][0]}'),
      //           Text('${result1[1][1]}'),
      //           Text('${result1[1][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[1][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[2][0]}'),
      //           Text('${result1[2][1]}'),
      //           Text('${result1[2][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[2][3]}'),
      //         ],
      //       ),
      //       SizedBox(height: 20,),
      //       Text('Step 3'),
      //       Row(
      //         children: [
      //           Text('${result3[0][0]}'),
      //           Text('${result3[0][1]}'),
      //           Text('${result3[0][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result3[0][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[1][0]}'),
      //           Text('${result1[1][1]}'),
      //           Text('${result1[1][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[1][3]}'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text('${result1[2][0]}'),
      //           Text('${result1[2][1]}'),
      //           Text('${result1[2][2]}'),
      //           const SizedBox(width: 10,),
      //           Text('${result1[2][3]}'),
      //         ],
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
      // body: ListView.separated(
      //     itemBuilder: (context,index){
      //       if(index == 0){
      //         fillMatrix(result1[index]);
      //       }else if(index == 1){
      //         fillMatrix(result2[index]);
      //       }
      //       else{
      //         fillMatrix(result3[index]);
      //       }
      //
      //       print(index);
      //       return display();
      //     },
      //     separatorBuilder: (context,index){
      //       return const SizedBox(height: 20,);
      //     },
      //     itemCount: 3
      // ),
    );
  }

  void calculateGE(){
    // result1[0] = List.unmodifiable(matrixInfo[0]);
    // result1[1] = List.unmodifiable(matrixInfo[1]);
    // result1[2] = List.unmodifiable(matrixInfo[2]);
    result1 = json.decode(json.encode(matrixInfo));
    // result1 = matrixInfo.toList();
    // result1 = deepCopy(matrixInfo);
    // result1 = List.unmodifiable(matrixInfo);
    print(result1.runtimeType);
    print('Results 1st = $result1 ');
    var m21 = matrixInfo[1][0] / matrixInfo[0][0];
    var m31 = matrixInfo[2][0] / matrixInfo[0][0];
    //rule E2-(m21)E1 = E2
    for (int j = 0; j < 4; j++)
    {
      var e2 = matrixInfo[1][j];
      var e1 = ((m21)*matrixInfo[0][j]);
      matrixInfo[1][j] = e2 - e1;
    }
    result2 = json.decode(json.encode(matrixInfo));
    print("result 2 = $result2");
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
    result3 = json.decode(json.encode(matrixInfo));
    print("result 3 = $result3");

    x3 = matrixInfo[2][3] / matrixInfo[2][2];
    x2 = (matrixInfo[1][3] - (matrixInfo[1][2] * x3)) / matrixInfo[1][1];
    x1 = (matrixInfo[0][3] - ((matrixInfo[0][1] * x2) + (matrixInfo[0][2] * x3))) / matrixInfo[0][0];

    print('X1 = $x1   , X2 = $x2  , X3 = $x3');
    print('result 1 #2 = $result1');
    print('result 2 #2 = $result2');
    print('result 3 #2 = $result3');
    print(result1[0].toString());


  }
  Widget display(var result){
    fillMatrix(result);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MatrixInput(
              matrixBorderColor: Colors.red,
              textAlign: TextAlign.center,
              enabled: true,
              readOnly: true,
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
              matrixController: r1c0, //Connect the controller to a matrixController
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
    );
  }
  void fillMatrix(var result){
    print('display');
    print(result);
    r0c0.text = result[0][0].toString();
    r0c1.text = result[0][1].toString();
    r0c2.text = result[0][2].toString();
    r0c3.text = result[0][3].toString();
    r1c0.text = result[1][0].toString();
    r1c1.text = result[1][1].toString();
    r1c2.text = result[1][2].toString();
    r1c3.text = result[1][3].toString();
    r2c0.text = result[2][0].toString();
    r2c1.text = result[2][1].toString();
    r2c2.text = result[2][2].toString();
    r2c3.text = result[2][3].toString();
    // r0c0.text = result[0].toString();
    // r0c1.text = result[1].toString();
    // r0c2.text = result[2].toString();
    // r0c3.text = result[3].toString();
    // r1c0.text = result[4].toString();
    // r1c1.text = result[5].toString();
    // r1c2.text = result[6].toString();
    // r1c3.text = result[7].toString();
    // r2c0.text = result[8].toString();
    // r2c1.text = result[8].toString();
    // r2c2.text = result[9].toString();
    // r2c3.text = result[10].toString();

  }
  // void copyMatrix(matrix1,matrix2) {
  //   matrix2 = List.unmodifiable(matrix1);
  //   // for (int i = 0; i < 3; i++) {
  //   //   for (int j = 0; j < 4; j++) {
  //   //     matrix2[i][j] = matrix1[i][j];
  //   //   }
  //   // }
  //   // for (int i = 0; i < 3; i++) {
  //   //   matrix2 = List.unmodifiable(matrix1);
  //   //   // for (int j = 0; j < 4; j++) {
  //   //   //   matrix2.add(double.parse(List.unmodifiable(matrix1[i][j])));
  //   //   // }
  //   // }
  // }

}
