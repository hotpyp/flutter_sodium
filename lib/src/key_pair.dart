import 'dart:typed_data';
import 'package:meta/meta.dart' if (material.dart) 'package:flutter/foundation.dart';

/// Represents a secret key and a corresponding public key.
class KeyPair {
  final Uint8List pk, sk;

  const KeyPair({@required this.pk, @required this.sk});
}
