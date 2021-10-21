import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawWidgetStep2 extends StatefulWidget {
  const DrawWidgetStep2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DrawWidgetStep2State();
}

class DrawWidgetStep2State extends State<DrawWidgetStep2> with TickerProviderStateMixin {
  late Timer timer;
  AnimationController? controller;
  late Animation<double> strokePercentAnimation;
  late Animation<double> labelPercentAnimation;
  late Animation<Color?> strokeColorAnimation;

  late double beginPercentValue;
  late double endPercentValue;

  late Color beginColor;
  late Color endColor;

  @override
  void initState() {
    super.initState();

    // 设置初始值结束值
    beginPercentValue = 0;
    endPercentValue = 0;
    beginColor = Colors.black;
    endColor = ([...Colors.primaries]..shuffle()).first;

    // 动画控制器初始化
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    // 添加监听
    controller?.addListener(() => setState(() {}));

    // 开始执行动画
    startAnimation();

    // 设置定时器
    timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      startAnimation();
    });
  }

  void startAnimation() {
    // 进度条动画
    strokePercentAnimation =
        Tween<double>(begin: beginPercentValue, end: endPercentValue).animate(CurvedAnimation(parent: controller!, curve: Curves.elasticOut));

    // text动画
    labelPercentAnimation =
        Tween<double>(begin: beginPercentValue, end: endPercentValue).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOutCubic));

    // 进度条颜色动画
    strokeColorAnimation = ColorTween(begin: beginColor, end: endColor).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOutCubic));

    beginPercentValue = endPercentValue;
    endPercentValue = Random().nextDouble();

    beginColor = endColor;
    endColor = ([...Colors.primaries]..shuffle()).first;

    controller?.forward(from: 0);
  }

  @override
  void dispose() {
    controller?.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度控件(2)')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: DrawPainter(
              strokeBackgroundColor: Colors.grey.withOpacity(0.1),
              strokeColor: strokeColorAnimation.value!,
              startAngle: -pi * 0.5,
              percent: strokePercentAnimation.value,
              percentLabel: (labelPercentAnimation.value * 100).toInt().toString() + '%',
              strokeWidth: 5 + strokePercentAnimation.value * 40,
              fontSize: 20 + labelPercentAnimation.value * 10,
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
  final String? percentLabel;

  DrawPainter({
    this.strokeWidth = 5,
    this.strokeColor = Colors.black,
    this.strokeBackgroundColor = Colors.grey,
    this.startAngle = 0,
    this.percent = 0,
    this.fontSize = 20,
    this.textColor = Colors.black,
    this.percentLabel,
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
      text: percentLabel ?? (val * 100).toInt().toString(),
      offset: Offset(0, size.height / 2),
      fontSize: fontSize,
      color: textColor,
    );
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
