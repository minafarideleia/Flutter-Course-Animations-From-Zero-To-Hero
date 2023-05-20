import 'package:flutter/material.dart';

class CustomePainterExmaple extends StatefulWidget {
  const CustomePainterExmaple({super.key});

  @override
  State<CustomePainterExmaple> createState() => _CustomePainterExmapleState();
}

class _CustomePainterExmapleState extends State<CustomePainterExmaple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.repeat(reverse: true);
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
          title: const Text("Custome Painter Exmaple"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: CirclePainter(
                    _sizeAnimation.value,
                    _colorAnimation.value ??
                        Colors.red), // add cutsome painter here
                size: const Size.square(200),
              );
            },
          ),
        ));
  }
}

class CirclePainter extends CustomPainter {
  final double _size;
  final Color _color;

  CirclePainter(this._size, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _size, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return (_size != oldDelegate._size || _color != oldDelegate._color);
  }
}
