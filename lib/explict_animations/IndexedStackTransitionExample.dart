import 'dart:async';

import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({super.key});

  @override
  State<IndexedStackTransitionExample> createState() =>
      _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  late Timer _timer;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    // Create a periodic timer that executes a function every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      // Function to be executed every 5 seconds
      _goToNextScreen();
      // Call any other functions or perform any actions here
    });
  }

  void _cancelTimer() {
    // Cancel the timer if it's active
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
  }

//[[[[]]]]
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(_controller);

    _controller.forward();
    _startTimer();
  }

  void _goToNextScreen() {
    _currentIndex = _currentIndex + 1;
    if (_currentIndex == 3) {
      _currentIndex = 0;
    }
    setState(() {
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indexed Stack Transition Example"),
      ),
      body: IndexedStack(
        index: _currentIndex, // 0,1,2
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Image.asset("assets/jerry.png"),
              ),
            ),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Image.asset("assets/dog.png"),
            ),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: Image.asset("assets/tom.png"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNextScreen,
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
