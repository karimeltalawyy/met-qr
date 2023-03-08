import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../screens/student/qr scan/qr_scan_screen.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({Key? key}) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  // final qrController = TextEditingController();

  // final qrKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;
  // Barcode? result;
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  // @override
  // void reassemble() async {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     await controller!.pauseCamera();
  //   }
  //   controller!.resumeCamera();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const QrScanPage());
      },
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: BoxDecoration(
            color: defaultColor, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              'Scan Qr Code',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  // Future showSheet(context) => showSlidingBottomSheet(
  //       context,
  //       builder: (context) => SlidingSheetDialog(
  //         avoidStatusBar: true,
  //         cornerRadius: 15,
  //         snapSpec: const SnapSpec(
  //           initialSnap: 0.9,
  //           snappings: [.4, 0.9],
  //         ),
  //         builder: buildSheet,
  //       ),
  //     );

  // Widget buildSheet(context, state) => SizedBox(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       child: Padding(
  //         padding: const EdgeInsets.all(basePadding),
  //         child: Column(
  //           children: [
  //             Text(
  //               'Scan the qr code',
  //               style: Theme.of(context).textTheme.titleLarge,
  //             ),
  //             const SizedBox(height: 6),
  //             Text(
  //               'Scan QR code now to take attendance in this lecture',
  //               style: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             const SizedBox(height: 12),
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height,
  //               color: Colors.black,
  //               child: Column(
  //                 children: <Widget>[
  //                   Expanded(
  //                     flex: 5,
  //                     child: Container(
  //                       width: MediaQuery.of(context).size.width,
  //                       height: MediaQuery.of(context).size.height,
  //                       padding: const EdgeInsets.all(basePadding),
  //                       decoration: BoxDecoration(color: Colors.grey.shade100),
  //                       child: QRView(
  //                         key: qrKey,
  //                         onQRViewCreated: onQRViewCreated,
  //                         overlay: QrScannerOverlayShape(
  //                           borderWidth: 10,
  //                           borderLength: 20,
  //                           borderRadius: 15,
  //                           borderColor: defaultColor,
  //                           cutOutSize: MediaQuery.of(context).size.width * .8,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 1,
  //                     child: Center(
  //                       child: (result != null)
  //                           ? Text(
  //                               'Barcode type: ${describeEnum(result!.format)} Data : ${result!.code}')
  //                           : const Text('Scan a code'),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // void onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     debugPrint('xxxxxxxxx => ${scanData.toString()}');
  //   });
  // }
}
