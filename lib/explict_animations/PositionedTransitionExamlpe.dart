import 'package:flutter/material.dart';

class PositionedTransitionExamlpe extends StatefulWidget {
  const PositionedTransitionExamlpe({super.key});

  @override
  State<PositionedTransitionExamlpe> createState() =>
      _PositionedTransitionExamlpeState();
}

class _PositionedTransitionExamlpeState
    extends State<PositionedTransitionExamlpe>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _jerryAnimation;
  late Animation<RelativeRect> _tomAnimation;
  late Animation<RelativeRect> _spikeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _jerryAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(250, 250, 0, 0))
        .animate(_controller);

    _tomAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(150, 150, 0, 0))
        .animate(_controller);

    _spikeAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(50, 50, 0, 0))
        .animate(_controller);
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void _reverseAnimation() {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Positioned Transition Examlpe"),
        ),
        body: Stack(
          children: [
            PositionedTransition(
                rect: _spikeAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                  child: Image.asset("assets/dog.png"),
                )),
            PositionedTransition(
                rect: _tomAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Image.asset("assets/tom.png"),
                )),
            PositionedTransition(
                rect: _jerryAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                  child: Image.asset("assets/jerry.png"),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: _startAnimation,
                      child: const Icon(Icons.start)),
                  ElevatedButton(
                      onPressed: _reverseAnimation,
                      child: const Icon(Icons.close))
                ],
              ),
            )
          ],
        ));
  }
}
