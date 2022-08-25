import 'package:equatable/equatable.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AddPizzaEvent extends PizzaEvent {
  String newpizza;
  AddPizzaEvent(this.newpizza);

  @override
  List<Object?> get props => [newpizza];
}

class LoadPizzaEvent extends PizzaEvent {

  const LoadPizzaEvent();

  @override
  List<Object?> get props => [];
}
