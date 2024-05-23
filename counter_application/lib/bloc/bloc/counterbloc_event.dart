part of 'counterbloc_bloc.dart';

class CounterblocEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CounterIncrementPressed extends CounterblocEvent {}

class CounterDecrementPressed extends CounterblocEvent {}
