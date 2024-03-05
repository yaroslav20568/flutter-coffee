import 'package:flutter/material.dart';
import 'package:flutter_coffee/bottom_tabs_icons.dart';
import 'package:flutter_coffee/pages/favorites_screen.dart';
import 'package:flutter_coffee/pages/home_screen.dart';
import 'package:flutter_coffee/pages/cart_screen.dart';
import 'package:flutter_coffee/pages/notifications_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: const Color(0xFF201520),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 0.0),
            ),
            tabs: [
              Tab(icon: Icon(BottomTabsIcons.home, size: 26)),
              Tab(icon: Icon(BottomTabsIcons.cart, size: 26)),
              Tab(icon: Icon(BottomTabsIcons.favorites, size: 26)),
              Tab(icon: Icon(BottomTabsIcons.notifications, size: 29)),
            ],
            labelColor: Color(0xFFFFFFFF),
            unselectedLabelColor: Color(0XFF746763),
            dividerHeight: 78,
            dividerColor: Color(0xFF22151F),
            labelPadding: EdgeInsets.only(top: 12, bottom: 12),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              CartScreen(),
              FavoritesScreen(),
              NotificationsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}