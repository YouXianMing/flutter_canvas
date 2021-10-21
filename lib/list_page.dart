import 'package:flutter_canvas/pages/clip_image.dart';
import 'package:flutter_canvas/pages/clip_rect.dart';
import 'package:flutter_canvas/pages/draw_arc.dart';
import 'package:flutter_canvas/pages/draw_chart.dart';
import 'package:flutter_canvas/pages/draw_circle.dart';
import 'package:flutter_canvas/pages/draw_drrect.dart';
import 'package:flutter_canvas/pages/draw_image.dart';
import 'package:flutter_canvas/pages/draw_image_rect.dart';
import 'package:flutter_canvas/pages/draw_line.dart';
import 'package:flutter_canvas/pages/draw_oval.dart';
import 'package:flutter_canvas/pages/draw_paragraph.dart';
import 'package:flutter_canvas/pages/draw_path.dart';
import 'package:flutter_canvas/pages/draw_points.dart';
import 'package:flutter_canvas/pages/draw_raw_points.dart';
import 'package:flutter_canvas/pages/draw_rect.dart';
import 'package:flutter_canvas/pages/draw_rrect.dart';
import 'package:flutter_canvas/pages/draw_shadow.dart';
import 'package:flutter_canvas/pages/draw_widget_step_1.dart';
import 'package:flutter_canvas/pages/draw_widget_step_2.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Canvas绘图')),
      body: ListView(
        children: [
          listRowItem(
            title: '绘制表格',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawChart())),
          ),
          listRowItem(
            title: '图片根据给定的path裁剪',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ClipImage())),
          ),
          listRowItem(
            title: '进度控件(1)',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawWidgetStep1())),
          ),
          listRowItem(
            title: '进度控件(2)',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawWidgetStep2())),
          ),
          listRowItem(
            title: 'drawLine - 绘制线条',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawLine())),
          ),
          listRowItem(
            title: 'drawRect - 绘制矩形',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawRect())),
          ),
          listRowItem(
            title: 'drawRRect - 绘制圆角矩形',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawRRect())),
          ),
          listRowItem(
            title: 'drawDRRect - 绘制圆角矩形框',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawDRRect())),
          ),
          listRowItem(
            title: 'drawCircle - 绘制圆',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawCircle())),
          ),
          listRowItem(
            title: 'drawOval - 绘制椭圆',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawOval())),
          ),
          listRowItem(
            title: 'drawArc - 绘制扇形',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawArc())),
          ),
          listRowItem(
            title: 'drawImage - 绘制image',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawImage())),
          ),
          listRowItem(
            title: 'drawImageRect - 截取图片进行填充',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawImageRect())),
          ),
          listRowItem(
            title: 'drawPoints - 绘制点',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawPoints())),
          ),
          listRowItem(
            title: 'drawRawPoints - 绘制点',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawRawPoints())),
          ),
          listRowItem(
            title: 'drawPath - 绘制路径',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawPath())),
          ),
          listRowItem(
            title: 'drawParagraph - 绘制段落',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawParagraph())),
          ),
          listRowItem(
            title: 'drawShadow - 绘制阴影',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DrawShadow())),
          ),
          listRowItem(
            title: 'clipRect - 裁剪矩形区域',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ClipRectPage())),
          ),
        ],
      ),
    );
  }

  Widget listRowItem({required String title, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        color: Colors.white,
        child: Text(title),
      ),
    );
  }
}
