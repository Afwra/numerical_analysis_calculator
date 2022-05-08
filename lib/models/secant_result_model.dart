class SecantResultModel{
  int iter;
  double xiMinus1;
  double funXiMinus1;
  double xi;
  double funXi;
  double error;

  SecantResultModel({required this.iter,required this.xiMinus1,required this.funXiMinus1,required this.xi,
     required this.funXi,required this.error});
}