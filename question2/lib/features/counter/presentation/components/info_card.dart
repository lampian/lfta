import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, String>(
      converter: (store) => store.state.toString(),
      builder: (context, state) {
        if (state == '0') {
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
