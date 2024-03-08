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
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('déjà', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFF877C74), fontSize: 36)),
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
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Color(0xFF83796F)),
                          hintText: 'Browse your favourite coffee...',
                          hintStyle: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFF83796F), fontSize: 14.0),
                          filled: true,
                          fillColor: Color(0xFF171017),
                          contentPadding: EdgeInsets.only(top: 10, right: 15, bottom: 10, left: 60),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFF83796F), fontSize: 14.0),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}