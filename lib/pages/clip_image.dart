import 'package:flutter/material.dart';

class ClipImage extends StatelessWidget {
  const ClipImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图片根据给定的path裁剪')),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          width: 350,
          height: 350,
          child: CustomPaint(
            foregroundPainter: DrawPainter(),
            // willChange: true,
            isComplex: true,
            child: Image.asset('lib/images/Orion.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.width / 2);
    path.cubicTo(size.width / 2, size.height / 2 + 150, size.width / 2, size.height / 2 - 150, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.clipPath(path);
    Paint paint = Paint();
    paint.blendMode = BlendMode.clear;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
