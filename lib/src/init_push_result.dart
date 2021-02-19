import 'dart:ffi';
import 'dart:typed_data';
import 'package:meta/meta.dart' if (material.dart) 'package:flutter/foundation.dart';

class InitPushResult {
  final Pointer<Uint8> state;
  final Uint8List header;

  const InitPushResult({@required this.state, @required this.header});
}
