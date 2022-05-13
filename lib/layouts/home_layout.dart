import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:numerical_analysis_calculator/modules/ch3_screens/optimization_home_screen.dart';
import 'package:numerical_analysis_calculator/modules/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:numerical_analysis_calculator/modules/matrix_screen/matrix_home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentPage = 0;

  List<Widget> screens = [HomeScreen(),const MatrixHomeScreen(),const OptimizationHomeScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Parabola'),backgroundColor: HexColor("3F72AF"),),
        body: screens[currentPage],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: const <Widget>[
            FaIcon(FontAwesomeIcons.calculator,size: 30),
            FaIcon(FontAwesomeIcons.m,size: 30),
            FaIcon(FontAwesomeIcons.searchengin,size: 30),
          ],
          buttonBackgroundColor: Colors.white,
          color: HexColor("3F72AF"),
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        backgroundColor: HexColor("DBE2EF"),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
