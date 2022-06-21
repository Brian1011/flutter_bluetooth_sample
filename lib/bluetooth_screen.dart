import 'package:flutter/material.dart';

class BlueToothScreen extends StatefulWidget {
  const BlueToothScreen({Key? key}) : super(key: key);

  @override
  State<BlueToothScreen> createState() => _BlueToothScreenState();
}

class _BlueToothScreenState extends State<BlueToothScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth detector"),
      ),
      body: Container(
        child: const Text("Bluetooth"),
      ),
    );
  }
}
