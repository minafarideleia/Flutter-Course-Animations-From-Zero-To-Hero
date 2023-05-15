import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedPAddingExample extends StatefulWidget {
  const AnimatedPAddingExample({super.key});

  @override
  State<AnimatedPAddingExample> createState() => _AnimatedPAddingExampleState();
}

class _AnimatedPAddingExampleState extends State<AnimatedPAddingExample> {
  List<String> characters = ["tom", "jerry", "cheese", "dog"];
  double _paddingValue = 10.0;
  bool _isExpaned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated PAdding Example"),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return AnimatedPadding(
              padding: EdgeInsets.all(_paddingValue),
              duration: const Duration(milliseconds: 400),
              curve: Curves.decelerate,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Image.asset("assets/${characters[index]}.png"),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(_isExpaned ? Icons.expand : Icons.expand_less),
          onPressed: () {
            setState(() {
              _isExpaned = !_isExpaned;
              _paddingValue = _isExpaned ? 30.0 : 10.0;
            });
          }),
    );
  }
}
