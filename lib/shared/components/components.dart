
import 'package:flutter/material.dart';
import 'package:numerical_analysis_calculator/models/methods_screen/bisection_screen.dart';
import 'package:numerical_analysis_calculator/models/methods_screen/fixed_point_screen.dart';
import 'package:numerical_analysis_calculator/modules/numerical_methods.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/methods_screen/false_position_screen.dart';
import '../../modules/result_model.dart';

List<Widget> screens = [
  BisectionScreen(),
  FalsePositionScreen(),
  FixedPointScreen(),
];

List<NumericalMethods> methods = [
  NumericalMethods(name: 'Bisection Method', imagePath: 'https://freesvg.org/img/1538299359.png'),
  NumericalMethods(name: 'False Position Method', imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/False_position_method.svg/1024px-False_position_method.svg.png'),
  NumericalMethods(name: 'Simple Fixed Point', imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Fixed_point_example.svg/800px-Fixed_point_example.svg.png'),
];

Widget methodsList(int index,context) =>Padding(
  padding: const EdgeInsets.all(10.0),
  child: GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HexColor("FFD93D"),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            methods[index].name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
    onTap: (){
      navigateTo(context, screens[index]);
    },
  ),
);

void navigateTo(context, screen){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

Widget itemBuilder(ResultModel result){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: HexColor("FFD93D"),
    ),
    child: Column(
      children: [
        Text('Iter = ${result.iter}',style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('XL = ${result.xl.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text('F(XL) = ${result.funXl.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Text('XU = ${result.xu.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text('F(XU) = ${result.funXu.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Text('XR = ${result.xr.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text('F(XR) = ${result.funXr.toStringAsFixed(3)}',style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Error Rate = ${result.error.toStringAsFixed(3)}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

