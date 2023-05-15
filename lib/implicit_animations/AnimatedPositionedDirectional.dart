import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedPositionedDirectionalExample extends StatefulWidget {
  const AnimatedPositionedDirectionalExample({super.key});

  @override
  State<AnimatedPositionedDirectionalExample> createState() =>
      _AnimatedPositionedDirectionalExampleState();
}

class _AnimatedPositionedDirectionalExampleState
    extends State<AnimatedPositionedDirectionalExample> {
  double _srart = 0;
  double _top = 0;

  void _moveLeft() {
    setState(() {
      _srart -= 50;
      if (_srart < 0) {
        _srart = 0;
      }
    });
  }

  void _moveRight() {
    setState(() {
      _srart += 50;
      if (_srart > MediaQuery.of(context).size.width - 120) {
        _srart = MediaQuery.of(context).size.width - 120;
      }
    });
  }

  void _moveUp() {
    setState(() {
      _top -= 50;
      if (_top < 0) {
        _top = 0;
      }
    });
  }

  void _moveDown() {
    setState(() {
      _top += 50;
      if (_top > MediaQuery.of(context).size.height - 320) {
        _top = MediaQuery.of(context).size.height - 320;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned Directional Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
                start: _srart,
                top: _top,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Image.asset("assets/jerry.png"),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: _moveLeft,
                      child: const Icon(Icons.arrow_circle_left_outlined)),
                  ElevatedButton(
                      onPressed: _moveRight,
                      child: const Icon(Icons.arrow_circle_right_outlined)),
                  ElevatedButton(
                      onPressed: _moveUp,
                      child: const Icon(Icons.arrow_circle_up)),
                  ElevatedButton(
                      onPressed: _moveDown,
                      child: const Icon(Icons.arrow_circle_down))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
