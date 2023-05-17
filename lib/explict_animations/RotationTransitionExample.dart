import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));

    _animation = Tween<double>(begin: 0, end: 7.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rotation Transition Example"),
        ),
        body: Center(
          child: RotationTransition(
            turns: _animation,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Image.asset("assets/dog.png"),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _startAnimation,
          child: const Icon(Icons.play_arrow),
        ));
  }
}
