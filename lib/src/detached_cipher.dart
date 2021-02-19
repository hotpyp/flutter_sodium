import 'dart:typed_data';
import 'package:meta/meta.dart' if (material.dart) 'package:flutter/foundation.dart';

/// Detached cipher and associated authentication tag.
class DetachedCipher {
  final Uint8List c, mac;

  const DetachedCipher({@required this.c, @required this.mac});
}
