part of 'counter_cubit.dart';

class MainCounter extends Equatable{
  final double tender;
  final Map<String, int> changeBreakdown;

  MainCounter({this.tender, this.changeBreakdown});

  @override
  List<Object> get props => [tender, changeBreakdown];

  MainCounter copyWith({
    double tender,
    Map<String, int> change,
  }) {
    if ((tender == null || identical(tender, this.tender)) &&
        (change == null || identical(change, this.changeBreakdown))) {
      return this;
    }

    return new MainCounter(
      tender: tender ?? this.tender,
      changeBreakdown: change ?? this.changeBreakdown,
    );
  }
}

abstract class CounterState extends Equatable {
  final MainCounter mainCounter;
  const CounterState(this.mainCounter);

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(MainCounter());
}

class CounterInputState extends CounterState {
  CounterInputState(MainCounter mainCounter) : super(mainCounter);
}

class CounterOutputState extends CounterState {
  CounterOutputState(MainCounter mainCounter) : super(mainCounter);
}

class CounterErrorState extends CounterState {
  CounterErrorState(MainCounter mainCounter) : super(mainCounter);
}

