import 'package:flutter/material.dart';

class CategoryMenuItem extends StatelessWidget {
  final String category;
  final String activeCategory;
  const CategoryMenuItem({Key? key, required this.category, required this.activeCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(category, style: TextStyle(fontFamily: 'Rosarivo', color: category == activeCategory ? const Color(0xFFEFE3C8) : const Color.fromRGBO(239, 227, 200, 0.5), fontSize: 14.0),),
    );
  }
}