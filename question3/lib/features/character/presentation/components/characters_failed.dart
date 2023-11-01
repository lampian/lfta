import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';

class CharactersFailed extends StatelessWidget {
  final String message;
  const CharactersFailed({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ref1.png',
          height: 300,
        ),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'The application is misbehaving,'
            ' please try again after your coffee break '
            'by clicking the refresh button',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Container(
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: IconButton(
              onPressed: () =>
                  context.read<CharactersBloc>().add(GetInitialEvent()),
              icon: const Icon(Icons.refresh),
            ),
          ),
        ),
      ],
    );
  }
}
