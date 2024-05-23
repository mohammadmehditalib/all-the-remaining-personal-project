import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searchcubit_state.dart';

class SearchcubitCubit extends Cubit<SearchcubitState> {
  SearchcubitCubit() : super(SearchcubitInitial());
}
