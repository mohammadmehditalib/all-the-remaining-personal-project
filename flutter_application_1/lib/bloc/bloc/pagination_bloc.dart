import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Repository/api.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:meta/meta.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(Paginationloading()) {
    on<FetchInitial>((event, emit) {
      apiFunction();
    });
     on<LoadingEvent>((event, emit) {
     emit(Paginationloading());
    });
  }
  int limit = 15;
  void apiFunction() async {
    List<Models> holder = await Api().fetchdata(limit);
    limit = limit + 15;
    emit(PaginationInitial(
      holder: holder,
    ));
  }
}
