import 'package:bloc/bloc.dart';
import 'package:flutter_application_5/models/index.dart';
import 'package:flutter_application_5/repositories/apifetcher.dart';
import 'package:meta/meta.dart';

part 'data_fetcher_state.dart';

class DataFetcherCubit extends Cubit<DataFetcherState> {
  DataFetcherCubit() : super(DataFetcherInitial(holder: []));

  apiCalling() async {
    List<Datafetcher> holder = await Api.dataFetcher();
    emit(DataFetcherFetched(holder: holder));
  }
}
