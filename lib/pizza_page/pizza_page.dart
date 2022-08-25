import 'package:blocpatterndemo/pizza_page/pizza_bloc.dart';
import 'package:blocpatterndemo/pizza_page/pizza_event.dart';
import 'package:blocpatterndemo/pizza_page/pizza_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PizzaPage extends StatelessWidget {
  PizzaPage({Key? key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<PizzaBloc>().add(const LoadPizzaEvent());
    return Scaffold(
      body: SafeArea(
        child: Column(
         
          children: [
            Row(
              children: [
                Expanded(
                    child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter pizza name',
                      labelText: 'Pizza *',
                    ),
                    validator: (String? value) {
                      return value!.isEmpty
                          ? 'Please Enter pizza name for add'
                          : null;
                    },
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: (() {
                        if (formKey.currentState!.validate()) {
                          context.read<PizzaBloc>().add(AddPizzaEvent(
                              textEditingController.text.toString()));
                          textEditingController.text = '';
                        }
                      })),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<PizzaBloc, PizzaState>(
                builder: (context, state) {
                  if (state is InistialState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Pizzaloaded) {
                    return ListView.builder(
                      itemCount: state.pizzas.length,
                      itemBuilder: (context, index) {
                        return Text(
                          state.pizzas[index].toString(),
                          style: const TextStyle(color: Colors.black),
                        );
                      },
                    );
                  } else {
                    return const Text('something went wrong...');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
