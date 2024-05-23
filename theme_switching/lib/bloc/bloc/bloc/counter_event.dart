part of 'counter_bloc.dart';

 class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}
class ChangeCounterValue extends CounterEvent{
   int incrementFactor;  
   ChangeCounterValue({required this.incrementFactor});
}


