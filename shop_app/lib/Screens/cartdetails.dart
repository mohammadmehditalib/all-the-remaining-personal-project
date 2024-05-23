import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final cartDate = Provider.of<cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR CART'),
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: Card(
            child: Row(
              children: [
                const Text('Total',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(cartDate.totalcost.toString(),
                    style: const TextStyle(color: Colors.red),
                    )
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    child: const Text('ORDER NOW',
                    style: TextStyle(
                     color: Colors.blue
                    ),
                    ),
                    onTap: () {
                      cartDate.statusChange();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: ValueKey(cartDate.t.keys.toList()[index]),
                onDismissed: (direction) => {cartDate.remove(cartDate.t.keys.toList()[index])},
                child: Container(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(cartDate.t.values.toList()[index].description),
                        Text(cartDate.t.values.toList()[index].quantity.toString()),
                        Text(cartDate.t.values.toList()[index].price.toString()),
                        Text((cartDate.t.values.toList()[index].quantity *
                                cartDate.t.values.toList()[index].price)
                            .toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: cartDate.t.length,
          ),
        ),
      ]),
    );
  }
}
