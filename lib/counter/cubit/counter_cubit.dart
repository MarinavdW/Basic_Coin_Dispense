import 'package:basic_coin_dispense/constants/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  getTender(String tender) {
    double myTender = double.tryParse(tender);
    emit(
      CounterOutputState(
        state.mainCounter.copyWith(tender: myTender, change: getBreakdown(myTender)),
      ),
    );
  }

  Map<String, int> getBreakdown(double tender) {
    double change = tender - cost;
    if (change < 0 ) return null;
    Map<String, int> changeBreakdown = {};
    double runningTotal = change;
    denominations.forEach((key, value) {
      if (runningTotal >= value) {
        changeBreakdown[key] = (runningTotal / value).floor();
        runningTotal = runningTotal % value;
      }
    });
    return changeBreakdown;
  }

  appStarted() {
    emit(CounterInputState(state.mainCounter));
  }
}
