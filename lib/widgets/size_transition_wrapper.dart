import 'package:flutter/material.dart';

class SizeTransitionWrapper extends StatefulWidget {
  const SizeTransitionWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<SizeTransitionWrapper> createState() => _SizeTransitionWrapperState();
}

class _SizeTransitionWrapperState extends State<SizeTransitionWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.value = 1;
    _runAnimation();
    super.initState();
  }

  void _runAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
