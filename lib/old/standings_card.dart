import 'package:flutter/material.dart';

class StandingsCardOld extends StatelessWidget {
  const StandingsCardOld({
    Key? key,
    required this.image,
    required this.text,
    this.right = -50,
    this.left = 50,
  }) : super(key: key);

  final Widget image;
  final Widget text;
  final double right;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: 0,
            bottom: 0,
            right: right,
            left: left,
            child: image,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: text,
          ),
        ],
      ),
    );
  }
}
