import 'package:flutter/material.dart';

class CounterEventControl extends StatelessWidget {
  final IconData iconData;
  final void Function() onTap;

  const CounterEventControl({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData),
    );
  }
}
