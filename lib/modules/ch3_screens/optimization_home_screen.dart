import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/modules/ch3_screens/golden_section_search_screen.dart';
import 'package:numerical_analysis_calculator/shared/components/components.dart';

class OptimizationHomeScreen extends StatelessWidget {

  const OptimizationHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              children: const [
                Text(
                  'Golden Section Search',
                  style:  TextStyle(
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
          onTap: () {
            navigateTo(context, GoldenSectionSearchScreen());
          },
        ));
  }
}
