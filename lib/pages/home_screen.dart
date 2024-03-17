import 'package:flutter/material.dart';
import 'package:flutter_coffee/bottom_tabs_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('déjà', style: TextStyle(fontFamily: 'Rosarivo', color: Color.fromRGBO(239, 227, 200, 0.5), fontSize: 36)),
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
                  const SizedBox(height: 30,),
                  const Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Color.fromRGBO(239, 227, 200, 0.5),),
                            hintText: 'Browse your favourite coffee...',
                            hintStyle: TextStyle(fontFamily: 'Rosarivo', color: Color.fromRGBO(239, 227, 200, 0.5), fontSize: 14.0,),
                            filled: true,
                            fillColor: Color(0xFF171017),
                            contentPadding: EdgeInsets.only(top: 10, right: 15, bottom: 10, left: 60,),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFF83796F), fontSize: 14.0,),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 47),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: <Widget>[
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),),
                          margin: EdgeInsets.zero,
                          color: const Color.fromRGBO(255, 255, 255, 0.1),
                          child: Container(
                            width: 135,
                            padding: const EdgeInsets.all(12), 
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'assets/images/coffee/cinnamon-cocoa.jpg',
                                        width: 111,
                                        height: 111,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0, 
                                      left: 0, 
                                      child: Container(
                                        width: 41,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(1),), 
                                          color: Color.fromRGBO(65, 65, 65, 0.8),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(BottomTabsIcons.star, size: 11, color: Color(0xFFD3A601),),
                                            SizedBox(width: 4.5,),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 3),
                                              child: Text('4.5', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFFFFFFF), fontSize: 10.0),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8,),
                                const Text('Cinnamon & Cocoa', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFFFFFFF), fontSize: 14.0),),
                                const SizedBox(height: 13,),
                                Container(
                                  padding: const EdgeInsets.only(left: 22),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(255, 255, 255, 0.08),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text('₹99', style: TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFFFFF), fontSize: 16.0, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        width: 39,
                                        height: 39,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEFE3C8), padding: const EdgeInsets.all(2.0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                          child: const Text('+', style: TextStyle(fontSize: 25, color: Color(0xFF1C161E)),),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}