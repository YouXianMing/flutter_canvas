import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawWidgetStep1 extends StatefulWidget {
  const DrawWidgetStep1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DrawWidgetStep1State();
}

class DrawWidgetStep1State extends State<DrawWidgetStep1> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度控件(1)')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: DrawPainter(
              strokeColor: Colors.black.withOpacity(0.5),
              startAngle: -pi * 0.5,
              percent: Random().nextDouble(),
              strokeWidth: 5,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  final double strokeWidth;
  final Color strokeColor;
  final Color strokeBackgroundColor;
  final double startAngle;
  final double percent;
  final double fontSize;
  final Color textColor;

  DrawPainter({
    this.strokeWidth = 5,
    this.strokeColor = Colors.black,
    this.strokeBackgroundColor = Colors.grey,
    this.startAngle = 0,
    this.percent = 0,
    this.fontSize = 20,
    this.textColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double val = 0;
    if (percent <= 0) {
      val = 0;
    } else if (percent >= 1) {
      val = 1;
    } else {
      val = percent;
    }

    {
      var paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      // 背景stroke
      {
        Path path = Path();
        var rect = Rect.fromLTWH(paint.strokeWidth / 2, paint.strokeWidth / 2, size.width - paint.strokeWidth, size.height - paint.strokeWidth);
        path.addArc(rect, 0, pi * 2);
        canvas.drawPath(path, paint..color = strokeBackgroundColor);
      }

      // 进度stroke
      {
        Path path = Path();
        var rect = Rect.fromLTWH(paint.strokeWidth / 2, paint.strokeWidth / 2, size.width - paint.strokeWidth, size.height - paint.strokeWidth);
        path.addArc(rect, startAngle, val * 2 * pi);
        canvas.drawPath(path, paint..color = strokeColor);
      }
    }

    drawText(
      canvas,
      size,
      text: (val * 100).toInt().toString() + '%',
      offset: Offset(0, size.height / 2),
      fontSize: fontSize,
      color: textColor,
    );

    // // 测试用线条
    // {
    //   canvas.drawLine(
    //       Offset(size.width / 2, 0),
    //       Offset(size.width / 2, size.height),
    //       Paint()
    //         ..strokeWidth = 1
    //         ..style = PaintingStyle.stroke
    //         ..color = Colors.black.withOpacity(0.1));
    //
    //   canvas.drawLine(
    //       Offset(0, size.height / 2),
    //       Offset(size.width, size.height / 2),
    //       Paint()
    //         ..strokeWidth = 1
    //         ..style = PaintingStyle.stroke
    //         ..color = Colors.black.withOpacity(0.1));
    // }
  }

  // 绘制文本
  void drawText(
    Canvas canvas,
    Size size, {
    required String text,
    required Offset offset,
    required double fontSize,
    required Color color,
    double? fixWidth,
  }) {
    final textStyle = ui.TextStyle(color: color, fontSize: fontSize);
    final paragraphStyle = ui.ParagraphStyle(textDirection: TextDirection.ltr, textAlign: TextAlign.center);
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);
    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText(text);
    var constraints = ui.ParagraphConstraints(width: fixWidth ?? size.width);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);

    canvas.drawParagraph(paragraph, Offset(offset.dx, offset.dy - paragraph.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
