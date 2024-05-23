part of 'weatherbloc_bloc.dart';

@immutable
class WeatherblocState {}

class WeatherblocInitial extends WeatherblocState {}

class Weatherblocfetching extends WeatherblocState {}

class Weatherblocfetched extends WeatherblocState {
  final num currentTemp;
  final num maxTemp;
  final num minTemp;

  final num windSpeed;
  final num humidity;
  final String image;

  Weatherblocfetched(
      {required this.currentTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.windSpeed,
      required this.humidity,
      required this.image});
}

class WeatherblocfetchingError extends WeatherblocState {}
