import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('déjà', style: TextStyle(fontFamily: 'Rosarivo', color: Color.fromRGBO(239, 227, 200, 0.5), fontSize: 36),),
            Text('Brew', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFEFE3C8), fontSize: 48, height: .7),),
          ],
        ),
        Column(
          children: <Widget>[
            Image.asset("assets/images/logo.png"),
          ],
        ),
      ],
    );
  }
}