import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class VolumeFlashPlugin {
  static const platform = MethodChannel('samples.flutter.dev/volume');

static  Future<bool> toggleFlashlight(bool isFlashlightOn) async {
    try {
      final bool result = await platform.invokeMethod('toggleFlashlight', {'isOn': !isFlashlightOn});
      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to toggle flashlight: '${e.message}'.");
      }
      return isFlashlightOn;
    }
  }

  static Future<void> increaseVolume() async {
    try {
      await platform.invokeMethod('increaseVolume');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to increase volume: '${e.message}'.");
      }
    }
  }

  static Future<void> decreaseVolume() async {
    try {
      await platform.invokeMethod('decreaseVolume');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to decrease volume: '${e.message}'.");
      }
    }
  }
}
