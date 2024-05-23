import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/products.dart';
import 'package:shop_app/Screens/add_product.dart';
import 'package:shop_app/Screens/edit_product.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  bool _loadingstate = false;

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<Products>(context, listen: false);
    final productsl1 = cartdata.listing;
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT PRODUCTS'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProduct()));
            },
          )
        ],
      ),
      body: Consumer<Products>(
        builder: (context, value, child) {
          return RefreshIndicator(
            onRefresh: () {
              return Future(() {
                setState(() {
                  
                });
              });
            },
            child: _loadingstate
                ? const Align(alignment: Alignment.center, child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                          leading: Image.asset(productsl1[index].url),
                          title: Text(productsl1[index].description),
                          visualDensity: const VisualDensity(vertical: -4),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: GestureDetector(
                              child: const Icon(Icons.edit),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditProduct(id: productsl1[index].id)));
                              },
                            ),
                          ),
                          trailing: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _loadingstate = true;
                                });
                                await cartdata.delete(productsl1[index].id);
                                setState(() {
                                  _loadingstate = false;
                                });
                              },
                              child: const Icon(Icons.delete_outline)));
                    },
                    itemCount: productsl1.length,
                  ),
          );
        },
      ),
    );
  }
}
