import 'package:basic_coin_dispense/constants/constants.dart';
import 'package:basic_coin_dispense/constants/routes.dart';
import 'package:basic_coin_dispense/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CounterCubit _counterCubit;

  @override
  void initState() {
    super.initState();
    _counterCubit = BlocProvider.of<CounterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state){
        if(state is CounterOutputState){
          Navigator.of(context).pushNamed(RESULT_PAGE);
        }
      },
      builder: (context, state){
        if(state is CounterInputState){
          TextEditingController _tenderController = TextEditingController();
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.grey,),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Amount due:', style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('R$cost', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                  ),
                  SizedBox(height: 20.0,),
                  Text('Capture rand note denomination'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: TextFormField(
                        controller: _tenderController,
                        ),
                      ),
                  Spacer(),
                  OutlineButton(onPressed: (){
                    if(_tenderController.text != ''){
                      _counterCubit.getTender(_tenderController.text);
                    }
                  }, child: Text('Submit'),)
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

