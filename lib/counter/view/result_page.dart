import 'package:basic_coin_dispense/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  CounterCubit _counterCubit;

  Widget breakdownList(Map<String, int> breakdownMap) {
    if (breakdownMap == null) {
      return Text('Input was invalid! Don\'t give the goods');
    } else if (breakdownMap.length == 0) {
      return Text('No change');
    }
    List<String> keys = [];
    breakdownMap.keys.forEach((element) {
      keys.add(element);
    });

    return Container(
      height: 300.0,
      child: ListView.builder(
        itemCount: breakdownMap.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${breakdownMap[keys[index]]} x ${keys[index]} '),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _counterCubit = BlocProvider.of<CounterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state is CounterInputState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is CounterOutputState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    'Breakdown:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  breakdownList(state.mainCounter.changeBreakdown),
                  Spacer(),
                  OutlineButton(
                    onPressed: () => _counterCubit.appStarted(),
                    child: Text('Reset'),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
