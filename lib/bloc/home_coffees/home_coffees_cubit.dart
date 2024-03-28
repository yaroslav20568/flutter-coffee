import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/home_coffees/home_coffees_state.dart';
import 'package:http/http.dart' as http;

class HomeCoffeesCubit extends Cubit<OperatorState> {
  HomeCoffeesCubit() : super(OperatorState(isLoading: false, coffees: []));

  Future<void> loadCoffees(String activeCategory) async {
    emit(OperatorState(coffees: [], isLoading: true));
    var response = await http.get(Uri.parse('http://192.168.100.33:3000/coffees?category=$activeCategory'));
    var coffees = await json.decode(response.body);
    emit(OperatorState(coffees: coffees, isLoading: false));
  }
}