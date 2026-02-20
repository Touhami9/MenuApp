  // Méthode pour créer un blob animé
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:menuapp/models/bbpainter_model.dart';

Widget buildBlob({
  required AnimationController controller,
  double? top,
  double? left,
  double? bottom,
  double? right,
  required Color color,
}) {
  return Positioned(
    top: top,
    left: left,
    bottom: bottom,
    right: right,
    child: AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            20 * sin(controller.value * pi),
            20 * cos(controller.value * pi),
          ),
          child: CustomPaint(
            size: const Size(300, 300),
            painter: BlobPainter(color: color),
          ),
        );
      },
    ),
  );
}
