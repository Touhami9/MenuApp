// Painter pour les blobs
import 'package:flutter/material.dart';

class BlobPainter extends CustomPainter {
  final Color color;
  BlobPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.cubicTo(size.width * 0.9, 0, size.width, size.height * 0.4,
        size.width * 0.8, size.height * 0.6);
    path.cubicTo(size.width * 0.6, size.height * 0.9, size.width * 0.2,
        size.height * 0.8, size.width * 0.1, size.height * 0.5);
    path.cubicTo(
        0, size.height * 0.3, size.width * 0.1, 0, size.width * 0.5, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}