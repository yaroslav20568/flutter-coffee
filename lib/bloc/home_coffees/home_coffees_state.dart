import 'package:equatable/equatable.dart';

class HomeCofeesState extends Equatable {
  bool? isLoading;
  List<dynamic> coffees;

  HomeCofeesState({this.isLoading, required this.coffees});

  @override
  List<dynamic> get props => [this.isLoading, this.coffees];
}