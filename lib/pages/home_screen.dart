import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_cubit.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_state.dart';
import 'package:flutter_coffee/components/catalog_coffee_card.dart';
import 'package:flutter_coffee/components/category_menu_item.dart';
import 'package:flutter_coffee/components/header.dart';
import 'package:flutter_coffee/components/spin.dart';

List<String> coffeeCategories = ['Flat White', 'Espresso', 'Americano', 'Latte', 'Cappuccino'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeCategory = 'Cappuccino';
  String inputValue = '';
  final inputControler = TextEditingController();
  Timer? _debounce;

  changeInputValue() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        inputValue = inputControler.text;
      });
      context.read<HomeCoffeesCubit>().loadCoffees(activeCategory);
    });
  }

  @override
  void initState() {
    super.initState();
    inputControler.addListener(changeInputValue);
    context.read<HomeCoffeesCubit>().loadCoffees(activeCategory);
  }

  void changeActiveCategory(category) {
    setState(() {
      activeCategory = category;
    });
    context.read<HomeCoffeesCubit>().loadCoffees(activeCategory);
  }

  List<dynamic> filteredCoffees(List<dynamic> coffees) {
    return coffees.where((coffee) => 
      coffee['name'].toLowerCase().contains(inputValue.toLowerCase())
    ).toList();
  }

  void resetInputValue() {
    inputControler.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCoffeesCubit, HomeCofeesState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Header(),
                        const SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: inputControler,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search, color: Color.fromRGBO(239, 227, 200, 0.5),),
                                  hintText: 'Browse your favourite coffee...',
                                  hintStyle: const TextStyle(fontFamily: 'Rosarivo', color: Color.fromRGBO(239, 227, 200, 0.5), fontSize: 14.0,),
                                  filled: true,
                                  fillColor: const Color(0xFF171017),
                                  contentPadding: const EdgeInsets.only(top: 10, right: 15, bottom: 10, left: 60,),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  suffixIcon: inputValue != '' ? IconButton(
                                    onPressed: resetInputValue,
                                    icon: const Icon(Icons.clear, color: Color.fromRGBO(239, 227, 200, 0.5),),
                                  ) : null,
                                ),
                                style: const TextStyle(fontFamily: 'Rosarivo', color: Color(0xFF83796F), fontSize: 14.0,),
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
                            children: state.isLoading == true ? 
                              [const Spin()] : 
                              filteredCoffees(state.coffees).isEmpty ? 
                              [const Text('No coffees find', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFFFFFFF), fontSize: 14.0),),] : 
                              filteredCoffees(state.coffees).map((coffee) => 
                                CatalogCoffeeCard(
                                  name: coffee['name'],
                                  urlImage: coffee['urlImage'],
                                  price: coffee['price'],
                                  rating: coffee['rating'],
                                ),
                              ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 40,
                  height: MediaQuery.of(context).size.height * 0.59,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),),
                    color: Color.fromRGBO(112, 67, 65, 0.3),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 35, left: 0, bottom: 15),
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: coffeeCategories.map((category) => 
                            CategoryMenuItem(
                              category: category,
                              activeCategory: activeCategory,
                              changeActiveCategory: changeActiveCategory,
                            ),
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
