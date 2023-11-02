import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'isconnected_method_channel.dart';

abstract class IsconnectedPlatform extends PlatformInterface {
  /// Constructs a IsconnectedPlatform.
  IsconnectedPlatform() : super(token: _token);

  static final Object _token = Object();

  static IsconnectedPlatform _instance = MethodChannelIsconnected();

  /// The default instance of [IsconnectedPlatform] to use.
  ///
  /// Defaults to [MethodChannelIsconnected].
  static IsconnectedPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IsconnectedPlatform] when
  /// they register themselves.
  static set instance(IsconnectedPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
