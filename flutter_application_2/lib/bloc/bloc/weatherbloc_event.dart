part of 'weatherbloc_bloc.dart';

@immutable
class WeatherblocEvent {}



class WeatherblocInitialEvent extends WeatherblocEvent {}



class WeatherblocfetchingEvent extends WeatherblocEvent {
  final String inputText;
  WeatherblocfetchingEvent(this.inputText);
}


