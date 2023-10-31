import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lfta_question2/state_services.dart';
import 'package:redux/redux.dart';
import 'features/counter/presentation/page/counter_page.dart';

void main() {
  registerServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoreProvider<int>(
        store: services.get<Store<int>>(),
        child: const CounterPage(),
      ),
    );
  }
}
