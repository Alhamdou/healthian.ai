// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import '../pages/orders.dart';

class Cart extends StatelessWidget {
  final Map<Drug, int> cart;
  final double total;

  const Cart({Key? key, required this.cart, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.isEmpty
          ? const Center(
              child: const Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final drug = cart.keys.elementAt(index);
                      final quantity = cart.values.elementAt(index);
                      return ListTile(
                        leading: Text(quantity.toString()),
                        title: Text(drug.name),
                        trailing: Text('\$${drug.price.toStringAsFixed(2)}'),
                        onTap: () {
                          // TODO: Implement remove item from cart
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:'),
                      Text('\$${total.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement checkout
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
    );
  }
}
