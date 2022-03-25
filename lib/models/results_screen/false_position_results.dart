import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/modules/result_model.dart';
import '../../shared/components/components.dart';

class FalsePositionResultsScreen extends StatefulWidget {

  double xl;
  double xu;
  double eps;
  MathFieldEditingController equationController;

  FalsePositionResultsScreen({Key? key, required this.xl,required this.xu,required this.eps,required this.equationController}) : super(key: key);

  @override
  State<FalsePositionResultsScreen> createState() => _FalsePositionResultsScreenState();
}

class _FalsePositionResultsScreenState extends State<FalsePositionResultsScreen> {
  List<ResultModel> results =[];


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateFalsePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: HexColor("21325E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context,index){return SingleChildScrollView(child: itemBuilder(results[index]),);},
          separatorBuilder: (context,index)=>const SizedBox(height: 15,),
          itemCount: results.length,
        ),
      ),
      backgroundColor: HexColor("3E497A"),
    );
  }

  // double f(double num){
  //   var mathExpression = TeXParser(widget.equationController.currentEditingValue()).parse();
  //   ContextModel cm = ContextModel();
  //   print(widget.equationController.currentEditingValue());
  //   cm.bindVariableName('x', Number(widget.xl));
  //   mathExpression.evaluate(EvaluationType.REAL,cm);
  //   return mathExpression.evaluate(EvaluationType.REAL,cm);
  //
  //
  // }

  double calculateFalsePosition(){
    var mathExpression = TeXParser(widget.equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();
    // cm.bindVariableName('x', Number(2.0));
    // mathExpression.evaluate(EvaluationType.REAL,cm);
    // double eval  = mathExpression.evaluate(EvaluationType.REAL, cm);
    // print(eval);

    int iter = 0;
    double xr = 0;
    double xrold = 0;
    double error = 0;
    do
    {
      cm.bindVariableName('x', Number(widget.xl));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      double funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(widget.xu));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      double funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

      xrold = xr;
      xr =widget.xu - (funXu*(widget.xl - widget.xu)) / (funXl - funXu);
      error = (((xr - xrold) / xr) * 100).abs();

      cm.bindVariableName('x', Number(widget.xl));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(widget.xu));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(xr));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      double funXr = mathExpression.evaluate(EvaluationType.REAL, cm);

      results.add(ResultModel(iter: iter,xl: widget.xl, funXl: funXl, xu: widget.xu, funXu: funXu, xr: xr, funXr: funXr, error: error));


      if(funXl * funXr <0){
        widget.xu =xr;
      }
      else if(funXl * funXr > 0){
        widget.xl = xr;
      }
      else{
        break;
      }
      iter++;
    } while (error > widget.eps);

    return xr;

  }


}
