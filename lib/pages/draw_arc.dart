import 'dart:math';

import 'package:flutter/material.dart';

class DrawArc extends StatelessWidget {
  const DrawArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制扇形')),
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
    // drawArc(Rect rect => 区域, double startAngle  => 开始角度, double sweepAngle => 结束角度, bool useCenter => 是否使用中心点, Paint paint)

    // 扇形1
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawArc(const Rect.fromLTWH(0, 0, 100, 100), 0, pi * 2, true, paint);
    }

    // 扇形2
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawArc(const Rect.fromLTWH(100, 0, 100, 100), 0, pi * 0.8, true, paint);
    }

    // 扇形3
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawArc(const Rect.fromLTWH(0, 100 + 20, 100, 60), 0, pi * 2, true, paint);
    }

    // 扇形4
    {
      var paint = Paint();
      paint.color = ([...Colors.primaries]..shuffle()).first; // 颜色
      canvas.drawArc(const Rect.fromLTWH(100, 100 + 20, 100, 60), 0, pi * 0.8, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
