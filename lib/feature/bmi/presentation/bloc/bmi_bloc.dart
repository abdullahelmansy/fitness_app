import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/feature/bmi/presentation/bloc/bmi_event.dart';
import 'package:new_project/feature/bmi/presentation/bloc/bmi_state.dart';

class BMIBloc extends Bloc<BMIEvent, BMIState> {
  BMIBloc() : super(BMIInitial()) {
    on<CalculateBMI>((event, emit) {
      final bmi = event.weight / ((event.height / 100) * (event.height / 100));
      emit(BMICalculated(bmi));
    });
  }
}
