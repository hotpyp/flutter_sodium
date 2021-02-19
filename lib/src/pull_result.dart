import 'dart:typed_data';
import 'package:meta/meta.dart' if (material.dart) 'package:flutter/foundation.dart';

class PullResult {
  final Uint8List m;
  final int tag;

  const PullResult({@required this.m, @required this.tag});
}
