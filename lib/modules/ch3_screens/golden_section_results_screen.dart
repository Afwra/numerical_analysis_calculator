import 'package:flutter/material.dart';
import 'package:numerical_analysis_calculator/models/golden_section_model.dart';
// import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
// import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:hexcolor/hexcolor.dart';

class GoldenSectionResultsScreen extends StatelessWidget {

  List<GoldenSectionModel> results =[];
  List<String> tableHeaders = ['Xl','F(Xl)','X2','F(X2)','X1','F(X1)','XU','F(XU)','D'];
  double xl;
  double xu;
  int iter;
  MathFieldEditingController equationController;


  GoldenSectionResultsScreen({Key? key,
     required this.xl,required this.xu,required this.iter,required this.equationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
          backgroundColor: HexColor("3F72AF"),
        ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Expanded(
      //         child: LazyDataTable(
      //           rows: results.length,
      //           columns: 7,
      //           tableDimensions: const LazyDataTableDimensions(
      //             cellHeight: 50,
      //             cellWidth: 100,
      //             topHeaderHeight: 50,
      //             leftHeaderWidth: 75,
      //           ),
      //           topHeaderBuilder: (i) => Center(child: Text(tableHeaders[i])),
      //           leftHeaderBuilder: (i) => Center(child: Text(results[i].iter.toString())),
      //           dataCellBuilder: (i, j) {
      //             if(j == 0) {
      //               return Center(child: Text(results[i].xl.toStringAsFixed(3)));
      //             }
      //             else if(j==1){
      //               return Center(child: Text(results[i].funXl.toStringAsFixed(3)));
      //             }
      //             else if(j==2){
      //               return Center(child: Text(results[i].xu.toStringAsFixed(3)));
      //             }
      //             else if(j==3){
      //               return Center(child: Text(results[i].funXu.toStringAsFixed(3)));
      //             }
      //             else if(j==4){
      //               return Center(child: Text(results[i].xr.toStringAsFixed(3)));
      //             }
      //             else if(j==5){
      //               return Center(child: Text(results[i].funXr.toStringAsFixed(3)));
      //             }
      //             else{
      //               return Center(child: Text('${results[i].error.toStringAsFixed(3)}%'));
      //             }
      //           },
      //           topLeftCornerWidget: const Center(child: Text("Iter")),
      //         ),
      //       ),
      //       const SizedBox(height: 15,),
      //       Text('Root = ${root.toStringAsFixed(3)}',style: const TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20
      //       ),),
      //     ],
      //   ),
      // ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }
}
