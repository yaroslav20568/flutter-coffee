import 'package:flutter/material.dart';
import 'package:flutter_coffee/bottom_tabs_icons.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: const TabBar(
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
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Tab(icon: Icon(BottomTabsIcons.home)),
              Tab(icon: Icon(BottomTabsIcons.cart)),
              Tab(icon: Icon(BottomTabsIcons.favorites)),
              Tab(icon: Icon(BottomTabsIcons.notifications)),
            ],
          ),
        ),
      ),
    );
  }
}