import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Screens/productDetails.dart';

class Itemtile extends StatelessWidget {
  final String id;

  const Itemtile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartdata = Provider.of<cart>(context, listen: false);
    return Stack(
      children: [
        Image.asset(product.url),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: GestureDetector(
            child: const Icon(
              Icons.add_shopping_cart_outlined,
            ),
            onTap: () {
              final snackbar = SnackBar(
                  content: const Text('Item added into the cart'),
                  action: SnackBarAction(label: '', onPressed: () {}));

              cartdata.add(product.id.toString(), product.description.toString(), product.price);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
          ),
        ),
        Consumer<Product>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.only(left: 80, top: 80),
            child: IconButton(
              onPressed: () => {product.change(id)},
              icon: product.isFavourite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            ),
          ),
        ),
      ],
    );
  }
}
