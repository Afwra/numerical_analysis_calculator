import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:numerical_analysis_calculator/layouts/home_layout.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(image: AssetImage('images/parabola.png'),),
      title:const Text(
        "Parabola",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: HomeLayout(),
      durationInSeconds: 5,
    );
  }
  // @override
  // // Widget build(BuildContext context) {
  // //   return MaterialApp(
  // //     debugShowCheckedModeBanner: false,
  // //     home: HomeScreen(),
  // //   );
  // // }
}

void main(){
  runApp(const MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}
