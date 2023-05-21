import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSilderExample extends StatefulWidget {
  const LottieSilderExample({super.key});

  @override
  State<LottieSilderExample> createState() => _LottieSilderExampleState();
}

class _LottieSilderExampleState extends State<LottieSilderExample> {
  final List<String> _animationPaths = [
    'assets/lottie/tigger.json',
    'assets/lottie/bird.json',
    'assets/lottie/car.json'
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _stopAnimation();
    super.dispose();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (_currentPage == _animationPaths.length - 1) {
        // reset to the first page when the last page is reached
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      }
      _startAnimation();
    });
  }

  void _stopAnimation() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Silder Example"),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: _animationPaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: Lottie.asset(_animationPaths[index],
                  repeat: true, reverse: false));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (int page) {
            _pageController.animateToPage(page,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.animation_outlined), label: "Animation 1"),
            BottomNavigationBarItem(
                icon: Icon(Icons.brightness_medium), label: "Animation 2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental), label: "Animation 3")
          ]),
    );
  }
}
