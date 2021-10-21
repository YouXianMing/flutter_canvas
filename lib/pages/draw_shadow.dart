import 'package:flutter/material.dart';

class DrawShadow extends StatelessWidget {
  const DrawShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制阴影')),
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
    {
      var path = Path();
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.close();
      canvas.drawShadow(path, ([...Colors.primaries]..shuffle()).first, 5, false);
    }

    {
      var path = Path();
      path.moveTo(0, size.height);
      path.lineTo(0, size.height - 100);
      path.lineTo(100, size.height);
      path.close();
      canvas.drawShadow(path, ([...Colors.primaries]..shuffle()).first, 5, true);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
