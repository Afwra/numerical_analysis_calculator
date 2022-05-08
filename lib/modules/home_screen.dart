import 'package:flutter/material.dart';
import 'package:numerical_analysis_calculator/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Numerical Calculator',
        ),
        backgroundColor: HexColor("21325E"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => methodsList(index,context),
          separatorBuilder: (context,index) =>const SizedBox(height: 5,),
          itemCount: methods.length
      ),
      backgroundColor: HexColor("3E497A"),
    );
  }



}
