import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  Future authorization(String email, String password) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA5AiWlQnf5camfvpt2A6FV6l65BZiM-dI';
    final response = await http.post(Uri.parse(url),    
        body: json.encode({'email': email, 'password': password, 'returnSecureToken': true}));
    if (response.statusCode != 200) {
      throw Exception('error');
    }
  }

  Future signWithPassword(String email, String password) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA5AiWlQnf5camfvpt2A6FV6l65BZiM-dI';
    final response =
        await http.post(Uri.parse(url), body: jsonEncode({'email': email, 'password': password}));
    if (response.statusCode != 200) {
      throw Exception('error');
    }
  }
}
