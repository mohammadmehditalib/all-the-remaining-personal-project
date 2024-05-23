import 'package:hooks_riverpod/hooks_riverpod.dart';

class Product {
  String id;
  String url;
  String title;
  int price;
  String description;
  bool isFavourite;

  Product(
      {required this.id,
      required this.url,
      required this.title,
      required this.price,
      required this.description,
      required this.isFavourite});

  Product copyWith({
      String? id, String? url, String? title, int? price, String? description, bool? isFavourite}) {
    return Product(
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
        price:  price ?? this.price,
        description: description ??this.description,
        isFavourite: isFavourite ??this.isFavourite);
  }
}

class ProductNotifier extends StateNotifier<Product> {
  ProductNotifier()
      : super(Product(id: '', url: '', title: '', price: 0, description: '', isFavourite: false));   
  //state 
  void toggleStatus(Product p) {
    state = p.copyWith(isFavourite: !p.isFavourite);
  }
  //state 
   

  //state








  
}







final productProvider = StateNotifierProvider<ProductNotifier, Product>((ref) {
  return ProductNotifier();
});


