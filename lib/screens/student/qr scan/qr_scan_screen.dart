import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrController = TextEditingController();

  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        backgroundColor: surfaceColor,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 20,
          width: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: Column(
          children: <Widget>[
            Text(
              'Scan The QR Code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Scan the QR code to take your attendance to this lecture.',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 26),
            Expanded(
              flex: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(basePadding),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderWidth: 10,
                    borderLength: 30,
                    borderRadius: 15,
                    borderColor: defaultColor,
                    cutOutSize: MediaQuery.of(context).size.width * .85,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(baseMargin),
                          padding: const EdgeInsets.all(basePadding),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: chipTwoColor,
                          ),
                          child: Text(
                              'Barcode type: ${describeEnum(result!.format)} Data : ${result!.code}'),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(baseMargin),
                        padding: const EdgeInsets.all(basePadding),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Text(
                          'Make sure you put the qr code inside the box!',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        )),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      debugPrint('xxxxxxxxx => ${scanData.toString()}');
    });
  }
}
