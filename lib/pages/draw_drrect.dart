import 'package:flutter/material.dart';

class DrawDRRect extends StatelessWidget {
  const DrawDRRect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制圆角矩形框')),
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
    // 圆角矩形
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawDRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(10, 10, size.width - 20, size.width - 20),
            topLeft: const Radius.circular(30), bottomLeft: const Radius.circular(30)),
        RRect.fromRectAndCorners(Rect.fromLTWH(30, 30, size.width - 60, size.width - 60),
            topLeft: const Radius.circular(15), bottomLeft: const Radius.circular(80)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
