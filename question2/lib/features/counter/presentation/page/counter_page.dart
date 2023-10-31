import 'package:flutter/material.dart';
import '../components/counter_card.dart';
import '../components/info_card.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Littlefish Flutter Technical Assessment'),
      ),
      bottomSheet: const InfoCard(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            label(),
            const SizedBox(height: 16),
            const CounterCard(),
          ],
        ),
      ),
    );
  }

  Widget label() {
    return const Text(
      'Question 2 Redux',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
      ),
    );
  }
}
