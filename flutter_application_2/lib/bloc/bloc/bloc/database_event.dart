part of 'database_bloc.dart';

@immutable
class DatabaseEvent {}

class DatabaseFetchingEvent extends DatabaseEvent {}

class DatabaseFetchedEvent extends DatabaseEvent {}
