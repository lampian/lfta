import 'package:flutter_test/flutter_test.dart';
import 'package:isconnected/isconnected.dart';
import 'package:isconnected/isconnected_platform_interface.dart';
import 'package:isconnected/isconnected_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIsconnectedPlatform
    with MockPlatformInterfaceMixin
    implements IsconnectedPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IsconnectedPlatform initialPlatform = IsconnectedPlatform.instance;

  test('$MethodChannelIsconnected is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIsconnected>());
  });

  test('getPlatformVersion', () async {
    Isconnected isconnectedPlugin = Isconnected();
    MockIsconnectedPlatform fakePlatform = MockIsconnectedPlatform();
    IsconnectedPlatform.instance = fakePlatform;

    expect(await isconnectedPlugin.getPlatformVersion(), '42');
  });
}
