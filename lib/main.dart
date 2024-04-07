import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_cubit.dart';
import 'package:flutter_coffee/bloc/notifications/notifications_cubit.dart';
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
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 0.0),
            ),
            tabs: [
              Tab(icon: Icon(BottomTabsIcons.home, size: 26)),
              Tab(icon: Icon(BottomTabsIcons.cart, size: 26)),
              Tab(icon: Icon(BottomTabsIcons.favorites, size: 26)),
              // Tab(child: badges.Badge(
              //   badgeContent: Text('3', style: TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFFFFF), fontSize: 14.0),),
              //   badgeStyle: badges.BadgeStyle(padding: EdgeInsets.all(6), badgeColor: Color(0xFF355555),),
              //   child: Tab(icon: Icon(BottomTabsIcons.notifications, size: 29)),
              // ),),
              Tab(icon: Icon(BottomTabsIcons.notifications, size: 29)),
            ],
            labelColor: Color(0xFFEFE3C8),
            unselectedLabelColor: Color(0xFF746763),
            dividerHeight: 78,
            dividerColor: Color(0xFF22151F),
            labelPadding: EdgeInsets.only(top: 12, bottom: 12),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (_) => HomeCoffeesCubit(),
                child: const HomeScreen(),
              ),
              const CartScreen(),
              const FavoritesScreen(),
              // const NotificationsScreen(),
              BlocProvider(
                create: (_) => NotificationsCubit(),
                child: const NotificationsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}