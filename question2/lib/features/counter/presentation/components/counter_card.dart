import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lfta_question2/features/counter/presentation/components/counter_event_control.dart';
import 'package:lfta_question2/state_services.dart';
import 'package:redux/redux.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, String>(
      converter: (store) => store.state.toString(),
      builder: (context, count) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterEventControl(
                    onTap: () => services
                        .get<Store<int>>()
                        .dispatch(CounterActions.decrement),
                    iconData: Icons.remove_circle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(
                      count,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  CounterEventControl(
                    onTap: () => services
                        .get<Store<int>>()
                        .dispatch(CounterActions.increment),
                    iconData: Icons.add_circle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
