import 'package:basic_coin_dispense/counter/view/input_page.dart';
import 'package:basic_coin_dispense/counter/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/routes.dart';
import 'counter/cubit/counter_cubit.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
            create: (context) => CounterCubit()..appStarted()),
      ],
      child: MaterialApp(
        routes: {
          INPUT_PAGE: (context) => InputPage(),
          RESULT_PAGE: (context) => ResultPage(),
        },
        home: SafeArea(
          child: InputPage(),
        ),
      ),
    );
  }
}
