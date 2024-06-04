import 'package:flutter_test/flutter_test.dart';
import 'package:volume_flash_plugin/volume_flash_plugin.dart';
import 'package:volume_flash_plugin/volume_flash_plugin_platform_interface.dart';
import 'package:volume_flash_plugin/volume_flash_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVolumeFlashPluginPlatform
    with MockPlatformInterfaceMixin
    implements VolumeFlashPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VolumeFlashPluginPlatform initialPlatform = VolumeFlashPluginPlatform.instance;

  test('$MethodChannelVolumeFlashPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVolumeFlashPlugin>());
  });

  test('getPlatformVersion', () async {
    VolumeFlashPlugin volumeFlashPlugin = VolumeFlashPlugin();
    MockVolumeFlashPluginPlatform fakePlatform = MockVolumeFlashPluginPlatform();
    VolumeFlashPluginPlatform.instance = fakePlatform;

    expect(await volumeFlashPlugin.getPlatformVersion(), '42');
  });
}
