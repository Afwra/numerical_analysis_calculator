import 'dart:convert';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PartialPivoting extends StatelessWidget {
  var matrixInfo;


  PartialPivoting({Key? key, required this.matrixInfo}) : super(key: key);

  double m21 = 0,m31 = 0,m32 = 0;
  List<dynamic> result1 =[
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
  ];
  List<dynamic> result2 =[
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
  ];
  List<dynamic> result3 =[
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
    [0.0,0.0,0.0,0.0],
  ];

  double x1 = 0;
  double x2 = 0;
  double x3 = 0;


  List<dynamic> u = [
    [0.0,0.0,0.0],
    [0.0,0.0,0.0],
    [0.0,0.0,0.0],
  ];
  List<dynamic> l = [
    [0.0,0.0,0.0],
    [0.0,0.0,0.0],
    [0.0,0.0,0.0],
  ];
  List<double> b = [];

  double c1 =0;
  double c2 = 0;
  double c3 = 0;


  @override
  Widget build(BuildContext context) {
    calculatePartialPivoting();
    return Scaffold(
      appBar: AppBar(title: const Text('Partial Pivoting Results'),backgroundColor: HexColor("3F72AF")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 1',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                children:<TextSpan>[
                                  TextSpan(text: '${result1[0].toString()}\n'),
                                  TextSpan(text: '${result1[1].toString()}\n'),
                                  TextSpan(text: '${result1[2].toString()}\n'),
                                ]
                            )
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('m21 = ${m31.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text('m31 = ${m21.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 2',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                children:<TextSpan>[
                                  TextSpan(text: '${result2[0].toString()}\n'),
                                  TextSpan(text: '${result2[1].toString()}\n'),
                                  TextSpan(text: '${result2[2].toString()}\n'),
                                ]
                            )
                        ),
                        const SizedBox(height: 5,),
                        Text('m32 = ${m32.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TitledContainer(
                titleColor: Colors.blue,
                title: 'Step 3',
                textAlign: TextAlignTitledContainer.Center,
                fontSize: 16.0,
                backgroundColor: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                children:<TextSpan>[
                                  TextSpan(text: '${result3[0].toString()}\n'),
                                  TextSpan(text: '${result3[1].toString()}\n'),
                                  TextSpan(text: '${result3[2].toString()}\n'),
                                ]
                            )
                        ),

                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TitledContainer(
                      titleColor: Colors.blue,
                      title: 'Step 4',
                      textAlign: TextAlignTitledContainer.Center,
                      fontSize: 16.0,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('U = ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                              const SizedBox(width: 5,),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                      children:<TextSpan>[
                                        TextSpan(text: '${u[0].toString()}\n'),
                                        TextSpan(text: '${u[1].toString()}\n'),
                                        TextSpan(text: '${u[2].toString()}\n'),
                                      ]
                                  )
                              ),

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    TitledContainer(
                      titleColor: Colors.blue,
                      title: 'Step 5',
                      textAlign: TextAlignTitledContainer.Center,
                      fontSize: 16.0,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('L = ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                              const SizedBox(width: 5,),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                      children:<TextSpan>[
                                        TextSpan(text: '${l[0].toString()}\n'),
                                        TextSpan(text: '${l[1].toString()}\n'),
                                        TextSpan(text: '${l[2].toString()}\n'),
                                      ]
                                  )
                              ),

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TitledContainer(
                  titleColor: Colors.blue,
                  title: 'Step 6',
                  textAlign: TextAlignTitledContainer.Center,
                  fontSize: 16.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 300,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '${l[0].toString()}\n'),
                                      TextSpan(text: '${l[1].toString()}\n'),
                                      TextSpan(text: '${l[2].toString()}\n'),
                                    ]
                                )
                            ),
                            const SizedBox(width: 10,),
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '[ C1 ]\n'),
                                      TextSpan(text: '[ C2 ]\n'),
                                      TextSpan(text: '[ C3 ]\n'),
                                    ]
                                )
                            ),
                            const SizedBox(width: 10,),
                            const Text('=',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                            const SizedBox(width: 10,),
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '[${b[0].toString()}]\n'),
                                      TextSpan(text: '[${b[1].toString()}]\n'),
                                      TextSpan(text: '[${b[2].toString()}]\n',),
                                    ]
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        const Text('LC=B'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('C1 = $c1',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ,),
                  Text('C2 = $c2',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ,),
                  Text('C3 = $c3',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TitledContainer(
                  titleColor: Colors.blue,
                  title: 'Step 7',
                  textAlign: TextAlignTitledContainer.Center,
                  fontSize: 16.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 300,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '${u[0].toString()}\n'),
                                      TextSpan(text: '${u[1].toString()}\n'),
                                      TextSpan(text: '${u[2].toString()}\n'),
                                    ]
                                )
                            ),
                            const SizedBox(width: 10,),
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '[ X1 ]\n'),
                                      TextSpan(text: '[ X2 ]\n'),
                                      TextSpan(text: '[ X3 ]\n'),
                                    ]
                                )
                            ),
                            const SizedBox(width: 10,),
                            const Text('=',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                            const SizedBox(width: 10,),
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                                    children:<TextSpan>[
                                      TextSpan(text: '[${c1.toString()}]\n'),
                                      TextSpan(text: '[${c2.toString()}]\n'),
                                      TextSpan(text: '[${c3.toString()}]\n',),
                                    ]
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        const Text('UX=C'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('X1 = $x1',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ,),
                  Text('X2 = $x2',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ,),
                  Text('X3 = $x3',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: HexColor("DBE2EF"),
    );
  }

  void calculatePartialPivoting() {
    calculateLu();
    for(int i =0; i< 3;i++){
      for(int j =0; j< 4;j++){

        result1[i][j] = precise(result1[i][j]);
        result2[i][j] = precise(result2[i][j]);
        result3[i][j] = precise(result3[i][j]);

      }
    }
    for(int i =0; i< 3;i++){
      for(int j =0; j< 3;j++){
        u[i][j] = precise(u[i][j]);
        l[i][j] = precise(l[i][j]);
      }
    }
    m21 = precise(m21);
    m31 = precise(m31);
    m32 = precise(m32);

  }
  void calculateLu(){

    // for (int i = 0; i < 3; i++)
    // {
    //   b.add(matrixInfo[i][3]);
    // }
    calculateGE();
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        u[i][j] = matrixInfo[i][j];
      }
    }
    l[0][1] = 0.0;
    l[0][2] = 0.0;
    l[1][2] = 0.0;
    l[0][0] = 1.0;
    l[1][1] = 1.0;
    l[2][2] = 1.0;
    l[1][0] = m21;
    l[2][0] = m31;
    l[2][1] = m32;
    //lc=b
    c1 = (b[0] / l[0][0]);
    c2 = ((b[1] - (l[1][0] * c1)) / l[1][1]);
    c3 = ((b[2] - ((l[2][0] * c1) + (l[2][1] * c2))) / l[2][2]);

    c1 = precise(c1);
    c2 = precise(c2);
    c3 = precise(c3);


    //ux=c
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        matrixInfo[i][j] = u[i][j];
      }
    }
    matrixInfo[0][3] = c1;
    matrixInfo[1][3] = c2;
    matrixInfo[2][3] = c3;
    x3 = (matrixInfo[2][3] / matrixInfo[2][2]);
    x2 = ((matrixInfo[1][3] - (matrixInfo[1][2] * x3)) / matrixInfo[1][1]);
    x1 = ((matrixInfo[0][3] - ((matrixInfo[0][1] * x2) + (matrixInfo[0][2] * x3))) / matrixInfo[0][0]);

    x1 = precise(x1);
    x2 = precise(x2);
    x3 = precise(x3);

  }
  void calculateGE(){

    if(matrixInfo[1][0].abs() > matrixInfo[0][0].abs() && matrixInfo[2][0].abs() > matrixInfo[0][0].abs()){
      if(matrixInfo[1][0].abs() > matrixInfo[2][0].abs() ){
        swap(matrixInfo, 0, 1);
        swap(matrixInfo, 1, 2);
      }else{
        swap(matrixInfo, 0, 2);
      }
    }else if(matrixInfo[1][0].abs() > matrixInfo[0][0].abs()){
      swap(matrixInfo, 0 , 1);
    }
    else{
      swap(matrixInfo, 0, 2);
    }

    result1 = json.decode(json.encode(matrixInfo));

    m21 = matrixInfo[1][0] / matrixInfo[0][0];
    m31 = matrixInfo[2][0] / matrixInfo[0][0];
    //rule E2-(m21)E1 = E2
    for (int j = 0; j < 3; j++)
    {
      var e2 = matrixInfo[1][j];
      var e1 = ((m21)*matrixInfo[0][j]);
      matrixInfo[1][j] = e2 - e1;
    }

    for (int j = 0; j < 3; j++)
    {
      var e3 = matrixInfo[2][j];
      var e1 = ((m31)*matrixInfo[0][j]);
      matrixInfo[2][j] = e3 - e1;
    }

    if(matrixInfo[2][1].abs() > matrixInfo[1][1].abs() ){
      swap(matrixInfo, 1, 2);
      double tmp = m21;
      m21 =  m31;
      m31 = tmp;
    }


    result2 = json.decode(json.encode(matrixInfo));
    m32 = matrixInfo[2][1] / matrixInfo[1][1];
    //rule E3-(m32)E2 = E3
    for (int j = 0; j < 3; j++)
    {
      var e3 = matrixInfo[2][j];
      var e1 = ((m32)*matrixInfo[1][j]);
      matrixInfo[2][j] = e3 - e1;
    }
    result3 = json.decode(json.encode(matrixInfo));
    for (int i = 0; i < 3; i++)
    {
      b.add(matrixInfo[i][3]);
    }
  }
  void swap(var matrix,int swapIndex,swapWith){
    var tmp = json.decode(json.encode(matrixInfo));
    for(int i = 0; i<4 ; i++){
      matrixInfo[swapWith][i] = tmp[swapIndex][i];
      matrixInfo[swapIndex][i] = tmp[swapWith][i];
    }
  }
  double precise(double n){
    return double.parse(n.toStringAsFixed(2));
  }

}
