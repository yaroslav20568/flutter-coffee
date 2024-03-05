import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'this is the cart screen.',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}