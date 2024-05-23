import 'package:bloc/bloc.dart';
import 'package:counter_application/bloc/bloc/counterbloc_state.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counterbloc_event.dart';

class CounterblocBloc extends Bloc<CounterblocEvent, CounterblocState> {
  CounterblocBloc() : super(CounterblocState(countervalue: 0)) {
    on<CounterIncrementPressed>((event, emit) {
       emit(CounterblocState(countervalue: state.countervalue + 1));
    });
     on<CounterDecrementPressed>((event, emit) {
      emit(CounterblocState(countervalue: state.countervalue - 1));
    });
  }
}


