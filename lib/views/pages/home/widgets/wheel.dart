import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

late double m;

class Wheel extends CustomPainter {
  var controller = Get.find<HomeController>();
  final double startAngle;
  final Size globalSize;
  Wheel(this.startAngle, this.globalSize);
  @override
  void paint(Canvas canvas, Size size) {
    m = (globalSize.width > globalSize.height) ? size.width : size.height;
    final center = Offset(size.width / 2, size.height / 2);
    controller.center = center;
    var startAngle = this.startAngle;
    drawArcs(canvas, controller, size, startAngle, center);
    drawCircle(canvas, center, size);
    drawArcs2(canvas, size, center);
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2, -tp.height / 2);

    tp.paint(canvas, pos);
    return tp.size;
  }

  void drawLabels(Canvas canvas, Offset c, double radius, double startAngle,
      double sweepAngle, String label, Size size) {
    double r = radius * 0.32;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final pos = c + Offset(dx, dy);
    drawTextCentered(
        canvas,
        pos,
        label,
        TextStyle(
            color: Colors.white,
            fontSize: m * (25 / 1848),
            fontWeight: FontWeight.bold),
        100);
  }

  void drawArcs(Canvas canvas, HomeController controller, Size size,
      double startAngle, Offset center) {
    // const grad = LinearGradient(
    //   colors: [Colors.black, Colors.orange, Colors.amber, Colors.yellow],
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    // );
    // final frect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    // final linePaint1 = Paint()
    //   ..shader = grad.createShader(frect)
    //   ..strokeWidth = 8;

    // for (var d in controller.data) {
    //   const sweepAngle = (1 / 6) * 360.0 * pi / 180.0;
    //   final paint = Paint()
    //     ..style = PaintingStyle.fill
    //     ..color = d.color;
    //   final radius = m / 1.8;
    //   final rect =
    //       Rect.fromCenter(center: center, width: radius, height: radius);
    //   canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
    //   final dx = radius / 2 * cos(startAngle);
    //   final dy = radius / 2 * sin(startAngle);
    //   final p2 = center + Offset(dx, dy);
    //   canvas.drawLine(center, p2, linePaint1);
    //   drawLabels(canvas, center, radius, startAngle, sweepAngle, d.name!, size);
    //   if (startAngle % (2 * pi) >= (4 / 6) * 360.0 * pi / 180.0 - 0.05 &&
    //       startAngle % (2 * pi) <= (5 / 6) * 360.0 * pi / 180.0 - 0.05) {
    //     controller.choosenTeam = d.name.toString();
    //   }
    //   startAngle += sweepAngle;
    // }
  }

  void drawCircle(Canvas canvas, Offset center, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.amber;
    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 16
      ..color = Colors.amber.shade800;

    const grad = LinearGradient(
      colors: [Colors.orange, Colors.amber, Colors.yellow],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final frect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final outlinePaint = Paint()
      ..shader = grad.createShader(frect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = Colors.yellow.shade800;

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..shader = ui.Gradient.radial(
        center,
        500,
        [
          Colors.amberAccent.shade400,
          Colors.yellow.shade700,
        ],
      )
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, m / 11, paint);
    canvas.drawCircle(center, m / 13, outlinePaint);
    canvas.drawCircle(center, m / 9.8, outlinePaint);
    canvas.drawCircle(center, m / 11, linePaint);
    canvas.drawCircle(center, m / 3.435, outlinePaint);
    canvas.drawCircle(center, m / 3.785, outlinePaint);
    canvas.drawCircle(center, m / 3.6, linePaint);
    canvas.drawCircle(center, m / 50, paint1);
  }

  void drawArcs2(Canvas canvas, Size size, Offset center) {
    final radius = m / 1.6;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = Colors.amber.shade600;
    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 8
      ..color = Colors.black45;
    final rect2 =
        Rect.fromCenter(center: center, width: radius, height: radius);
    canvas.drawArc(rect2, (4 / 6) * 360.0 * pi / 180.0,
        (1 / 6) * 360.0 * pi / 180.0, true, paint1);
    canvas.drawArc(rect2, (4 / 6) * 360.0 * pi / 180.0,
        (1 / 6) * 360.0 * pi / 180.0, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
