# volume_flash_plugin

      A Flutter package for volume control and flashlight toggle.
      This package provides easy-to-use widgets for adjusting volume and toggling
      the flashlight on both Android and iOS devices. It includes customizable buttons
      for increasing and decreasing volume, as well as a button for toggling the flashlight.
      The [AudioTesting] widget allows developers to easily integrate volume control
      and flashlight toggling functionality into their Flutter applications. 

volume_flash_plugin, volume_flash_plugin.VolumeFlashPlugin, volume_flash_plugin.VolumeFlashPlugin.VolumeFlashPlugin, volume_flash_plugin.VolumeFlashPlugin.alignment, volume_flash_plugin.VolumeFlashPlugin.buttonBackgroundColor.
    Example:

 ```dart
class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}
class _ExampleScreenState extends State<ExampleScreen> {
  bool _isFlashlightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                onPressed: ()async{
                  await  VolumeFlashPlugin.increaseVolume();
                },
                text: "Increase Volume",
              ),
              _buildButton(
                onPressed: ()async{
                  await  VolumeFlashPlugin.decreaseVolume();
                },
                text: "Decrease Volume",
              ),
              _buildButton(
                onPressed: ()async{
                  await  VolumeFlashPlugin.toggleFlashlight(_isFlashlightOn);
                  bool result = await VolumeFlashPlugin.toggleFlashlight(_isFlashlightOn);
                  setState(() {
                    _isFlashlightOn = result;
                  });
                },
                text: "Flash Light",
              ),
            ],
          ),
        )
    );
  }
  Widget _buildButton({required VoidCallback onPressed, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0.0,
          padding: const EdgeInsets.all(2),
          backgroundColor: Colors.orange,
          minimumSize: const Size(double.infinity, 50.0),
        ),
        child: Text(text, style:  const TextStyle(color: Colors.white)),
      ),
    );
  }
}

 ```

    For more information, see the full documentation at:
    [https://github.com/shahzaibNiazi/audio_flash_manager/tree/master](https://github.com/shahzaibNiazi/audio_flash_manager/tree/master)
 
    See also:

    - [AudioTesting], a widget for controlling volume and flashlight.

import 'package:flutter/material.dart';


