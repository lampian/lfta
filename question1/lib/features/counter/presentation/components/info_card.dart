import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfta_question1/features/counter/presentation/bloc/counter_bloc.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state.status == CounterStatus.initial) {
          return Container(
            height: 80,
            color: Colors.blueAccent,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Center(
                child: Text(
                  'Select + or - to add or decrement value',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
