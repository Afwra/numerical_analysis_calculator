import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numerical_analysis_calculator/models/simple_fixed_point_result_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class FixedPointResults extends StatelessWidget {

  double eps;
  double x0;
  MathFieldEditingController equationController;
  int iter = 0;
  double error = 0;
  double xiPlus1 = 0;


  FixedPointResults({required this.eps,required this.x0,required this.equationController});

  List<SimpleFixedPointResultModel> results =[];
  List<String> tableHeaders = ['Xi' , 'F(Xi)','Error'];

  @override
  Widget build(BuildContext context) {
    double root = calculateFixedPoint();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Fixed Point Mehtod Results'),
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
                columns: 3,
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
                    return Center(child: Text(results[i].xi.toStringAsFixed(3)));
                  }
                  else if(j==1){
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
      backgroundColor: HexColor("DBE2EF"),
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
