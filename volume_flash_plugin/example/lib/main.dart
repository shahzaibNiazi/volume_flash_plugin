import 'package:flutter/material.dart';
import 'package:volume_flash_plugin/volume_flash_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return VolumeFlashPlugin(
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
      buttonBackgroundColor: Colors.orange,
    );
  }
}