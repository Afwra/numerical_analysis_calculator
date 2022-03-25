import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/modules/result_model.dart';
import '../../shared/components/components.dart';

class ResultsScreen extends StatefulWidget {

  double xl;
  double xu;
  double eps;
  MathFieldEditingController equationController;

  ResultsScreen({Key? key, required this.xl,required this.xu,required this.eps,required this.equationController}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<ResultModel> results =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateBisection();
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

  double calculateBisection(){
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
      xrold = xr;
      xr = (widget.xu + widget.xl) / 2;
      error = (((xr - xrold) / xr) * 100).abs();

      cm.bindVariableName('x', Number(widget.xl));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      double funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(widget.xu));
      mathExpression.evaluate(EvaluationType.REAL,cm);
      double funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

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
