import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool _isPressed = false;
  _toggleElevation() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Physical Model Example"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              _toggleElevation();
            },
            child: AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              elevation: _isPressed ? 60 : 0,
              color: Colors.grey,
              shadowColor: Colors.blueGrey,
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("assets/tom.png"),
              ),
            ),
          ),
        ));
  }
}
