
import 'isconnected_platform_interface.dart';

class Isconnected {
  Future<String?> getPlatformVersion() {
    return IsconnectedPlatform.instance.getPlatformVersion();
  }
}
