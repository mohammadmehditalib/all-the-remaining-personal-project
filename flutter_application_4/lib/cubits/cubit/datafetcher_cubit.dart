import 'package:bloc/bloc.dart';
import 'package:flutter_application_4/models/languages.dart';
import 'package:flutter_application_4/repository/data.dart';
import 'package:meta/meta.dart';

part 'datafetcher_state.dart';

class DatafetcherCubit extends Cubit<DatafetcherState> {
  DatafetcherCubit() : super(DatafetcherInitial());

  Future function() async {
    final holder = await Api().apiFetcher();
    emit(DatafetcherFetched(holder: holder));
  }
}
