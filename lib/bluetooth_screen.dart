import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BlueToothScreen extends StatefulWidget {
  const BlueToothScreen({Key? key}) : super(key: key);

  @override
  State<BlueToothScreen> createState() => _BlueToothScreenState();
}

class _BlueToothScreenState extends State<BlueToothScreen> {
  // create flutter blue instance
  FlutterBlue flutterBlue = FlutterBlue.instance;

  // list of scanned devices
  List<BluetoothDevice> bluetoothDevices = [];

  bool _isScanning = false;

  bool get isScanning => _isScanning;

  set isScanning(bool value) {
    _isScanning = value;
    setState(() {});
  } // scanDevices

  scanDevice() async {
    isScanning = true;
    bluetoothDevices = [];
    await flutterBlue.startScan(timeout: const Duration(seconds: 4));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // add device to list of devices
      for (ScanResult scanResult in results) {
        bluetoothDevices.add(scanResult.device);
      }
    });

    isScanning = false;
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _isScanning
                ? [
                    // loading spinner
                    const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  ]
                : [
                    bluetoothDevices.isNotEmpty
                        ? Expanded(
                            child: ListView(
                              children: [
                                ...bluetoothDevices
                                    .map((bluetoothDevice) => Card(
                                          child: ListTile(
                                            title: Text(bluetoothDevice
                                                    .name.isEmpty
                                                ? "No device name - ${bluetoothDevice.id}"
                                                : bluetoothDevice.name),
                                          ),
                                        ))
                                    .toList(),
                              ],
                            ),
                          )
                        : TextButton(
                            onPressed: scanDevice,
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(150, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            child: const Text(
                              "Detect devices",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                  ],
          )),
    );
  }
}
