import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import '../../models/result_model.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import '../error_screen.dart';

class FalsePositionResultsScreen extends StatefulWidget {
  double xl;
  double xu;
  double eps;
  MathFieldEditingController equationController;

  FalsePositionResultsScreen(
      {Key? key,
      required this.xl,
      required this.xu,
      required this.eps,
      required this.equationController})
      : super(key: key);

  @override
  State<FalsePositionResultsScreen> createState() =>
      _FalsePositionResultsScreenState();
}

class _FalsePositionResultsScreenState
    extends State<FalsePositionResultsScreen> {
  List<ResultModel> results = [];
  List<String> tableHeaders = [
    'Xl',
    'F(Xl)',
    'Xu',
    'F(Xu)',
    'Xr',
    'F(Xr)',
    'Error'
  ];

  @override
  Widget build(BuildContext context) {
    double root = calculateFalsePosition();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: HexColor("3F72AF"),
      ),
      body: BuildCondition(
        condition: root != 0,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: LazyDataTable(
                    rows: results.length,
                    columns: 7,
                    tableDimensions: const LazyDataTableDimensions(
                      cellHeight: 50,
                      cellWidth: 100,
                      topHeaderHeight: 50,
                      leftHeaderWidth: 75,
                    ),
                    topHeaderBuilder: (i) =>
                        Center(child: Text(tableHeaders[i])),
                    leftHeaderBuilder: (i) =>
                        Center(child: Text(results[i].iter.toString())),
                    dataCellBuilder: (i, j) {
                      switch (j) {
                        case 0:
                          return Center(
                              child: Text(results[i].xl.toStringAsFixed(3)));
                        case 1:
                          return Center(
                              child: Text(results[i].funXl.toStringAsFixed(3)));
                        case 2:
                          return Center(
                              child: Text(results[i].xu.toStringAsFixed(3)));
                        case 3:
                          return Center(
                              child: Text(results[i].funXu.toStringAsFixed(3)));
                        case 4:
                          return Center(
                              child: Text(results[i].xr.toStringAsFixed(3)));
                        case 5:
                          return Center(
                              child: Text(results[i].funXr.toStringAsFixed(3)));
                        default:
                          return Center(
                              child: Text(
                                  '${results[i].error.toStringAsFixed(3)}%'));
                      }
                    },
                    topLeftCornerWidget: const Center(child: Text("Iter")),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Root = ${root.toStringAsFixed(3)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          );
        },
        fallback: (context) => const ErrorScreen(),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  double calculateFalsePosition() {
    var mathExpression =
        TeXParser(widget.equationController.currentEditingValue()).parse();
    ContextModel cm = ContextModel();

    cm.bindVariableName('x', Number(widget.xl));
    double funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

    cm.bindVariableName('x', Number(widget.xu));
    double funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

    if (funXu * funXl > 0) {
      return 0;
    } else {
      int iter = 0;
      double xr = 0;
      double xrold = 0;
      double error = 0;
      do {
        cm.bindVariableName('x', Number(widget.xl));
        mathExpression.evaluate(EvaluationType.REAL, cm);
        double funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

        cm.bindVariableName('x', Number(widget.xu));
        mathExpression.evaluate(EvaluationType.REAL, cm);
        double funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

        xrold = xr;
        xr = widget.xu - (funXu * (widget.xl - widget.xu)) / (funXl - funXu);
        error = (((xr - xrold) / xr) * 100).abs();

        cm.bindVariableName('x', Number(widget.xl));
        mathExpression.evaluate(EvaluationType.REAL, cm);
        funXl = mathExpression.evaluate(EvaluationType.REAL, cm);

        cm.bindVariableName('x', Number(widget.xu));
        mathExpression.evaluate(EvaluationType.REAL, cm);
        funXu = mathExpression.evaluate(EvaluationType.REAL, cm);

        cm.bindVariableName('x', Number(xr));
        mathExpression.evaluate(EvaluationType.REAL, cm);
        double funXr = mathExpression.evaluate(EvaluationType.REAL, cm);

        results.add(ResultModel(
            iter: iter,
            xl: widget.xl,
            funXl: funXl,
            xu: widget.xu,
            funXu: funXu,
            xr: xr,
            funXr: funXr,
            error: error));

        if (funXl * funXr < 0) {
          widget.xu = xr;
        } else if (funXl * funXr > 0) {
          widget.xl = xr;
        } else {
          break;
        }
        iter++;
      } while (error > widget.eps);

      return xr;
    }
  }
}
