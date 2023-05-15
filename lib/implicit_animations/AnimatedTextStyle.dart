import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedTextSizeExample extends StatefulWidget {
  const AnimatedTextSizeExample({super.key});

  @override
  State<AnimatedTextSizeExample> createState() =>
      _AnimatedTextSizeExampleState();
}

class _AnimatedTextSizeExampleState extends State<AnimatedTextSizeExample> {
  double _fontSize = 30.0;
  Color _color = Colors.grey;

  _doAnimation() {
    setState(() {
      _fontSize = 50.0;
      _color = Colors.orange;
    });
  }

  _resetAnimation() {
    setState(() {
      _fontSize = 30.0;
      _color = Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Default TextStyle Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
              style: TextStyle(fontSize: _fontSize, color: _color),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceIn,
              child: const Text("Hello Every One")),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: _doAnimation, icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: _resetAnimation, icon: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
