import 'package:flutter/material.dart';

import '../widgets/cart.dart';

class DrugList extends StatefulWidget {
  const DrugList({Key? key}) : super(key: key);

  @override
  _DrugListState createState() => _DrugListState();
}

class Drug {
  final String name;
  final String description;
  final double price;

  Drug({required this.name, required this.description, required this.price});
}

class _DrugListState extends State<DrugList> {
  final List<Drug> _drugs = [
    Drug(name: 'Ibuprofen', description: 'Description for Drug A', price: 10.0),
    Drug(name: 'Metformin', description: 'Description for Drug B', price: 20.0),
    Drug(name: 'Tadalafil', description: 'Description for Drug C', price: 30.0),
    Drug(
        name: 'Acetaminophen',
        description: 'Description for Drug D',
        price: 40.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
    Drug(
        name: 'Simvastatin',
        description: 'Description for Drug E',
        price: 50.0),
  ];

  final Map<Drug, int> _cart = {};

  void _addToCart(Drug drug) {
    setState(() {
      if (_cart.containsKey(drug)) {
        _cart[drug] = _cart[drug]! + 1;
      } else {
        _cart[drug] = 1;
      }
    });
  }

  void _removeFromCart(Drug drug) {
    setState(() {
      if (_cart.containsKey(drug)) {
        if (_cart[drug]! > 1) {
          _cart[drug] = _cart[drug]! - 1;
        } else {
          _cart.remove(drug);
        }
      }
    });
  }

  double get _totalPrice {
    return _cart.entries
        .fold(0, (sum, entry) => sum + entry.key.price * entry.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drug List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Cart(cart: _cart, total: _totalPrice),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _drugs.length,
        itemBuilder: (BuildContext context, int index) {
          final drug = _drugs[index];
          return ListTile(
            title: Text(drug.name),
            subtitle: Text(drug.description),
            trailing: Text('\$${drug.price}'),
            onTap: () => _addToCart(drug),
          );
        },
      ),
    );
  }
}
