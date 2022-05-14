
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class GaussJordan extends StatelessWidget {

  var matrixInfo = [];
  GaussJordan({Key? key, required this.matrixInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateGaussJordan();
    return Scaffold(
      appBar: AppBar(title: const Text('Gauss Jordan Results'),backgroundColor: HexColor("3F72AF")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Final Answer',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                children:<TextSpan>[
                                  TextSpan(text: '${matrixInfo[0].toString()}\n'),
                                  TextSpan(text: '${matrixInfo[1].toString()}\n'),
                                  TextSpan(text: '${matrixInfo[2].toString()}\n'),
                                ]
                            )
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('X1 = ${matrixInfo[0][3].toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text('X2 = ${matrixInfo[1][3].toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text('X3 = ${matrixInfo[2][3].toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  void calculateGaussJordan(){
    double t;
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++){
        if (i != j){
          t = matrixInfo[j][i] / matrixInfo[i][i];
          for (int k = 0; k < 4; k++){
            matrixInfo[j][k] = matrixInfo[j][k] - (matrixInfo[i][k] * t);
          }


        }
      }
    }


    for (int f = 0; f < 3; f++){
      matrixInfo[f][3] = matrixInfo[f][3] / matrixInfo[f][f];
      matrixInfo[f][f] = 1.0;

    }
    print(matrixInfo);


  }
//   print(matrixInfo); // main matrix
//
//   var firstElement = matrixInfo[0][0];
//   for(int i = 0;i<4;i++){
//     matrixInfo[0][i] *= (1/firstElement);
//   }
//   print(matrixInfo); // first step
//
//
//   var secondElement = matrixInfo[1][0];
//   var thirdElement = matrixInfo[2][0];
//   for(int i = 0;i<4;i++){
//     // if(i == 0){
//     //   if(matrixInfo[1][0] > 0){
//     //     matrixInfo[1][i] = secondElement * matrixInfo[0][i] - matrixInfo[1][i];
//     //   } else{
//     //     matrixInfo[1][i] = secondElement * matrixInfo[0][i] + matrixInfo[1][i];
//     //   }
//     //   if(matrixInfo[2][0] > 0){
//     //     matrixInfo[2][i] = thirdElement * matrixInfo[0][i] - matrixInfo[2][i];
//     //   } else{
//     //     matrixInfo[2][i] = thirdElement * matrixInfo[0][i] + matrixInfo[2][i];
//     //   }
//     // }else{
//     //   matrixInfo[1][i] = secondElement * matrixInfo[0][i] - matrixInfo[1][i];
//     //   matrixInfo[2][i] = thirdElement * matrixInfo[0][i] - matrixInfo[2][i];
//     // }
//     matrixInfo[1][i] = secondElement * matrixInfo[0][i] - (matrixInfo[1][i]).abs();
//     matrixInfo[2][i] = thirdElement * matrixInfo[0][i] - (matrixInfo[2][i]).abs();
//
//   }
//   print(matrixInfo); // second step
//
//   var secondColumnElement = pow(matrixInfo[1][1],-1);
//   for(int i = 0;i<4;i++){
//     matrixInfo[1][i] *= secondColumnElement;
//   }
//   print(matrixInfo); // third step
//
//
//   var secondColumnFirstElement = matrixInfo[0][1];
//   var secondColumnThirdElement = matrixInfo[2][1];
//   for(int i = 0;i<4;i++){
//     matrixInfo[0][i] = - 1 * secondColumnFirstElement * matrixInfo[1][i] + (matrixInfo[0][i]);
//     matrixInfo[2][i] = - 1 * secondColumnThirdElement * matrixInfo[1][i] + (matrixInfo[2][i]);
//   }
//   print(matrixInfo); //forth step
//
//   var thirdColumnElement = pow(matrixInfo[2][2],-1);
//   for(int i = 0;i<4;i++){
//     matrixInfo[2][i] *= thirdColumnElement;
//   }
//   print(matrixInfo);// fifth step
//
//
//   var thirdColumnFirstElement = matrixInfo[0][2];
//   var thirdColumnSecondElement = matrixInfo[1][2];
//   for(int i = 0;i<4;i++){
//     matrixInfo[0][i] = - 1 * thirdColumnFirstElement * matrixInfo[2][i] + (matrixInfo[0][i]);
//     matrixInfo[1][i] = - 1 * thirdColumnSecondElement * matrixInfo[2][i] + (matrixInfo[1][i]);
//   }
//   print(matrixInfo);

}
