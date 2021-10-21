import 'package:flutter/material.dart';

class DrawRRect extends StatelessWidget {
  const DrawRRect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制圆角矩形')),
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
    // 圆角矩形1
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawRRect(RRect.fromLTRBAndCorners(10, 10, size.width / 2 - 10, size.height - 10, topLeft: const Radius.circular(30)), paint);
    }

    // 圆角矩形2
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(10 + size.width / 2, 10, size.width / 2 - 20, size.height - 20), const Radius.circular(10)),
        paint,
      );


    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
