import 'dart:convert';

import 'package:flutter_application_4/models/languages.dart';
import 'package:http/http.dart' as http;

class Api {
  List<Languages> holder = [];
  Future<List<Languages>> apiFetcher() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    //print('${response.body.length}  ----->');
    print(response.body);


   print('fdkhfksdhfkhsdkfhsdkfhskdhflsdhflshdf----->');

    final List responseData = jsonDecode(response.body);
     print(responseData);





    for (int i = 0; i < responseData.length; i++) {
      holder.add(Languages.fromJson(responseData[i]));
    }
    print(holder);
    return holder;
  }
}
