abstract class BMIEvent {}

class CalculateBMI extends BMIEvent {
  final double height;
  final double weight;

  CalculateBMI({required this.height, required this.weight});
}
