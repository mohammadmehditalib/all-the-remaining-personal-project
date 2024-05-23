import 'dart:convert';
import 'dart:core';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop2/Providers/product.dart';
import 'package:http/http.dart' as http;

class apiservice {
  List<Product> loadedData = [];

  Future<List<Product>> fetchdatabase() async {
    final response = await http.get(
      Uri.parse('https://shop-app-63690-default-rtdb.firebaseio.com/products.json'),
    );
    /////convert json string to json  -jsonDecode
    final extractedData = jsonDecode(response.body);

    ////json encode json to json string
    print(extractedData[1]);
    extractedData.forEach((key, prodData) {
      loadedData.add(Product(
          id: key,
          url: prodData['url'],
          title: prodData['title'],
          price: prodData['price'],
          description: prodData['description'],
          isFavourite: prodData['favourite']));
    });
    return loadedData;
  }
   




}

final productListProvider = FutureProvider<List<Product>>((ref) {
  return apiservice().fetchdatabase();
});
