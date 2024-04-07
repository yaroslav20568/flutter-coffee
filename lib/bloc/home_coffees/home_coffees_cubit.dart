import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_state.dart';
import 'package:flutter_coffee/constants.dart';
import 'package:http/http.dart' as http;

class HomeCoffeesCubit extends Cubit<HomeCofeesState> {
  HomeCoffeesCubit() : super(HomeCofeesState(isLoading: false, coffees: []));

  Future<void> loadCoffees(String activeCategory) async {
    emit(HomeCofeesState(isLoading: true, coffees: []));
    var response = await http.get(Uri.parse('$urlApi/coffees?category=$activeCategory'));
    var coffees = await json.decode(response.body);
    emit(HomeCofeesState(isLoading: false, coffees: coffees));
  }
}