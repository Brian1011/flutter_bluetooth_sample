import 'package:flutter/cupertino.dart';
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
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text(
                "Detect devices",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text("Bluetooth"),
          ],
        ),
      ),
    );
  }
}
