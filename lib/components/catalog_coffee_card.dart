import 'package:flutter/material.dart';
import 'package:flutter_coffee/bottom_tabs_icons.dart';

class CatalogCoffeeCard extends StatelessWidget {
  const CatalogCoffeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      child: const Icon(BottomTabsIcons.plus, size: 13, color: Color(0xFF1C161E),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}