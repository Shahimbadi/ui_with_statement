import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final GroceryItem item;

  ProductDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Rating: ${item.rating}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('\$${item.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Category: ${item.category}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: Size(300, 50)),
                onPressed: () {
                  Provider.of<GroceryProvider>(context, listen: false).addToCart(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.name} added to cart')),
                  );
                },
                child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
