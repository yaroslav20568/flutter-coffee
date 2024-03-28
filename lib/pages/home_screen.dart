import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_cubit.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_state.dart';
import 'package:flutter_coffee/components/catalog_coffee_card.dart';
import 'package:flutter_coffee/components/category_menu_item.dart';
import 'package:flutter_coffee/components/spin_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<String> coffeeCategories = [
  'Flat White',
  'Espresso',
  'Americano',
  'Latte',
  'Cappuccino'
];

class _HomeScreenState extends State<HomeScreen> {
  String activeCategory = 'Cappuccino';

  @override
  void initState() {
    super.initState();
    context.read<HomeCoffeesCubit>().loadCoffees(activeCategory);
  }

  void changeActiveCategory(category) {
    setState(() {
      activeCategory = category;
    });
    context.read<HomeCoffeesCubit>().loadCoffees(activeCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCoffeesCubit, OperatorState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 32, right: 16, bottom: 32),
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
                                Text('déjà',
                                    style: TextStyle(
                                        fontFamily: 'Rosarivo',
                                        color:
                                            Color.fromRGBO(239, 227, 200, 0.5),
                                        fontSize: 36)),
                                Text('Brew',
                                    style: TextStyle(
                                        fontFamily: 'Rosarivo',
                                        color: Color(0xFFEFE3C8),
                                        fontSize: 48,
                                        height: .7)),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset("assets/images/logo.png"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color.fromRGBO(239, 227, 200, 0.5),
                                  ),
                                  hintText: 'Browse your favourite coffee...',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Rosarivo',
                                    color: Color.fromRGBO(239, 227, 200, 0.5),
                                    fontSize: 14.0,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFF171017),
                                  contentPadding: EdgeInsets.only(
                                    top: 10,
                                    right: 15,
                                    bottom: 10,
                                    left: 60,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Rosarivo',
                                  color: Color(0xFF83796F),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: state.isLoading == true
                                ? [const SpinHome()]
                                : state.coffees
                                    .map(
                                      (coffee) => CatalogCoffeeCard(
                                        name: coffee['name'],
                                        urlImage: coffee['urlImage'],
                                        price: coffee['price'],
                                        rating: coffee['rating'],
                                      ),
                                    )
                                    .toList(),
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
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(112, 67, 65, 0.3),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListView(
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(top: 35, left: 0, bottom: 15),
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: coffeeCategories
                              .map(
                                (category) => CategoryMenuItem(
                                  category: category,
                                  activeCategory: activeCategory,
                                  changeActiveCategory: changeActiveCategory,
                                ),
                              )
                              .toList(),
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
