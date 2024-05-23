import 'dart:convert';

import 'package:flutter_application_5/models/index.dart';
import 'package:http/http.dart' as http;

class Api {




  static Future dataFetcher() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    List responseData = jsonDecode(response.body);
    List<Datafetcher> holder = [];

    for (int i = 0; i < responseData.length; i++) {
      holder.add(Datafetcher.fromJson(responseData[i]));
    }
    return holder;
  }
}
