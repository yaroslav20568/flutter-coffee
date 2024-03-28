import 'package:equatable/equatable.dart';

class OperatorState extends Equatable {
  bool? isLoading;
  List<dynamic> coffees;

  OperatorState({this.isLoading, required this.coffees});

  @override
  List<dynamic> get props => [this.isLoading, this.coffees];
}