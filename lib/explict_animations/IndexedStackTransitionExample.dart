import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({Key? key}) : super(key: key);

  @override
  _IndexedStackTransitionExampleState createState() =>
      _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeScreen() {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IndexedStack Transition Example'),
        ),
        body: IndexedStack(
          index: _currentIndex,
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
                color: Colors.green,
                child: Image.asset("assets/dog.png"),
              ),
            ),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: Image.asset("assets/tom.png"),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeScreen,
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
