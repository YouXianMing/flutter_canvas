import 'package:flutter/material.dart';

class DrawRect extends StatelessWidget {
  const DrawRect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制矩形')),
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
    // 矩形1
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawRect(Rect.fromLTWH(10, 10, size.width / 2 - 20, size.height - 20), paint);
    }

    // 矩形2
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawRect(Rect.fromLTWH(10 + size.width / 2, 10, size.width / 2 - 20, size.height - 20), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
