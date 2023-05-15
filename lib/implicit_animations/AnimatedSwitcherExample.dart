import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isFirstWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Switcher Example"),
      ),
      body: Center(
          child: AnimatedSwitcher(
              switchInCurve: Curves.bounceInOut,
              switchOutCurve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: _isFirstWidgetVisible
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isFirstWidgetVisible = !_isFirstWidgetVisible;
                        });
                      },
                      child: const Text("Login Now!"))
                  : const CircularProgressIndicator())),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.switch_account),
          onPressed: () {
            setState(() {
              _isFirstWidgetVisible = !_isFirstWidgetVisible;
            });
          }),
    );
  }
}
