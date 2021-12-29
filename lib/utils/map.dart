import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> createCustomMarkerBitmap(String name) async {
  PictureRecorder recorder = PictureRecorder();
  final c = Canvas(recorder);
  final paint1 = Paint()
    ..color = Colors.black45
    ..style = PaintingStyle.fill;

  final icon = Icons.directions_bus_filled_rounded;
  TextPainter textPainter = TextPainter(
    text: TextSpan(
        text: name,
        style: const TextStyle(color: Colors.white, fontSize: 60, shadows: [])),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  c.drawRect(
      const Offset(0, 0) & Size(textPainter.width, textPainter.height), paint1);
  textPainter.paint(c, const Offset(0, 0));
  TextPainter iconPainter = TextPainter(
    text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            color: Colors.red, fontSize: 120, fontFamily: icon.fontFamily)),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  iconPainter.layout();
  iconPainter.paint(
      c,
      Offset((textPainter.width / 2) - (iconPainter.width / 2),
          textPainter.height + 5));

  final p = recorder.endRecording();
  ByteData? pngBytes = await (await p.toImage(textPainter.width.toInt(),
          (textPainter.height + iconPainter.height).toInt()))
      .toByteData(format: ImageByteFormat.png);
  if (pngBytes != null) {
    final data = Uint8List.view(pngBytes.buffer);
    return BitmapDescriptor.fromBytes(data);
  }
  throw Exception();
}
