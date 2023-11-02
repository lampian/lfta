import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'isconnected_platform_interface.dart';

/// An implementation of [IsconnectedPlatform] that uses method channels.
class MethodChannelIsconnected extends IsconnectedPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('isconnected');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
