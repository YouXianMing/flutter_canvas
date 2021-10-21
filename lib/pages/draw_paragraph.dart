import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawParagraph extends StatelessWidget {
  const DrawParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制段落')),
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
    for (int i = 0; i < 5; i++) {
      // 新建一个段落建造器，然后将文字基本信息填入
      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          fontSize: 15.0 + i * 5,
        ),
      );
      paragraphBuilder.pushStyle(ui.TextStyle(color: Colors.black87));
      paragraphBuilder.addText('flutter绘制文本');
      // 设置文本的宽度约束
      ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: size.width);
      // 这里需要先layout,将宽度约束填入，否则无法绘制
      ui.Paragraph paragraph = paragraphBuilder.build()..layout(pc);
      // 文字左上角起始点
      Offset offset = Offset(0, i * 80.0);
      canvas.drawParagraph(paragraph, offset);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
