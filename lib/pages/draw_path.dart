import 'package:flutter/material.dart';

class DrawPath extends StatelessWidget {
  const DrawPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制路径')),
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
    // 将svg图片转换为path
    // https://www.flutterclutter.dev/tools/svg-to-flutter-path-converter/
    Paint paint = Paint();
    Path path = Path();

    // Path number 1
    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    canvas.drawPath(path, paint);

    // Path number 2
    paint.color = const Color(0xffff5252).withOpacity(1);
    path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(size.width * 0.09, size.height * 0.93, size.width * 0.11, size.height * 0.78, size.width * 0.11, size.height * 0.66);
    path.cubicTo(size.width * 0.11, size.height * 0.49, size.width * 0.16, size.height * 0.37, size.width / 4, size.height * 0.28);
    path.cubicTo(size.width * 0.36, size.height * 0.23, size.width * 0.54, size.height * 0.18, size.width * 0.68, size.height * 0.16);
    path.cubicTo(size.width * 0.81, size.height * 0.13, size.width * 0.89, size.height * 0.07, size.width * 0.98, 0);
    path.cubicTo(size.width * 0.94, 0, size.width * 0.86, 0, size.width * 0.84, 0);
    path.cubicTo(size.width * 0.56, 0, size.width * 0.28, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);

    // Path number 3
    paint.color = const Color(0xffffab40).withOpacity(1);
    path = Path();
    path.lineTo(size.width, size.height / 5);
    path.cubicTo(size.width, size.height / 5, size.width * 0.94, size.height * 0.88, size.width * 0.65, size.height * 0.93);
    path.cubicTo(size.width * 0.36, size.height * 0.97, size.width / 5, size.height, size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height / 5, size.width, size.height / 5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
