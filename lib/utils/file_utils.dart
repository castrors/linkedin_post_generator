import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List> captureBytesFromWidget(GlobalKey key) async {
  final boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  final image = await boundary!.toImage();
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  return pngBytes;
}
