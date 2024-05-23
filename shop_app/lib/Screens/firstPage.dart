import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Providers/products.dart';
import 'package:shop_app/Screens/cartdetails.dart';
import 'package:shop_app/Screens/orders_products.dart';
import 'package:shop_app/Screens/productDetails.dart';
import 'package:shop_app/Widgets/item_tile.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final cartDate = Provider.of<cart>(context,listen: false);
    //// to reduce rendering time we use comsumer widget   
    return Scaffold(
      appBar: AppBar(title: const Text('SHOPPING APPLICATION'), actions: [
        PopupMenuButton(
          onSelected: (value) {
            if (value == 1) {
              productData.favouriteFilter();
              print('mehdi');
            } else {
              productData.selectAll();
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text("FAVOURITES"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("ALL ITEMS "),
              ),
            ];
          },
        ),
        Consumer<cart>(
          builder: (context, value, child) => Align(
            alignment: Alignment.bottomCenter,
            child: Badge(
              label: Text(cartDate.totalitems.toString()),
              textStyle: const TextStyle(fontSize: 19),
              backgroundColor: Colors.black12,
              textColor: Colors.red,
              child: GestureDetector(
                child: const Icon(Icons.add_shopping_cart),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CartDetail()));
                },
              ),
            ),
          ),
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('SHOP'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) => const firstPage()));
              },
            ),
            ListTile(
              title: const Text('ORDERS'),
              onTap: () {},
            ),
            ListTile(
                title: const Text('EDIT PRODUCTS'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderProduct()));
                }),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() { setState(() {}); });
        },
        child: FutureBuilder(
          future: Provider.of<Products>(context, listen: false).fetchDataDatabase(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState!=ConnectionState.waiting) {
              final productsl1 = productData.listing;
              return Consumer<Products>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 20),
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                          value: productsl1[index],
                          child:  Itemtile(id:productsl1[index].id),
                        );
                      },
                      itemCount: productsl1.length,
                    ),
                  );
                },
              );
            } else {
              return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
