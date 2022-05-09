import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/models/secant_result_model.dart';
import 'package:lazy_data_table/lazy_data_table.dart';


class SecantResultsScreen extends StatelessWidget {
  double eps;
  double xi;
  double xiMinus1;
  MathFieldEditingController equationController;
  int iter = 0;
  double error = 0;

  List<SecantResultModel> results =[];
  List<String> tableHeaders=['Xi-1','F(Xi-1)','Xi','F(Xi)','Error'];
  SecantResultsScreen({Key? key, required this.eps,required this.xi,required this.xiMinus1,required this.equationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double root = calculateSecant();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Mehtod Results'),
        backgroundColor: HexColor("21325E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LazyDataTable(
                rows: results.length,
                columns: 5,
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
                    return Center(child: Text(results[i].xiMinus1.toStringAsFixed(3)));
                  }
                  else if(j==1){
                    return Center(child: Text(results[i].funXiMinus1.toStringAsFixed(3)));
                  }
                  else if(j == 2) {
                    return Center(child: Text(results[i].xi.toStringAsFixed(3)));
                  }
                  else if(j==3){
                    return Center(child: Text(results[i].funXi.toStringAsFixed(3)));
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
    return xiMinus1;
  }

  }

