import 'package:flutter/material.dart';
import 'package:flutter_application_3/Providers/ListPlaces.dart';
import 'package:flutter_application_3/Screens.dart/add_places.dart';
import 'package:flutter_application_3/Screens.dart/place_detail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoritesPlaces extends ConsumerWidget {
  const FavoritesPlaces({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPlaces()));
            },
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: ref.watch(listprovider).length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                title: Text(ref.read(listprovider)[index].title),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Placedetail(ref.read(listprovider)[index].title)));
              },
            );
          }
                      
          ),
    );
  }
}
