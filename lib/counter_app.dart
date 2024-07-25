import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counterapp extends StatelessWidget {
  const Counterapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        centerTitle: true,
        title: Text('Counter App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' You have Pushed the button this many times',
            style: TextStyle(fontSize: 20, color: Colors.purple),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300)));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300)));
                }
              }, builder: (context, state) {
                return Text(
                  state.CounterValue.toString(),
                  style: TextStyle(fontSize: 30),
                );
              }),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      )),
    );
  }
}
