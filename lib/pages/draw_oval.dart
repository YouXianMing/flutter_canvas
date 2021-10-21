import 'package:flutter/material.dart';

class DrawOval extends StatelessWidget {
  const DrawOval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制椭圆')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey.withOpacity(0.1),
          child: CustomPaint(painter: DrawPainter()),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 椭圆
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawOval(Rect.fromLTWH(0, 30, size.width, size.height - 60), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
