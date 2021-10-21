import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class DrawImageRect extends StatefulWidget {
  const DrawImageRect({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DrawImageRectState();
}

class DrawImageRectState extends State<DrawImageRect> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadUiImage();
  }

  void loadUiImage() async {
    // 获取图片数据
    ByteData data = await rootBundle.load('lib/images/Checkpoint.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    image = frameInfo.image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('截取图片进行填充')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey.withOpacity(0.1),
          child: CustomPaint(painter: DrawPainter(image)),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  final ui.Image? uiImage;

  DrawPainter(this.uiImage);

  @override
  void paint(Canvas canvas, Size size) {
    if (uiImage != null) {
      var paint = Paint();
      paint.filterQuality = FilterQuality.low; // 图片填充质量
      canvas.drawImageRect(
        uiImage!,
        Rect.fromLTWH(0, 0, uiImage!.width.toDouble() / 2, uiImage!.height.toDouble()), // 截取uiImage的rect
        Rect.fromLTWH(0, 0, size.width.toDouble(), size.height.toDouble()), // 填充的rect
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
