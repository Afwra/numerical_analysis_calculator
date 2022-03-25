import 'package:flutter/material.dart';
import 'package:numerical_analysis_calculator/models/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

void main(){
  runApp(MyApp());
}
