part of 'counter_bloc.dart';

enum CounterStatus { initial, ready }

class CounterState extends Equatable {
  final CounterStatus status;
  final int counterValue;

  const CounterState({
    this.status = CounterStatus.initial,
    this.counterValue = 0,
  });

  @override
  List<Object?> get props => [
        status,
        counterValue,
      ];
}
