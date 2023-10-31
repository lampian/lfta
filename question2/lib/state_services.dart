import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

enum CounterActions { increment, decrement }

final services = GetIt.instance;

void registerServices() {
  final store = Store<int>(
    (state, action) {
      if (action == CounterActions.decrement) {
        return state - 1;
      } else {
        return state + 1;
      }
    },
    initialState: 0,
  );
  services.registerSingleton<Store<int>>(store);
}
