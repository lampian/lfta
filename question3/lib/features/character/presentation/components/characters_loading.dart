import 'package:flutter/material.dart';

class CharactersLoading extends StatelessWidget {
  const CharactersLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
