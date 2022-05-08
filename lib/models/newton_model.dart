class NewtonResultModel{
  double x0;
  double error;
  double funX0;
  double fDashX0;
  int iter;

  NewtonResultModel({required this.x0,required this.error,required this.funX0,required this.fDashX0,required this.iter});
}