import 'package:blocpatterndemo/pizza_page/pizza_event.dart';
import 'package:blocpatterndemo/pizza_page/pizza_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(InistialState()) {
    on<LoadPizzaEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(Pizzaloaded(pizzas: const []));
    });
    on<AddPizzaEvent>((event, emit) {
      if (state is Pizzaloaded) {
        final state = this.state as Pizzaloaded;
        emit(Pizzaloaded(pizzas: List.from(state.pizzas)..add(event.newpizza)));
      }
    });
  }
}
