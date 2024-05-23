import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop2/Providers/product.dart';
//import 'package:shop2/Providers/product_provider.dart';

class ItemTile extends ConsumerWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Product p = ref.watch(productProvider);
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('lib/Assets/sample1.png'),
        Positioned(
          top: 100,
          child: GestureDetector(
            child: const Icon(
              Icons.add_shopping_cart_outlined,
            ),
            onTap: () {
              final snackbar = SnackBar(
                  content: const Text('Item added into the cart'),
                  action: SnackBarAction(label: '', onPressed: () {}));

              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
          ),
        ),
        Positioned(
          left: 100,
          top: 90,
          child: IconButton(
            onPressed: () => {ref.read(productProvider.notifier).toggleStatus(p)},
            icon: p.isFavourite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
          ),
        ),
      ],
    ));
  }
}
