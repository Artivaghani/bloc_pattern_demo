import 'package:equatable/equatable.dart';

abstract class PizzaState extends Equatable{}

class InistialState extends PizzaState{
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class Pizzaloaded extends PizzaState{
  List<String> pizzas;
  Pizzaloaded({required this.pizzas});

  @override
  List<Object?> get props =>[pizzas];
  
}