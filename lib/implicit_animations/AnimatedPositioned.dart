import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _startEating = true;

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is initialized
    _startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    // Create a periodic timer that executes a function every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // Function to be executed every 5 seconds
      setState(() {
        _startEating = !_startEating;
      });
      print("Timer executed!");
      // Call any other functions or perform any actions here
    });
  }

  void _cancelTimer() {
    // Cancel the timer if it's active
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositioned(
                top: 0,
                left: 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/cheese.png"),
                )),
            AnimatedPositioned(
                top: 0,
                left:
                    _startEating ? MediaQuery.of(context).size.width - 150 : 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/jerry.png"),
                )),
            AnimatedPositioned(
                top: _startEating ? MediaQuery.of(context).size.width / 2 : 0,
                left: _startEating ? MediaQuery.of(context).size.width / 2 : 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/dog.png"),
                )),
            AnimatedPositioned(
                top:
                    _startEating ? MediaQuery.of(context).size.height - 300 : 0,
                left: 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/tom.png"),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _startEating = !_startEating;
          });
        },
        child: _startEating ? Icon(Icons.place) : Icon(Icons.back_hand),
      ),
    );
  }
}
