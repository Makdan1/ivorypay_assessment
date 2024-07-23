import 'package:flutter/material.dart';
import 'package:ivorypay/app/bluetooth_printer_screen.dart';
import 'package:ivorypay/app/widgets/custom_button.dart';
import 'package:ivorypay/services/navigation/animated_navigation.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _MyAppState();
}

class _MyAppState extends State<QrScreen> {
  String? _scanValue;
  final AnimatedNavigation _navigation = AnimatedNavigation();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Scanner'),
        ),
        body: Column(
          children: [
            SizedBox(
                height: 300,
                child: QRCodeDartScanView(
                  scanInvertedQRCode: true,
                  typeScan: TypeScan
                      .live, // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)
                  onCapture: (Result result) {
                    setState(() {
                      _scanValue = result.text;
                    });
                  },
                )),
            const SizedBox(
              height: 100,
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  _scanValue ?? 'Kindly scan a QR Banner to get your result',
                  style: const TextStyle(fontSize: 15),
                ))),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              onPressed: () {
                _navigation.navigateTo(
                  slideFromBottom: true,
                  context: context,
                  destinationScreen: const ReceiptPrinterScreen(),
                );
              },
              label: "Printing Screen",
            )
          ],
        ),
      ),
    );
  }
}
