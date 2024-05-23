import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop2/Providers/product.dart';
import 'package:shop2/Providers/products.dart';
import 'package:shop2/widgets/itemtile.dart';

class screen1 extends ConsumerWidget {
  const screen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(productListProvider);
    return t.when(
        data: (t) => Scaffold(
              appBar: AppBar(title: const Text('SHOPPING APPLICATION')),
              body: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3 / 2),
                itemBuilder: (ctx, index) {
                  
                  return const ItemTile();
                },
                itemCount: t.length,
              ),
            ),
        error: (err, stack) => const Text('fdfd'),
        loading: () => const CircularProgressIndicator());
  }
}
