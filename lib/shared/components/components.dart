import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/modules/methods_screen/newton_method.dart';
import 'package:numerical_analysis_calculator/modules/methods_screen/secant_method.dart';
import '../../models/numerical_methods.dart';
import '../../modules/methods_screen/bisection_screen.dart';
import '../../modules/methods_screen/false_position_screen.dart';
import '../../modules/methods_screen/fixed_point_screen.dart';


List<Widget> screens = [
  BisectionScreen(),
  FalsePositionScreen(),
  FixedPointScreen(),
  NewtonScreen(),
  SecantScreen(),
];

List<NumericalMethods> methods = [
  NumericalMethods(name: 'Bisection Method'),
  NumericalMethods(name: 'False Position Method'),
  NumericalMethods(name: 'Simple Fixed Point'),
  NumericalMethods(name: 'Newton Method'),
  NumericalMethods(name: 'Secant Method'),
];
// List<Widget> matrixScreens = [GaussElimination(),LuDecomposition(),Cramer()];
List<String> matrix = [
  'Gauss Elimination',
  'LU Decomposition',
  "Cramer's Rule"
];

Widget methodsList(int index,context) =>Padding(
  padding: const EdgeInsets.all(10.0),
  child: GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HexColor("FF7E67"),
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

// Widget matrixList(int index,context,TextEditingController r0c0,TextEditingController r0c1,TextEditingController r0c2,TextEditingController r0c3,TextEditingController r1c0,TextEditingController r1c1,TextEditingController r1c2,TextEditingController r1c3,TextEditingController r2c0,TextEditingController r2c1,TextEditingController r2c2,TextEditingController r2c3) {
//   matrixInfo =
//   [
//     [double.parse(r0c0.text),double.parse(r0c1.text),double.parse(r0c2.text),double.parse(r0c3.text)],
//     [double.parse(r1c0.text),double.parse(r1c1.text),double.parse(r1c2.text),double.parse(r1c3.text)],
//     [double.parse(r2c0.text),double.parse(r2c1.text),double.parse(r2c2.text),double.parse(r2c3.text)],
//   ];
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: GestureDetector(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: HexColor("FF7E67"),
//         ),
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               matrix[index],
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         matrixNavigateTo(context, matrixScreens[index],matrixInfo);
//       },
//     ),
//   );
// }

void navigateTo(context, screen){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

// void matrixNavigateTo(context,screen,matrixInfo){
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => screen),
//   );


// Widget itemBuilder(result){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: HexColor("FFD93D"),
//     ),
//     child: Column(
//       children: [
//         Text('Iter = ${result.iter}',style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//         ),),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text('XL = ${result.xl.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(XL) = ${result.funXl.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//           children: [
//             Text('XU = ${result.xu.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(XU) = ${result.funXu.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//           children: [
//             Text('XR = ${result.xr.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(XR) = ${result.funXr.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Error Rate = ${result.error.toStringAsFixed(3)}',
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget fixedPointItemBuilder(result){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: HexColor("FFD93D"),
//     ),
//     child: Column(
//       children: [
//         Text('Iter = ${result.iter}',style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//         ),),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text('X0 = ${result.xi.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(XL) = ${result.funXi.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Error Rate = ${result.error.toStringAsFixed(3)}',
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget newtonItemBuilder(NewtonResultModel result){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: HexColor("FFD93D"),
//     ),
//     child: Column(
//       children: [
//         Text('Iter = ${result.iter}',style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//         ),),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text('Xi = ${result.x0.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(Xi) = ${result.funX0.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               "F'(Xi) = ${result.fDashX0.toStringAsFixed(3)}",
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Error Rate = ${result.error.toStringAsFixed(3)}',
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget secantItemBuilder(SecantResultModel result){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: HexColor("FFD93D"),
//     ),
//     child: Column(
//       children: [
//         Text('Iter = ${result.iter}',style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//         ),),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text('Xi-1 = ${result.xiMinus1.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(Xi-1) = ${result.funXiMinus1.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//           children: [
//             Text('XI = ${result.xi.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//             Text('F(XI) = ${result.funXi.toStringAsFixed(3)}',style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20
//             ),),
//           ],
//         ),
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Error Rate = ${result.error.toStringAsFixed(3)}',
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

