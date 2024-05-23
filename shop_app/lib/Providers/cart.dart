import 'package:flutter/material.dart';

class cartItem {
  String id;
  int price;
  String description;
  int quantity;

  cartItem(
      {required this.id, required this.price, required this.description, required this.quantity});
}

class cart extends ChangeNotifier {
  Map<String, cartItem> t = {};

  int get totalitems {
    return t.length;
  }

  Map get mapdata {
    return t;
  }
  bool checkout=false;

  statusChange(){
    checkout=true;
     notifyListeners();
  }   

  ////iterate through each values
  int get totalcost {
    var totalcost = 0;
    for (var item in t.entries) {
      totalcost += item.value.quantity * item.value.price;
    }
    return totalcost;
  }

  void add(String productid, String description, int price) {
    //if product id exist
    if (t.containsKey(productid)) {
      t.update(
          productid,
          (value) => cartItem(
                id: value.id,
                price: value.price,
                description: value.description,
                quantity: value.quantity + 1,
              ));
    } else {
      t.putIfAbsent(
          productid,
          () => cartItem(
              id: DateTime.now().toString(), price: price, description: description, quantity: 1));
    }
    notifyListeners();
  }

  void remove(String id) {
    t.remove(id);
    notifyListeners();
  }
}
