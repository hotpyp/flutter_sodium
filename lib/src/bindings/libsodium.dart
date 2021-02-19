import 'dart:ffi';
import 'dart:io';

import 'package:flutter_sodium/flutter_sodium.dart';
final android_path = 'libsodium.so';
final mac_os_path = '/usr/local/lib/libsodium.dylib';

final libsodium = _load();

DynamicLibrary _load() {
  if (Platform.isAndroid) {
    print(android_path);
    return DynamicLibrary.open(android_path);
  }
  if (Platform.isIOS) {
    print('getting path from DynamicLibrary.process()...');
    DynamicLibrary _lib = DynamicLibrary.process();
    print(_lib);
    return _lib;
  }
  if (Platform.isMacOS) {
    // assuming user installed libsodium as per the installation instructions
    // see also https://libsodium.gitbook.io/doc/installation
    print(mac_os_path);
    return DynamicLibrary.open(mac_os_path);
  }
  if (Platform.isLinux) {
    // assuming user installed libsodium as per the installation instructions
    // see also https://libsodium.gitbook.io/doc/installation
    return DynamicLibrary.open('/usr/local/lib/libsodium.so');
  }
  if (Platform.isWindows) {
    // assuming user installed libsodium as per the installation instructions
    // see also https://py-ipv8.readthedocs.io/en/latest/preliminaries/install_libsodium/
    return DynamicLibrary.open('C:\\Windows\\System32\\libsodium.dll');
  }
  throw SodiumException('platform not supported');
}

// Extension helper for functions returning size_t
// this is a workaround for size_t not being properly supported in ffi. IntPtr
// almost works, but is sign extended.
extension Bindings on DynamicLibrary {
  int Function() lookupSizet(String symbolName) => sizeOf<IntPtr>() == 4
      ? this.lookup<NativeFunction<Uint32 Function()>>(symbolName).asFunction()
      : this.lookup<NativeFunction<Uint64 Function()>>(symbolName).asFunction();
}
