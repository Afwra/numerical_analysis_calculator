import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/models/newton_model.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';

class NewtonResults extends StatelessWidget {
  double x0;
  double eps;
  MathFieldEditingController equationController;


  List<NewtonResultModel> results =[];

  NewtonResults({Key? key, required this.x0,required this.eps,required this.equationController}) : super(key: key);

  double error = 0;
  int iter = 0;
  double xiPlus1 = 0;

  @override
  Widget build(BuildContext context) {
    calculateNewton();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Mehtod Results'),
        backgroundColor: HexColor("21325E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context,index){return SingleChildScrollView(child: newtonItemBuilder(results[index]),);},
          separatorBuilder: (context,index)=>const SizedBox(height: 15,),
          itemCount: results.length,
        ),
      ),
      backgroundColor: HexColor("3E497A"),
    );
  }

  double calculateNewton(){
    var mathExpression = TeXParser(equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();
    ContextModel cm2 = ContextModel();

    // var derivedMathExpression = TeXParser(equationController.currentEditingValue()).parse();
    // ContextModel derivedCM = ContextModel();

    var derivedMathExpression = mathExpression.derive('x');
    var simplifiedMathExpression = derivedMathExpression.simplify();


    cm.bindVariableName('x', Number(x0));
    mathExpression.evaluate(EvaluationType.REAL,cm);
    double funX0 = mathExpression.evaluate(EvaluationType.REAL, cm);

    cm2.bindVariableName('x', Number(x0));
    simplifiedMathExpression.evaluate(EvaluationType.REAL,cm2);
    double fDashX0 = simplifiedMathExpression.evaluate(EvaluationType.REAL, cm2);


    results.add(NewtonResultModel(x0: x0, error: error, funX0: funX0, fDashX0: fDashX0, iter: iter));
    xiPlus1 = x0 - (funX0/fDashX0);
    if(error >= eps || iter ==0){
      error = (((xiPlus1 - x0) / xiPlus1) * 100).abs();
      iter++;
      x0 = xiPlus1;
      calculateNewton();
    }
    return x0;
  }
}
