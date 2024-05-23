import 'package:counter_application/cubits/cubits_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countervalue: 0));

  increment() => emit(CounterState(countervalue: state.countervalue + 1));
  decrement() => emit(CounterState(countervalue: state.countervalue - 1));
}
