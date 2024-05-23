part of 'pagination_bloc.dart';

class PaginationState {}

class Paginationloading extends PaginationState {}

class PaginationInitial extends PaginationState {
  List<Models> holder;

  PaginationInitial({required this.holder});
}
