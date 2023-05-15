import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                child: const Text(
                  "Tom and Terry",
                  style: TextStyle(fontSize: 44.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                    child: Image.asset("assets/jerry.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2500),
                curve: Curves.easeInCirc,
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                    child: Image.asset("assets/tom.png")),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          }),
    );
  }
}
