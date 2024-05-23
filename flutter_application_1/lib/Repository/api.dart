import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc/pagination_bloc.dart';
import 'package:flutter_application_1/models/index.dart';
import 'package:http/http.dart' as http;

class Api {
  List<Models> holder = [];

  Future<List<Models>> fetchdata(int limit) async {
    print('$limit');
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=${limit}'));
      if (response.statusCode == 200) {
        final List responseData = jsonDecode(response.body)['current']['products'];
        for (int i = 0; i < responseData.length; i++) {
          holder.add(Models.fromJson(responseData[i]));
        }
      }
    } catch (e) {
      return [];
    }
    return holder;
  }
}
