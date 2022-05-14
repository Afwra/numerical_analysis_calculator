import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';

class GradiantMethodResultScreen extends StatelessWidget {
  double x;
  double y;
  MathFieldEditingController equationController;
  double xDash = 0;
  double yDash = 0;
  double xDoubleDash = 0;
  double yDoubleDash = 0;
  double cita = 0;
  double xAccordingToY = 0;
  double yAccordingToX = 0;
  List<List<double>> H = [
    [0.0,0.0],
    [0.0,0.0]
  ];
  double detH = 0;
  bool min = false;
  bool suddlePoint = false;


  GradiantMethodResultScreen({Key? key, required this.x,required this.y,required this.equationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateGradiant();
    return Scaffold(
      appBar: AppBar(title: const Text('Results'),backgroundColor: HexColor("3F72AF")),
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
                  height: 250,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('X` = ${xDash.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 5,),
                        Text('Y` = ${yDash.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 5,),
                        Text('F = ${xDash.toString()}i ${yDash > 0? '+' : '- ${(yDash*-1).toString()}'}j',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 5,),
                        Text('θ` = Tan^-1(${yDash.toString()}/${xDash.toString()}) = ${cita.toStringAsFixed(3)}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        // RichText(
                        //     text: TextSpan(
                        //         style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                        //         children:<TextSpan>[
                        //           TextSpan(text: 'X` = ${xDash.toString()}\n'),
                        //           TextSpan(text: 'Y` ${yDash.toString()}\n'),
                        //           TextSpan(text: 'F = ${xDash.toString()}i ${yDash > 0? '+' : '-'}${yDash.toString()}j\n'),
                        //         ]
                        //     )
                        // ),
                        const SizedBox(height: 5,),
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
              const SizedBox(height: 20,),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 2',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('X`` = ${xDoubleDash.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(width: 5,),
                            Text('Y`` = ${yDoubleDash.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('(d/dx)(y`) = ${xAccordingToY.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(width: 5,),
                            Text('(d/dy)(x`) = ${yAccordingToX.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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
              const SizedBox(height: 20,),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 3',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text('H = ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
                                    children:<TextSpan>[
                                      TextSpan(text: '${H[0].toString()}\n'),
                                      TextSpan(text: '${H[1].toString()}\n'),
                                    ]
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Det(H) = ${detH.toString()}',
                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 5,),
                        Text(
                        min? 'Local Minimum' : 'Local Maximum',
                        style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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

  void calculateGradiant(){
    var mathExpression = TeXParser(equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();

    var derivedAccordingToX = mathExpression.derive('x');
    var simplifiedDerivedAccordingToX = derivedAccordingToX.simplify();

    var derivedAccordingToY = mathExpression.derive('y');
    var simplifiedDerivedAccordingToY = derivedAccordingToY.simplify();


    cm.bindVariableName('x', Number(x));
    cm.bindVariableName('y', Number(y));
    xDash = simplifiedDerivedAccordingToX.evaluate(EvaluationType.REAL, cm);

    cm.bindVariableName('x', Number(x));
    cm.bindVariableName('y', Number(y));
    yDash = simplifiedDerivedAccordingToY.evaluate(EvaluationType.REAL, cm);
    print('x/ = $xDash');
    print('y/ = $yDash');
    cita = atan(yDash/xDash) * (180.0 / pi);
    print(cita);


    var secondDerivedAccordingToX = derivedAccordingToX.derive('x');
    var simplifiedSecondDerivedAccordingToX = secondDerivedAccordingToX.simplify();

    var secondDerivedAccordingToY = derivedAccordingToY.derive('y');
    var simplifiedSecondDerivedAccordingToY = secondDerivedAccordingToY.simplify();

    cm.bindVariableName('x', Number(1));
    xDoubleDash = simplifiedSecondDerivedAccordingToX.evaluate(EvaluationType.REAL, cm);

    cm.bindVariableName('y', Number(1));
    yDoubleDash = simplifiedSecondDerivedAccordingToY.evaluate(EvaluationType.REAL, cm);

    print('x// = $xDoubleDash');
    print('y// = $yDoubleDash');

    var deriveXAsFunctionOfY = derivedAccordingToY.derive('x');
    var simplifiedDeriveXAsFunctionOfY = deriveXAsFunctionOfY.simplify();

    cm.bindVariableName('x', Number(1));
    xAccordingToY = simplifiedDeriveXAsFunctionOfY.evaluate(EvaluationType.REAL, cm);
    print(xAccordingToY);

    var deriveYAsFunctionOfX = derivedAccordingToX.derive('y');
    var simplifiedDeriveYAsFunctionOfX = deriveYAsFunctionOfX.simplify();

    cm.bindVariableName('y', Number(1));
    yAccordingToX = simplifiedDeriveYAsFunctionOfX.evaluate(EvaluationType.REAL, cm);
    print(yAccordingToX);

    H[0][0] = xDoubleDash;
    H[0][1] = xAccordingToY;
    H[1][0] = yAccordingToX;
    H[1][1] = yDoubleDash;

    print(H);

    detH = (H[0][0] * H[1][1]) - (H[0][1] * H[1][0]);

    if(detH > 0 && xDoubleDash > 0){
      min = true;
    } else if(detH > 0 && xDoubleDash < 0){
      min = false;
    }
    else{
      suddlePoint = true;
    }


  }
}
