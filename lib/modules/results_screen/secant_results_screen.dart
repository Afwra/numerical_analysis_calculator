import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/models/secant_result_model.dart';
import '../../shared/components/components.dart';


class SecantResultsScreen extends StatelessWidget {
  double eps;
  double xi;
  double xiMinus1;
  MathFieldEditingController equationController;
  int iter = 0;
  double error = 0;

  List<SecantResultModel> results =[];
  SecantResultsScreen({Key? key, required this.eps,required this.xi,required this.xiMinus1,required this.equationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateSecant();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Mehtod Results'),
        backgroundColor: HexColor("21325E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context,index){return SingleChildScrollView(child: secantItemBuilder(results[index]),);},
          separatorBuilder: (context,index)=>const SizedBox(height: 15,),
          itemCount: results.length,
        ),
      ),
      backgroundColor: HexColor("3E497A"),
    );
  }


  double calculateSecant(){
    var mathExpression = TeXParser(equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();

    cm.bindVariableName('x', Number(xiMinus1));
    mathExpression.evaluate(EvaluationType.REAL,cm);
    double funXiMinus1 = mathExpression.evaluate(EvaluationType.REAL, cm);

    cm.bindVariableName('x', Number(xi));
    mathExpression.evaluate(EvaluationType.REAL,cm);
    double funXi = mathExpression.evaluate(EvaluationType.REAL, cm);

    double xiNew = xi;
    error = ((xi - xiMinus1)/xi).abs() * 100;

    results.add(SecantResultModel(iter: iter, xiMinus1: xiMinus1, funXiMinus1: funXiMinus1, xi: xi, funXi: funXi, error: error));



    if(error >= eps || iter ==0){
      iter++;
      // xi = xi - ((f(xi) * (ximinus1 - xi)) / (f(ximinus1) - f(xi)));
      xi = xi - ((funXi *(xiMinus1 - xi))/(funXiMinus1 - funXi));
      xiMinus1 = xiNew;
      calculateSecant();
    }
    return xi;
  }

  }

