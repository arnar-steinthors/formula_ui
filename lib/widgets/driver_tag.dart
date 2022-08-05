import 'package:flutter/material.dart';

class DriverTag extends StatelessWidget {
  const DriverTag({Key? key, required this.text}) : super(key: key);

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(7.5),
        ),
      ),
      child: text,
    );
  }
}
