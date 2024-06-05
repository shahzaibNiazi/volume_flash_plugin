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
                onPressed: () async {
                  await VolumeFlashPlugin.increaseVolume();
                },
                text: "Increase Volume",
              ),
              _buildButton(
                onPressed: () async {
                  await VolumeFlashPlugin.decreaseVolume();
                },
                text: "Decrease Volume",
              ),
              _buildButton(
                onPressed: () async {
                  await VolumeFlashPlugin.toggleFlashlight(_isFlashlightOn);
                  bool result =
                      await VolumeFlashPlugin.toggleFlashlight(_isFlashlightOn);
                  setState(() {
                    _isFlashlightOn = result;
                  });
                },
                text: "Flash Light",
              ),
            ],
          ),
        ));
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
          backgroundColor: Colors.red,
          minimumSize: const Size(200, 50.0),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
