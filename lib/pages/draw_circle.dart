import 'package:flutter/material.dart';

class DrawCircle extends StatelessWidget {
  const DrawCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制圆')),
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
    // 圆
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
