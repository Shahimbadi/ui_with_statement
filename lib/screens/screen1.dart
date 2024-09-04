import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_statement/screens/screen2.dart';
import 'package:ui_with_statement/screens/screen3.dart';

import '../provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Fruits', 'Vegetables', 'Dairy Products', 'Essentials'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 100,
        title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white, size: 40,),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            }, icon: Icon(CupertinoIcons.cart, color: Colors.white, size: 40,))
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent
                ),
              ),
            ),
            Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Container(
              height: 100,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Card(
                      color: selectedCategory == category ? Colors.blue : Colors.white,
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: selectedCategory == category ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            Text('Best Seller', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Expanded(
              child: Consumer<GroceryProvider>(
                builder: (context, provider, child) {
                  final items = provider.getItemsByCategory(selectedCategory);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(item: item),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    height: 120,
                                    child: Image.network(item.imageUrl, fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.name, style: TextStyle(fontSize: 16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('\$${item.price}', style: TextStyle(fontSize: 14)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Rating: ${item.rating}', style: TextStyle(fontSize: 14)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(item.category, style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
