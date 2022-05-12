import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numerical_analysis_calculator/models/golden_section_model.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:hexcolor/hexcolor.dart';

class GoldenSectionResultsScreen extends StatelessWidget {

  List<GoldenSectionModel> results = [];
  List<String> tableHeaders = [
    'Xl',
    'F(Xl)',
    'X2',
    'F(X2)',
    'X1',
    'F(X1)',
    'XU',
    'F(XU)',
    'D'
  ];
  double xl;
  double xu;
  int iter;
  bool min;
  MathFieldEditingController equationController;

  //goldenSection
  double r = ((sqrt(5) - 1) / 2);
  double d = 0;
  double x1 = 0;
  double x2 = 0;


  GoldenSectionResultsScreen({Key? key,
    required this.xl, required this.xu, required this.iter, required this.equationController, required this.min
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateGoldenSection();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
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
                columns: 9,
                tableDimensions: const LazyDataTableDimensions(
                  cellHeight: 50,
                  cellWidth: 100,
                  topHeaderHeight: 50,
                  leftHeaderWidth: 75,
                ),
                topHeaderBuilder: (i) => Center(child: Text(tableHeaders[i])),
                leftHeaderBuilder: (i) =>
                    Center(child: Text((results[i].iter).toString())),
                dataCellBuilder: (i, j) {
                  if (j == 0) {
                    return Center(
                        child: Text(results[i].xl.toStringAsFixed(3)));
                  }
                  else if (j == 1) {
                    return Center(
                        child: Text(results[i].funXl.toStringAsFixed(3)));
                  }
                  else if (j == 2) {
                    return Center(
                        child: Text(results[i].x2.toStringAsFixed(3)));
                  }
                  else if (j == 3) {
                    return Center(child: Text(results[i].funX2.toStringAsFixed(
                        3)));
                  }
                  else if (j == 4) {
                    return Center(child: Text(results[i].x1.toStringAsFixed(
                        3)));
                  }
                  else if (j == 5) {
                    return Center(child: Text(results[i].funX1.toStringAsFixed(
                        3)));
                  }
                  else if (j == 6) {
                    return Center(child: Text(results[i].xu.toStringAsFixed(
                        3)));
                  }
                  else if (j == 7) {
                    return Center(child: Text(
                        results[i].funXu.toStringAsFixed(3)));
                  }
                  else {
                    return Center(child: Text(results[i].d.toStringAsFixed(3)));
                  }
                },
                topLeftCornerWidget: const Center(child: Text("Iter")),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  void calculateGoldenSection() {
    var mathExpression = TeXParser(equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();

    for (int i = 0; i < iter; i++) {
      d = r * (xu - xl);
      x1 = xl + d;
      x2 = xu - d;

      cm.bindVariableName('x', Number(x1));
      mathExpression.evaluate(EvaluationType.REAL, cm);
      double funX1 = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(x2));
      mathExpression.evaluate(EvaluationType.REAL, cm);
      double funX2 = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(xl));
      mathExpression.evaluate(EvaluationType.REAL, cm);
      double funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

      cm.bindVariableName('x', Number(xu));
      mathExpression.evaluate(EvaluationType.REAL, cm);
      double funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

      results.add(GoldenSectionModel(iter: i+1,
          xl: xl,
          funXl: funXl,
          x2: x2,
          funX2: funX2,
          x1: x1,
          funX1: funX1,
          xu: xu,
          funXu: funXu,
          d: d));

      if (min == false) { //maximum
        if (funX2 > funX1) {
          xu = x1;
        }
        else {
          xl = x2;
        }
      }
      else {
        if (funX2 > funX1) {
          xl = x2;
        }
        else {
          xu = x1;
        }
      }
    }

  }
}
