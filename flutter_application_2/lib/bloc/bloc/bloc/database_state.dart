part of 'database_bloc.dart';

@immutable
class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class DatabaseFetching extends DatabaseState {}

class DatabaseFetched extends DatabaseState {
  final List<WeatherData> dataHolder;
  DatabaseFetched({required this.dataHolder});
}


