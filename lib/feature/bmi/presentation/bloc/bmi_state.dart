abstract class BMIState {}

class BMIInitial extends BMIState {}

class BMICalculated extends BMIState {
  final double bmi;

  BMICalculated(this.bmi);
}
