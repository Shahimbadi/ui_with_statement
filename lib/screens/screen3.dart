import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<GroceryProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.cart.length,
            itemBuilder: (context, index) {
              final item = provider.cart[index];
              return ListTile(
                leading: Image.network(item.imageUrl),
                title: Text(item.name),
                subtitle: Text('\$${item.price} - Rating: ${item.rating}'),
                trailing: Text(item.category),
              );
            },
          );
        },
      ),
    );
  }
}
