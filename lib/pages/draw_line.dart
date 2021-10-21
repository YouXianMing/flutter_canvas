import 'package:flutter/material.dart';

class DrawLine extends StatelessWidget {
  const DrawLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制线条')),
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
    // 线条1
    {
      var paint = Paint();
      paint.strokeWidth = 15; // 线条宽度
      paint.color = ([...Colors.primaries]..shuffle()).first; // 线条颜色
      Offset start = Offset(0, size.height / 2);
      Offset end = Offset(size.width, size.height / 2);
      canvas.drawLine(start, end, paint);
    }

    // 线条2
    {
      var paint = Paint();
      paint.strokeWidth = 20; // 线条宽度
      paint.strokeCap = StrokeCap.round; // 线条头部形状
      paint.color = ([...Colors.primaries]..shuffle()).first; // 线条颜色
      Offset start = Offset(size.width / 2, 0);
      Offset end = Offset(size.width / 2, size.height);
      canvas.drawLine(start, end, paint);
    }

    // 线条3
    {
      var paint = Paint();
      paint.strokeWidth = 20; // 线条宽度
      paint.blendMode = BlendMode.colorBurn; // 图像混合模式
      paint.color = ([...Colors.primaries]..shuffle()).first; // 线条颜色
      Offset start = const Offset(0, 0);
      Offset end = Offset(size.width, size.height);
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
