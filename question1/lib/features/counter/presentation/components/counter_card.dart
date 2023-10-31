import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfta_question1/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:lfta_question1/features/counter/presentation/components/counter_event_control.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
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
                    onTap: () => context
                        .read<CounterBloc>()
                        .add(DecrementCounterEvent()),
                    iconData: Icons.remove_circle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(
                      state.counterValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  CounterEventControl(
                    onTap: () => context
                        .read<CounterBloc>()
                        .add(IncrementCounterEvent()),
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
