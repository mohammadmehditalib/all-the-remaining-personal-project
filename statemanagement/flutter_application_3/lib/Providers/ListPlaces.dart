import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/place.dart';

class ListPlaces extends StateNotifier<List<Place>> {
  ListPlaces() : super([]);

  void add(String title) {
    Place obj = Place(DateTime.now().second, title);
    state = [...state, obj];
  }
}

final listprovider = StateNotifierProvider<ListPlaces, List<Place>>((ref) {
  return ListPlaces();
});
