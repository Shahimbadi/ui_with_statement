import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_statement/provider/provider.dart';
import 'package:ui_with_statement/screens/screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GroceryProvider(),
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
