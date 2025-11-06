import 'dart:math' as math;
import 'package:flutter/material.dart';

class PlantHealthGauge extends StatelessWidget {
  const PlantHealthGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 220,
      child: CustomPaint(
        painter: _GaugePainter(),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.9);
    final radius = size.width / 2 * 0.9;
    const strokeWidth = 18.0;

    final fullArcPaint = Paint()
      ..color = const Color(0xFFE6E8E2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final goodHealthPaint = Paint()
      ..color = const Color(0xFF9AB291)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final mediumHealthPaint = Paint()
      ..color = const Color(0xFFD49A6A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Start angle
      math.pi, // Sweep angle (180 degrees)
      false,
      fullArcPaint,
    );

    // Draw medium health arc (e.g., 25% of the gauge)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Start on the left
      math.pi * 0.25, // Sweep for 25%
      false,
      mediumHealthPaint,
    );

    // Draw good health arc (e.g., from 25% to 85%)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 1.25, // Start after the medium part
      math.pi * 0.60, // Sweep for 60%
      false,
      goodHealthPaint,
    );
    
    // --- Draw labels ---
    _drawLabel(canvas, 'Bonne santé',  Offset(size.width * 0.65, size.height * 0.5), const Color(0xFFEAF1E7));
    _drawLabel(canvas, 'État moyen',  Offset(size.width * 0.2, size.height * 0.7), const Color(0xFFF8EFE7));

  }

  void _drawLabel(Canvas canvas, String text, Offset offset, Color bgColor) {
      final textSpan = TextSpan(
        text: text,
        style: const TextStyle(color: Color(0xFF384A37), fontWeight: FontWeight.w600, fontSize: 12),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(center: offset, width: textPainter.width + 16, height: textPainter.height + 8),
        const Radius.circular(12),
      );
      
      final bgPaint = Paint()..color = bgColor;
      canvas.drawRRect(rect, bgPaint);
      textPainter.paint(canvas, offset - Offset(textPainter.width / 2, textPainter.height / 2));
    }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
