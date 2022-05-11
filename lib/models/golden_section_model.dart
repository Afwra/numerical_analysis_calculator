class GoldenSectionModel{
  int iter;
  double xl;
  double funXl;
  double x2;
  double funX2;
  double x1;
  double funX1;
  double xu;
  double funXu;
  double d;

  GoldenSectionModel({required this.iter,required this.xl,required this.funXl,required this.x2,required this.funX2,
    required this.x1,required this.funX1,required this.xu,required this.funXu,required this.d});
}