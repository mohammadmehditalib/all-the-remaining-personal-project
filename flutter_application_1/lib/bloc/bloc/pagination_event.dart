part of 'pagination_bloc.dart';

@immutable
class PaginationEvent {}

class LoadingEvent extends PaginationEvent {}

class FetchInitial extends PaginationEvent {}


