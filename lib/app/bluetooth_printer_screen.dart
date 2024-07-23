import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:ivorypay/app/reciept.dart';

class ReceiptPrinterScreen extends StatefulWidget {
  const ReceiptPrinterScreen({super.key});

  @override
  _ReceiptPrinterScreenState createState() {
    return _ReceiptPrinterScreenState();
  }
}

class _ReceiptPrinterScreenState extends State<ReceiptPrinterScreen> {
  BluetoothDevice? _selectedDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt Printer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<BluetoothDevice>(
              hint: const Text('Select Bluetooth Device'),
              value: _selectedDevice,
              items: _getDeviceItems(),
              onChanged: (device) {
                setState(() {
                  _selectedDevice = device;
                });
              },
            ),
            ElevatedButton(
              onPressed: _selectedDevice == null ? null : _printReceipt,
              child: const Text('Print Receipt'),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<BluetoothDevice> devices = []; // Fetch your Bluetooth devices here
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (devices.isNotEmpty) {
      for (BluetoothDevice device in devices) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name ?? ''),
        ));
      }
    } else {
      items.add(const DropdownMenuItem(
        child: Text('No devices'),
      ));
    }
    return items;
  }

  Future<void> _printReceipt() async {
    if (_selectedDevice != null) {
      // Connect to the selected Bluetooth device
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(_selectedDevice!.address);

      // Create the receipt
      final profile = await CapabilityProfile.load();
      const PaperSize paper = PaperSize.mm80;
      final List<int> bytes = await generateReceipt(paper, profile);

      // Send the receipt to the printer
      connection.output.add(Uint8List.fromList(bytes));
      await connection.output.allSent;

      // Close the connection
      connection.finish();
    }
  }
}
