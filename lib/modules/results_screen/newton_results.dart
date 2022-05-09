import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/models/newton_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class NewtonResults extends StatelessWidget {
  double x0;
  double eps;
  MathFieldEditingController equationController;


  List<NewtonResultModel> results =[];
  List<String>tableHeaders = ['Xi','F(Xi)',"F'(Xi)",'Error'];

  NewtonResults({Key? key, required this.x0,required this.eps,required this.equationController}) : super(key: key);

  double error = 0;
  int iter = 0;
  double xiPlus1 = 0;

  @override
  Widget build(BuildContext context) {
    double root = calculateNewton();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Method Results'),
        backgroundColor: HexColor("3F72AF"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LazyDataTable(
                rows: results.length,
                columns: 4,
                tableDimensions: const LazyDataTableDimensions(
                  cellHeight: 50,
                  cellWidth: 100,
                  topHeaderHeight: 50,
                  leftHeaderWidth: 75,
                ),
                topHeaderBuilder: (i) => Center(child: Text(tableHeaders[i])),
                leftHeaderBuilder: (i) => Center(child: Text(results[i].iter.toString())),
                dataCellBuilder: (i, j) {
                  if(j == 0) {
                    return Center(child: Text(results[i].x0.toStringAsFixed(3)));
                  }
                  else if(j==1){
                    return Center(child: Text(results[i].funX0.toStringAsFixed(3)));
                  }
                  else if(j==1){
                    return Center(child: Text(results[i].fDashX0.toStringAsFixed(3)));
                  }
                  else{
                    return Center(child: Text('${results[i].error.toStringAsFixed(3)}%'));
                  }
                },
                topLeftCornerWidget: const Center(child: Text("Iter")),
              ),
            ),
            const SizedBox(height: 15,),
            Text('Root = ${root.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ],
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
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
