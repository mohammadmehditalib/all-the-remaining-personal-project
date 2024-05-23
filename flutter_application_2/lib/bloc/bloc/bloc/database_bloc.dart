import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/services/database.dart';
import 'package:meta/meta.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial()) {
    on<DatabaseFetchingEvent>((event, emit) {
      function();
    });
  }
////
  Future<void> function() async {
    emit(DatabaseFetching());
    List<WeatherData> weatherData = [];
    List<Map> response = await DataBaseHelper.getWeatherData();
    for (int i = 0; i < response.length; i++) {
      weatherData.add(WeatherData(
          currentTemp: response[i]['currentTemp'],
          maxTemp: response[i]['maxTemp'],
          minTemp: response[i]['minTemp'],
          windSpeed: response[i]['windSpeed'],
          humidity: response[i]['Humidity']));
    }
    emit(DatabaseFetched(dataHolder: weatherData));
    // response.forEach()

    // emit(DatabaseFetched(dataHolder: dataHolder));
  }
}
