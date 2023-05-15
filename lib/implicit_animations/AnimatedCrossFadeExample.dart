import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirstWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Cross Fade Example"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isFirstWidgetVisible = !_isFirstWidgetVisible;
              });
            },
            child: AnimatedCrossFade(
              firstCurve: Curves.linear,
              secondCurve: Curves.linear,
              duration: const Duration(milliseconds: 1000),
              firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.blueGrey,
                child: Center(
                  child: Image.asset("assets/dog.png"),
                ),
              ),
              secondChild: Container(
                height: 200,
                width: 200,
                color: Colors.blueGrey,
                child: Center(
                  child: Image.asset("assets/jerry.png"),
                ),
              ),
              crossFadeState: _isFirstWidgetVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ));
  }
}
