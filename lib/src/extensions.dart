import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'sodium_exception.dart';

extension Uint8Pointer on Pointer<Uint8> {
  Uint8List toList(int length) {
    final builder = BytesBuilder();
    for (var i = 0; i < length; i++) {
      builder.addByte(this[i]);
    }
    return builder.takeBytes();
  }
}

extension Uint8ListExtensions on Uint8List {
  Pointer<Uint8> toPointer() {
    var p = allocate<Uint8>(count: this.length);
    p.asTypedList(this.length).setAll(0, this);
    return p;
  }
}

extension Result on int {
  void requireSuccess() {
    if (this != 0) {
      throw SodiumException('Failed ($this)');
    }
  }
}
