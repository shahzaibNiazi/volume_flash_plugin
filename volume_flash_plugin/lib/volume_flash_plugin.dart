import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VolumeFlashPlugin extends StatefulWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final TextStyle? buttonTextStyle;
  final Color? buttonBackgroundColor;
  final bool showIncreaseVolumeButton;
  final bool showDecreaseVolumeButton;
  final bool showFlashlightButton;
  final String increaseVolumeButtonText;
  final String decreaseVolumeButtonText;
  final String flashlightButtonText;
  final EdgeInsetsGeometry? padding;
  final RoundedRectangleBorder? shape;
  final TextStyle? textStyle;
  final Color? shadowColor;
  final AlignmentGeometry? alignment;
  final double? elevation;
  final BorderSide? side;

  const VolumeFlashPlugin({
    super.key,
    this.shape,
    this.side,
    this.elevation,
    this.alignment,
    this.textStyle,
    this.buttonHeight,
    this.shadowColor,
    this.buttonWidth,
    this.padding,
    this.buttonTextStyle,
    this.buttonBackgroundColor,
    this.showIncreaseVolumeButton = true,
    this.showDecreaseVolumeButton = true,
    this.showFlashlightButton = true,
    this.increaseVolumeButtonText = 'Increase Volume',
    this.decreaseVolumeButtonText = 'Decrease Volume',
    this.flashlightButtonText = 'Flashlight',
  });

  @override
  State<VolumeFlashPlugin> createState() => _VolumeFlashPluginState();
}

class _VolumeFlashPluginState extends State<VolumeFlashPlugin> {
  static const platform = MethodChannel('samples.flutter.dev/volume');
  bool _isFlashlightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.showIncreaseVolumeButton)
              _buildButton(
                onPressed: _increaseVolume,
                text: widget.increaseVolumeButtonText,
              ),
            if (widget.showDecreaseVolumeButton)
              _buildButton(
                onPressed: _decreaseVolume,
                text: widget.decreaseVolumeButtonText,
              ),
            if (widget.showFlashlightButton)
             // IconButton(onPressed: (){}, icon: const Icon(Icons.flashlight_on_rounded)),
              _buildButton(
                onPressed: _toggleFlashlight,
                text: widget.flashlightButtonText,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required VoidCallback onPressed, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: widget.shape,
          textStyle: widget.textStyle,
          alignment: widget.alignment,
          side: widget.side,
          shadowColor: widget.shadowColor,
          elevation: widget.elevation ?? 0.0,
          padding: widget.padding ?? const EdgeInsets.all(2),
          backgroundColor: widget.buttonBackgroundColor ,
          minimumSize: Size(
            widget.buttonWidth ?? double.infinity,
            widget.buttonHeight ?? 50.0,
          ),
        ),
        child: Text(
          text,
          style: widget.buttonTextStyle ?? const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _toggleFlashlight() async {
    try {
      final bool result = await platform
          .invokeMethod('toggleFlashlight', {'isOn': !_isFlashlightOn});
      setState(() {
        _isFlashlightOn = result;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to toggle flashlight: '${e.message}'.");
      }
    }
  }

  Future<void> _increaseVolume() async {
    try {
      await platform.invokeMethod('increaseVolume');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to increase volume: '${e.message}'.");
      }
    }
  }

  Future<void> _decreaseVolume() async {
    try {
      await platform.invokeMethod('decreaseVolume');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to decrease volume: '${e.message}'.");
      }
    }
  }
}
