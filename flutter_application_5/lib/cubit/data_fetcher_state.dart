part of 'data_fetcher_cubit.dart';

@immutable
class DataFetcherState {}

class DataFetcherInitial extends DataFetcherState {
  List<Datafetcher> holder;

  DataFetcherInitial({required this.holder});
}

class DataFetcherFetched extends DataFetcherState {
  List<Datafetcher> holder;

  DataFetcherFetched({required this.holder});
}