import 'package:flutter/material.dart';

import '../model/model.dart';

class GroceryProvider with ChangeNotifier {
  List<GroceryItem> _items = [
    GroceryItem(
      imageUrl: 'https://th.bing.com/th/id/R.6151763c33e59220b4573c21350e8431?rik=L%2fJgLKI3sOayOQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2016%2f04%2fApple-Fruit-Transparent.png&ehk=EHM4o2qYcs3TOuB4%2bLTC0B%2fcguP9PDXKhWXtWxqMoDs%3d&risl=&pid=ImgRaw&r=0',
      name: 'Apple',
      price: 1.99,
      rating: 4.5,
      category: 'Fruits',
    ),
    GroceryItem(
      imageUrl: 'https://pngimg.com/uploads/banana/banana_PNG825.png',
      name: 'Banana',
      price: 0.99,
      rating: 4.7,
      category: 'Fruits',
    ),
    GroceryItem(
      imageUrl: 'https://pngimg.com/uploads/carrot/carrot_PNG4985.png',
      name: 'Carrot',
      price: 2.49,
      rating: 4.3,
      category: 'Vegetables',
    ),
    GroceryItem(
      imageUrl: 'https://static.vecteezy.com/system/resources/previews/019/469/068/original/transparent-glass-of-fresh-milk-png.png',
      name: 'Milk',
      price: 1.49,
      rating: 4.8,
      category: 'Dairy Products',
    ),
    GroceryItem(
      imageUrl: 'https://th.bing.com/th/id/R.ee88fa1ed50bf023cdfc02f07d9b77a3?rik=CzyjP4DyUS8OAQ&riu=http%3a%2f%2fclipart-library.com%2fimg1%2f849213.png&ehk=FKGZ7RteFzBm2vrKaJOvotR4adbP5LXLdurmYAiDXU0%3d&risl=&pid=ImgRaw&r=0',
      name: 'Bread',
      price: 2.99,
      rating: 4.6,
      category: 'Essentials',
    ),
    GroceryItem(
      imageUrl: 'https://th.bing.com/th/id/R.c6028161eb7cbc7859530873fe03301d?rik=WbJAQfOpqPM09A&riu=http%3a%2f%2fpngimg.com%2fuploads%2fcheese%2fcheese_PNG10.png&ehk=fmuMrnsCmRvajm%2bs9Bmpc6ZqMNU8%2bX34IO1JvNgwlnc%3d&risl=1&pid=ImgRaw&r=0',
      name: 'Cheese',
      price: 3.99,
      rating: 4.4,
      category: 'Dairy Products',
    ),
    GroceryItem(
      imageUrl: 'https://th.bing.com/th/id/R.d0f1ab95a6918d8846f9584384fff959?rik=DwzxIAPNHft5vw&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-tomato-tomato-png-3531.png&ehk=Re0ej1MQo3QkyEUbnS%2bTglEiTnVdF88rmXY%2biswXgdI%3d&risl=&pid=ImgRaw&r=0',
      name: 'Tomato',
      price: 1.29,
      rating: 4.2,
      category: 'Vegetables',
    ),
  ];

  List<GroceryItem> _cart = [];

  List<GroceryItem> get items => _items;
  List<GroceryItem> get cart => _cart;

  List<GroceryItem> getItemsByCategory(String category) {
    if (category == 'All') {
      return _items;
    }
    return _items.where((item) => item.category == category).toList();
  }

  void addItem(GroceryItem item) {
    _items.add(item);
    notifyListeners();
  }

  void addToCart(GroceryItem item) {
    _cart.add(item);
    notifyListeners();
  }
}