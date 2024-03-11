// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
    this.color,
  });

  final double? width;
  final double? height;
  final Color? color;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return DashedContainer(
      color: widget.color ?? Colors.black,
      height: widget.height ?? 100.0, // Default height if not provided
      width: widget.width ?? 100.0, // Default width if not provided
    );
  }
}

class DashedContainer extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  DashedContainer(
      {required this.color, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedRectPainter(color: color),
      child: Container(
        height: height,
        width: width,
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;

  _DashedRectPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    var dashWidth = 5.0;
    var dashSpace = 3.0;

    // Draw dashes along the top
    for (double x = 0.0; x < size.width; x += dashWidth + dashSpace) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
    }

    // Draw dashes along the right
    for (double y = 0.0; y < size.height; y += dashWidth + dashSpace) {
      canvas.drawLine(
          Offset(size.width, y), Offset(size.width, y + dashWidth), paint);
    }

    // Draw dashes along the bottom
    for (double x = 0.0; x < size.width; x += dashWidth + dashSpace) {
      canvas.drawLine(
          Offset(x, size.height), Offset(x + dashWidth, size.height), paint);
    }

    // Draw dashes along the left
    for (double y = 0.0; y < size.height; y += dashWidth + dashSpace) {
      canvas.drawLine(Offset(0, y), Offset(0, y + dashWidth), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
