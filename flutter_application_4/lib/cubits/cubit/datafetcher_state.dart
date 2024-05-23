part of 'datafetcher_cubit.dart';

@immutable
class DatafetcherState {}

class DatafetcherInitial extends DatafetcherState {}

class DatafetcherFetched extends DatafetcherState {
  final List<Languages> holder;
  DatafetcherFetched({required this.holder});
}
