import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/models/simple_fixed_point_result_model.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';

class FixedPointResults extends StatelessWidget {

  double eps;
  double x0;
  MathFieldEditingController equationController;
  int iter = 0;
  double error = 0;
  double xiPlus1 = 0;


  FixedPointResults({required this.eps,required this.x0,required this.equationController});

  List<SimpleFixedPointResultModel> results =[];

  @override
  Widget build(BuildContext context) {
    calculateFixedPoint();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Mehtod Results'),
        backgroundColor: HexColor("21325E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context,index){return SingleChildScrollView(child: fixedPointItemBuilder(results[index]),);},
          separatorBuilder: (context,index)=>const SizedBox(height: 15,),
          itemCount: results.length,
        ),
      ),
      backgroundColor: HexColor("3E497A"),
    );
  }


  double calculateFixedPoint(){
    var mathExpression = TeXParser(equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();

    cm.bindVariableName('x', Number(x0));
    mathExpression.evaluate(EvaluationType.REAL,cm);
    double funXi = mathExpression.evaluate(EvaluationType.REAL, cm);

    xiPlus1 = funXi;
    
    results.add(SimpleFixedPointResultModel(iter: iter, xi: x0, funXi: funXi, error: error));

    if(error >= eps || iter ==0){
      error = (((xiPlus1 - x0) / xiPlus1) * 100).abs();
      iter++;
      x0 = xiPlus1;
      calculateFixedPoint();
    }
    return x0;
  }
}
