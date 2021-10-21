import 'dart:ui';
import 'package:flutter/material.dart';

class DrawPoints extends StatelessWidget {
  const DrawPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制点')),
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
    List<Offset> points = [
      const Offset(30, 30),
      const Offset(180, 30),
      const Offset(100, 100),
      const Offset(100, 150),
      const Offset(50, 150),
      const Offset(50, 80),
    ];

    // 所有的点按给定顺序连成线
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      paint.strokeWidth = 20;
      paint.strokeCap = StrokeCap.round;
      canvas.drawPoints(PointMode.polygon, points, paint);
    }

    // 单独的点
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      paint.strokeWidth = 8;
      paint.strokeCap = StrokeCap.butt;
      canvas.drawPoints(PointMode.points, points, paint);
    }

    // 画一条线，起始点为给定数组的前两个点
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      paint.strokeWidth = 4;
      canvas.drawPoints(PointMode.lines, points, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
