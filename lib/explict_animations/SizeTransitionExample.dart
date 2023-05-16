import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});

  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
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
          title: const Text("Size Transition Example"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: _startAnimation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: SizeTransition(
                    sizeFactor: _animation,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.yellow,
                      child: Image.asset("assets/dog.png"),
                    )),
              ),
            ),
          ),
        ));
  }
}
