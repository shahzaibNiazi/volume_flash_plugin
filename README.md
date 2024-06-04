      A Flutter package for volume control and flashlight toggle.
      This package provides easy-to-use widgets for adjusting volume and toggling
      the flashlight on both Android and iOS devices. It includes customizable buttons
      for increasing and decreasing volume, as well as a button for toggling the flashlight.
      The [AudioTesting] widget allows developers to easily integrate volume control
      and flashlight toggling functionality into their Flutter applications. 

     audio_flash_manager, audio_flash_manager.MyApp, audio_flash_manager.MyApp.MyApp, audio_flash_manager.main, audio_testing

    Example:

 ```dart
 class AudioFlashManager extends StatelessWidget {
   const AudioFlashManager({super.key});

   @override
   Widget build(BuildContext context) {
     return AudioTesting(
       showIncreaseVolumeButton: true,
       showDecreaseVolumeButton: true,
       showFlashlightButton: true,
       flashlightButtonText: "Flash Light",
       decreaseVolumeButtonText: "Decrease Volume",
       increaseVolumeButtonText: "Increase Volume",
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12),
       ),
       buttonWidth: 200,
       buttonBackgroundColor: Colors.red,
     );
   }
 }
 ```

    For more information, see the full documentation at:
    [https://github.com/shahzaibNiazi/audio_flash_manager/tree/master](https://github.com/shahzaibNiazi/audio_flash_manager/tree/master)
 
    See also:

    - [AudioTesting], a widget for controlling volume and flashlight.
library audio_flash_manager;

import 'package:flutter/material.dart';

