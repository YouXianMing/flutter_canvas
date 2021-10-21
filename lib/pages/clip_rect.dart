import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class ClipRectPage extends StatefulWidget {
  const ClipRectPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClipRectPageState();
}

class ClipRectPageState extends State<ClipRectPage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadUiImage();
  }

  void loadUiImage() async {
    // 获取图片数据
    ByteData data = await rootBundle.load('lib/images/Orion.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    image = frameInfo.image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('裁剪矩形区域')),
      body: ListView(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.1),
            child: CustomPaint(painter: Draw1Painter(image), size: const Size(400, 305)),
          ),
          Container(
            color: Colors.grey.withOpacity(0.1),
            child: CustomPaint(painter: Draw2Painter(image), size: const Size(400, 305)),
          ),
        ],
      ),
    );
  }
}

class Draw1Painter extends CustomPainter {
  final ui.Image? uiImage;

  Draw1Painter(this.uiImage);

  @override
  void paint(Canvas canvas, Size size) {
    if (uiImage != null) {
      var paint = Paint();
      paint.filterQuality = FilterQuality.low; // 图片填充质量
      canvas.drawImage(uiImage!, Offset.zero, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Draw2Painter extends CustomPainter {
  final ui.Image? uiImage;

  Draw2Painter(this.uiImage);

  @override
  void paint(Canvas canvas, Size size) {
    if (uiImage != null) {
      var paint = Paint();
      paint.filterQuality = FilterQuality.low; // 图片填充质量
      canvas.clipRect(Rect.fromLTWH(20, 20, size.width - 40, size.height - 40));
      canvas.drawImage(uiImage!, Offset.zero, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
