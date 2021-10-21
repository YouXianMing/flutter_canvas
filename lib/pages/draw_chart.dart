import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class DrawChart extends StatelessWidget {
  const DrawChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制表格')),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: CustomPaint(painter: DrawPainter()),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制外边框
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.grey.withOpacity(0.1));

    // 绘制线条
    double offset = 80;
    for (int i = 0; i < 4; i++) {
      drawVerticalLine(canvas, size, offsetX: offset, color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
      drawHorizontalLine(canvas, size, offsetY: offset, color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
      offset += 80;
    }

    for (int i = 0; i < 5; i++) {
      // 随机高度
      var height = Random().nextInt(size.height.toInt()).toDouble();
      // 随机颜色
      var color = ([...Colors.primaries]..shuffle()).first;
      // 矩形框fill模式
      canvas.drawRect(
          transformRect(size, index: i, height: height),
          Paint()
            ..style = PaintingStyle.fill
            ..strokeWidth = 1
            ..color = color.withOpacity(0.2));

      // 矩形框stroke模式
      canvas.drawRect(
          transformRect(size, index: i, height: height),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = color.withOpacity(0.2));

      // 绘制文本
      drawText(canvas, size,
          text: height.toInt().toString(), fontSize: 18, fixWidth: 40, offset: Offset(20 + i * 80, size.height - height - 25), color: color);
    }

    // 绘制底部线条
    drawHorizontalLine(canvas, size, offsetY: size.height, color: Colors.grey, strokeWidth: 2);
  }

  Rect transformRect(Size size, {required int index, required double height}) {
    return Rect.fromLTWH(20 + index * 80, size.height - height, 40, height);
  }

  // 绘制文本
  void drawText(Canvas canvas, Size size,
      {required String text, required Offset offset, double fontSize = 20, double? fixWidth, Color color = Colors.black}) {
    final textStyle = ui.TextStyle(color: color, fontSize: fontSize);
    final paragraphStyle = ui.ParagraphStyle(textDirection: TextDirection.ltr, textAlign: TextAlign.center);
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);
    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText(text);
    var constraints = ui.ParagraphConstraints(width: fixWidth ?? size.width);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    canvas.drawParagraph(paragraph, offset);
  }

  // 水平方向实线绘制
  void drawHorizontalLine(Canvas canvas, Size size, {required double offsetY, required Color color, required double strokeWidth}) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    canvas.drawLine(Offset(0, offsetY), Offset(size.width, offsetY), paint);
  }

  // 垂直方向实线绘制
  void drawVerticalLine(Canvas canvas, Size size, {required double offsetX, required Color color, required double strokeWidth}) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    canvas.drawLine(Offset(offsetX, 0), Offset(offsetX, size.height), paint);
  }

  // 水平方向虚线绘制
  void drawHorizontalDashedLine(Canvas canvas, Size size,
      {required double offsetY, required Color color, required double strokeWidth, double lineWidth = 5, double gap = 5}) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    double offsetX = 0;
    while (offsetX + gap + lineWidth <= size.width) {
      canvas.drawLine(Offset(offsetX, offsetY), Offset(offsetX + lineWidth, offsetY), paint);
      offsetX += lineWidth + gap;
    }
  }

  // 垂直方向虚线绘制
  void drawVerticalDashedLine(Canvas canvas, Size size,
      {required double offsetX, required Color color, required double strokeWidth, double lineWidth = 5, double gap = 5}) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    double offsetY = 0;
    while (offsetY + gap + lineWidth <= size.height) {
      canvas.drawLine(Offset(offsetX, offsetY), Offset(offsetX, offsetY + lineWidth), paint);
      offsetY += lineWidth + gap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
