import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('déjà', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0XFF746763), fontSize: 36)),
                      Text('Brew', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFEFE3C8), fontSize: 48, height: .7)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/logo.png"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}