import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterState(
        status: CounterStatus.ready,
        counterValue: state.counterValue + 1,
      ));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterState(
        status: CounterStatus.ready,
        counterValue: state.counterValue - 1,
      ));
    });
  }
}
